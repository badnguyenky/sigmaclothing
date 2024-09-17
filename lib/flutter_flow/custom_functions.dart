import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

int sumScore(List<ScoreStruct>? scoreList) {
  // return sum of target_reached in scoreList
  int sum = 0;
  if (scoreList != null) {
    for (var score in scoreList) {
      sum += score.targetReached;
    }
  }
  return sum;
}

String scoreViewCalculation(
  int score,
  int targetPerHour,
) {
  if (score == targetPerHour) {
    return score.toString();
  }
  if (score < targetPerHour) {
    return "-${targetPerHour - score}";
  }
  if (score > targetPerHour) {
    return "+${score - targetPerHour}";
  }
  return "";
}

List<ColumnChartDataStruct>? cellChartData(
  List<JobsRecord> jobs,
  List<CellsRecord> cells,
) {
  final Map<String, Map<String, int>> cellsMap = {};

  // Initialize the cellsMap for each cell with 'completed' and 'incomplete' counters
  for (var cell in cells) {
    cellsMap[cell.cellName] = {'completed': 0, 'incomplete': 0};
  }

  // Iterate over the jobs and count the jobs for each cell
  for (var job in jobs) {
    // Assuming job.cellId corresponds to the cell's ID
    CellsRecord assignedCell =
        cells.firstWhere((cell) => cell.reference == job.cellRef);

    if (assignedCell != null) {
      final cellName = assignedCell.cellName;
      if (job.completionStatus == true && job.completionTime != null) {
        // Increment the completed jobs count for the cell
        cellsMap[cellName]!['completed'] =
            cellsMap[cellName]!['completed']! + 1;
      } else {
        // Increment the incomplete jobs count for the cell
        cellsMap[cellName]!['incomplete'] =
            cellsMap[cellName]!['incomplete']! + 1;
      }
    }
  }

  // Convert the cellsMap into ColumnChartDataStruct
  List<ColumnChartDataStruct> chartData = [];

  cellsMap.forEach((cellName, jobCount) {
    chartData.add(ColumnChartDataStruct(
      xValue: cellName, // Use the cell's name as the x-axis value
      y1Value: jobCount['completed']!, // Number of completed jobs
      y2Value: jobCount['incomplete']!, // Number of incomplete jobs
    ));
  });

  return chartData;
}

List<JobsRecord> calculateLeaderboard(List<JobsRecord> jobs) {
  List<JobsRecord> result = [];
  jobs.sort((a, b) {
    // For Job A
    int sumA = (a.scores?.isNotEmpty ?? false)
        ? a.scores!.map((score) => score.targetReached).reduce((a, b) => a + b)
        : 0;
    int diffA = sumA - a.targetPerDay;

    // For Job B
    int sumB = (b.scores?.isNotEmpty ?? false)
        ? b.scores!.map((score) => score.targetReached).reduce((a, b) => a + b)
        : 0;
    int diffB = sumB - b.targetPerDay;

    // Prioritize jobs that exceed their target
    if (diffA >= 0 && diffB < 0) {
      return -1; // Job A wins if A exceeded the target and B did not
    } else if (diffA < 0 && diffB >= 0) {
      return 1; // Job B wins if B exceeded the target and A did not
    } else {
      // Both either exceed or are below the target, compare by the absolute difference
      return diffA.abs().compareTo(diffB.abs());
    }
  });

  result = jobs;
  return result;
}

List<ChartDataStruct>? productionChartData(List<JobsRecord>? jobs) {
  if (jobs == null || jobs.isEmpty) {
    return null;
  }
  final Map<String, Map<String, int>> jobsMap = {};
  final DateFormat formatter = DateFormat('yMMM');
  final DateTime currentDate = DateTime.now();
  final DateTime startDate =
      DateTime(currentDate.year - 1, currentDate.month, 1);
  // Sort the jobs before processing
  jobs.sort((a, b) {
    DateTime dateA = a.completionStatus == true && a.completionTime != null
        ? a.completionTime!
        : a.createdAt!;
    DateTime dateB = b.completionStatus == true && b.completionTime != null
        ? b.completionTime!
        : b.createdAt!;
    return dateA.compareTo(dateB); // Sort by ascending date
  });
  for (var job in jobs) {
    if (job.completionStatus == true && job.completionTime != null) {
      if (job.completionTime!.isAfter(startDate)) {
        final String formattedDate = formatter.format(job.completionTime!);
        if (!jobsMap.containsKey(formattedDate)) {
          jobsMap[formattedDate] = {'completed': 0, 'incomplete': 0};
        }
        jobsMap[formattedDate]!['completed'] =
            jobsMap[formattedDate]!['completed']! + 1;
      }
    } else {
      final String formattedDate = formatter.format(job.createdAt!);
      if (!jobsMap.containsKey(formattedDate)) {
        jobsMap[formattedDate] = {'completed': 0, 'incomplete': 0};
      }
      jobsMap[formattedDate]!['incomplete'] =
          jobsMap[formattedDate]!['incomplete']! + 1;
    }
  }

  List<ChartDataStruct> chartData = [];

  jobsMap.forEach((key, value) {
    chartData.add(ChartDataStruct(
      xValue: key,
      y1Value: value['completed']!,
      y2Value: value['incomplete']!,
    ));
  });

  return chartData;
}

List<JobsRecord> sortJobs(
  List<JobsRecord> listToSort,
  bool isAsc,
  int sortColumnIndex,
) {
  switch (sortColumnIndex) {
    case 0:
      listToSort.sort((a, b) => a.id.compareTo(b.id));
      break;
    case 1:
      listToSort.sort((a, b) => a.jobName.compareTo(b.jobName));
      break;
    case 2:
      listToSort.sort((a, b) => a.styleNo.compareTo(b.styleNo));
      break;
    case 4:
      listToSort.sort((a, b) => a.targetPerDay.compareTo(b.targetPerDay));
      break;
    case 5:
      listToSort.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
      break;
    case 6:
      listToSort.sort((a, b) => a.updatedAt!.compareTo(b.updatedAt!));
      break;
    default:
      break;
  }
  if (!isAsc) {
    listToSort = listToSort.reversed.toList();
  }
  return listToSort;
}

List<CellsRecord> sortCells(
  List<CellsRecord> listToSort,
  bool isAsc,
  int sortColumnIndex,
) {
  switch (sortColumnIndex) {
    case 0:
      listToSort.sort((a, b) => a.id.compareTo(b.id));
      break;
    case 1:
      listToSort.sort((a, b) => a.cellName.compareTo(b.cellName));
      break;
    case 2:
      listToSort.sort((a, b) => a.createdDate!.compareTo(b.createdDate!));
      break;
    case 3:
      listToSort.sort((a, b) => a.updatedDate!.compareTo(b.updatedDate!));
      break;
    default:
      break;
  }
  if (!isAsc) {
    listToSort = listToSort.reversed.toList();
  }
  return listToSort;
}

List<ScoreStruct> reverseList(
  List<ScoreStruct> list,
  int numberOfItem,
) {
  // reverse score list
  List<ScoreStruct> newList = [];
  for (var i = numberOfItem + 1; i < list.length; i++) {
    newList.add(list[i]);
  }
  return newList;
}
