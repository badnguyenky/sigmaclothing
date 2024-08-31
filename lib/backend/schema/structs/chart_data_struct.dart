// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ChartDataStruct extends FFFirebaseStruct {
  ChartDataStruct({
    int? yValue,
    DateTime? xValue,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _yValue = yValue,
        _xValue = xValue,
        super(firestoreUtilData);

  // "yValue" field.
  int? _yValue;
  int get yValue => _yValue ?? 0;
  set yValue(int? val) => _yValue = val;

  void incrementYValue(int amount) => yValue = yValue + amount;

  bool hasYValue() => _yValue != null;

  // "xValue" field.
  DateTime? _xValue;
  DateTime? get xValue => _xValue;
  set xValue(DateTime? val) => _xValue = val;

  bool hasXValue() => _xValue != null;

  static ChartDataStruct fromMap(Map<String, dynamic> data) => ChartDataStruct(
        yValue: castToType<int>(data['yValue']),
        xValue: data['xValue'] as DateTime?,
      );

  static ChartDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ChartDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'yValue': _yValue,
        'xValue': _xValue,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'yValue': serializeParam(
          _yValue,
          ParamType.int,
        ),
        'xValue': serializeParam(
          _xValue,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static ChartDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChartDataStruct(
        yValue: deserializeParam(
          data['yValue'],
          ParamType.int,
          false,
        ),
        xValue: deserializeParam(
          data['xValue'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'ChartDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChartDataStruct &&
        yValue == other.yValue &&
        xValue == other.xValue;
  }

  @override
  int get hashCode => const ListEquality().hash([yValue, xValue]);
}

ChartDataStruct createChartDataStruct({
  int? yValue,
  DateTime? xValue,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChartDataStruct(
      yValue: yValue,
      xValue: xValue,
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
