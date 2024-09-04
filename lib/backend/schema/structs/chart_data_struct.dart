// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ChartDataStruct extends FFFirebaseStruct {
  ChartDataStruct({
    int? y1Value,
    String? xValue,
    int? y2Value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _y1Value = y1Value,
        _xValue = xValue,
        _y2Value = y2Value,
        super(firestoreUtilData);

  // "y1Value" field.
  int? _y1Value;
  int get y1Value => _y1Value ?? 0;
  set y1Value(int? val) => _y1Value = val;

  void incrementY1Value(int amount) => y1Value = y1Value + amount;

  bool hasY1Value() => _y1Value != null;

  // "xValue" field.
  String? _xValue;
  String get xValue => _xValue ?? '';
  set xValue(String? val) => _xValue = val;

  bool hasXValue() => _xValue != null;

  // "y2Value" field.
  int? _y2Value;
  int get y2Value => _y2Value ?? 0;
  set y2Value(int? val) => _y2Value = val;

  void incrementY2Value(int amount) => y2Value = y2Value + amount;

  bool hasY2Value() => _y2Value != null;

  static ChartDataStruct fromMap(Map<String, dynamic> data) => ChartDataStruct(
        y1Value: castToType<int>(data['y1Value']),
        xValue: data['xValue'] as String?,
        y2Value: castToType<int>(data['y2Value']),
      );

  static ChartDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ChartDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'y1Value': _y1Value,
        'xValue': _xValue,
        'y2Value': _y2Value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'y1Value': serializeParam(
          _y1Value,
          ParamType.int,
        ),
        'xValue': serializeParam(
          _xValue,
          ParamType.String,
        ),
        'y2Value': serializeParam(
          _y2Value,
          ParamType.int,
        ),
      }.withoutNulls;

  static ChartDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChartDataStruct(
        y1Value: deserializeParam(
          data['y1Value'],
          ParamType.int,
          false,
        ),
        xValue: deserializeParam(
          data['xValue'],
          ParamType.String,
          false,
        ),
        y2Value: deserializeParam(
          data['y2Value'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ChartDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChartDataStruct &&
        y1Value == other.y1Value &&
        xValue == other.xValue &&
        y2Value == other.y2Value;
  }

  @override
  int get hashCode => const ListEquality().hash([y1Value, xValue, y2Value]);
}

ChartDataStruct createChartDataStruct({
  int? y1Value,
  String? xValue,
  int? y2Value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChartDataStruct(
      y1Value: y1Value,
      xValue: xValue,
      y2Value: y2Value,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChartDataStruct? updateChartDataStruct(
  ChartDataStruct? chartData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chartData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChartDataStructData(
  Map<String, dynamic> firestoreData,
  ChartDataStruct? chartData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chartData == null) {
    return;
  }
  if (chartData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chartData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chartDataData = getChartDataFirestoreData(chartData, forFieldValue);
  final nestedData = chartDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chartData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChartDataFirestoreData(
  ChartDataStruct? chartData, [
  bool forFieldValue = false,
]) {
  if (chartData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chartData.toMap());

  // Add any Firestore field values
  chartData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChartDataListFirestoreData(
  List<ChartDataStruct>? chartDatas,
) =>
    chartDatas?.map((e) => getChartDataFirestoreData(e, true)).toList() ?? [];
