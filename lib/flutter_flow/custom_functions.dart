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
