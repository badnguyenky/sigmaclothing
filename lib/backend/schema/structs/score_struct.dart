// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ScoreStruct extends FFFirebaseStruct {
  ScoreStruct({
    DateTime? time,
    String? performance,
    int? targetReached,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _time = time,
        _performance = performance,
        _targetReached = targetReached,
        super(firestoreUtilData);

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  set time(DateTime? val) => _time = val;

  bool hasTime() => _time != null;

  // "performance" field.
  String? _performance;
  String get performance => _performance ?? '';
  set performance(String? val) => _performance = val;

  bool hasPerformance() => _performance != null;

  // "target_reached" field.
  int? _targetReached;
  int get targetReached => _targetReached ?? 0;
  set targetReached(int? val) => _targetReached = val;

  void incrementTargetReached(int amount) =>
      targetReached = targetReached + amount;

  bool hasTargetReached() => _targetReached != null;

  static ScoreStruct fromMap(Map<String, dynamic> data) => ScoreStruct(
        time: data['time'] as DateTime?,
        performance: data['performance'] as String?,
        targetReached: castToType<int>(data['target_reached']),
      );

  static ScoreStruct? maybeFromMap(dynamic data) =>
      data is Map ? ScoreStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'time': _time,
        'performance': _performance,
        'target_reached': _targetReached,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'time': serializeParam(
          _time,
          ParamType.DateTime,
        ),
        'performance': serializeParam(
          _performance,
          ParamType.String,
        ),
        'target_reached': serializeParam(
          _targetReached,
          ParamType.int,
        ),
      }.withoutNulls;

  static ScoreStruct fromSerializableMap(Map<String, dynamic> data) =>
      ScoreStruct(
        time: deserializeParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
        performance: deserializeParam(
          data['performance'],
          ParamType.String,
          false,
        ),
        targetReached: deserializeParam(
          data['target_reached'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ScoreStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ScoreStruct &&
        time == other.time &&
        performance == other.performance &&
        targetReached == other.targetReached;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([time, performance, targetReached]);
}

ScoreStruct createScoreStruct({
  DateTime? time,
  String? performance,
  int? targetReached,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ScoreStruct(
      time: time,
      performance: performance,
      targetReached: targetReached,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ScoreStruct? updateScoreStruct(
  ScoreStruct? score, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    score
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addScoreStructData(
  Map<String, dynamic> firestoreData,
  ScoreStruct? score,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (score == null) {
    return;
  }
  if (score.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && score.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final scoreData = getScoreFirestoreData(score, forFieldValue);
  final nestedData = scoreData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = score.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getScoreFirestoreData(
  ScoreStruct? score, [
  bool forFieldValue = false,
]) {
  if (score == null) {
    return {};
  }
  final firestoreData = mapToFirestore(score.toMap());

  // Add any Firestore field values
  score.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getScoreListFirestoreData(
  List<ScoreStruct>? scores,
) =>
    scores?.map((e) => getScoreFirestoreData(e, true)).toList() ?? [];
