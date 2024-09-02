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

  // Initialize an empty map to store the aggregated data
  final Map<DateTime, int> aggregatedData = {};

  // Get the current date
  final DateTime now = DateTime.now();

  // Calculate the start date (same month last year)
  final DateTime startDate = DateTime(now.year - 1, now.month);

  // Filter jobs and aggregate data by month
  for (final job in jobs) {
    final DateTime jobDate =
        job.createdAt!; // Assuming JobsRecord has a date property

    // Check if the job date is within the required range and if the job is completed
    if (jobDate.isAfter(startDate) &&
        jobDate.isBefore(now) &&
        job.completionStatus == true) {
      final DateTime monthKey = jobDate;

      // Aggregate completed jobs by month
      if (aggregatedData.containsKey(monthKey)) {
        aggregatedData[monthKey] = aggregatedData[monthKey]! + 1;
      } else {
        aggregatedData[monthKey] = 1;
      }
    }
  }
  aggregatedData.entries.map((entry) => print(entry.toString()));

  // Convert the map to a list of ChartDataStruct
  List<ChartDataStruct> chartDataList = aggregatedData.entries
      .map((entry) => ChartDataStruct(xValue: entry.key, yValue: entry.value))
      .toList();

  return chartDataList;
}
