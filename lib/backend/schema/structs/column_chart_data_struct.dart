// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ColumnChartDataStruct extends FFFirebaseStruct {
  ColumnChartDataStruct({
    String? xValue,
    int? yValue,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _xValue = xValue,
        _yValue = yValue,
        super(firestoreUtilData);

  // "xValue" field.
  String? _xValue;
  String get xValue => _xValue ?? '';
  set xValue(String? val) => _xValue = val;

  bool hasXValue() => _xValue != null;

  // "yValue" field.
  int? _yValue;
  int get yValue => _yValue ?? 0;
  set yValue(int? val) => _yValue = val;

  void incrementYValue(int amount) => yValue = yValue + amount;

  bool hasYValue() => _yValue != null;

  static ColumnChartDataStruct fromMap(Map<String, dynamic> data) =>
      ColumnChartDataStruct(
        xValue: data['xValue'] as String?,
        yValue: castToType<int>(data['yValue']),
      );

  static ColumnChartDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ColumnChartDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'xValue': _xValue,
        'yValue': _yValue,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'xValue': serializeParam(
          _xValue,
          ParamType.String,
        ),
        'yValue': serializeParam(
          _yValue,
          ParamType.int,
        ),
      }.withoutNulls;

  static ColumnChartDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ColumnChartDataStruct(
        xValue: deserializeParam(
          data['xValue'],
          ParamType.String,
          false,
        ),
        yValue: deserializeParam(
          data['yValue'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ColumnChartDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ColumnChartDataStruct &&
        xValue == other.xValue &&
        yValue == other.yValue;
  }

  @override
  int get hashCode => const ListEquality().hash([xValue, yValue]);
}

ColumnChartDataStruct createColumnChartDataStruct({
  String? xValue,
  int? yValue,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ColumnChartDataStruct(
      xValue: xValue,
      yValue: yValue,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ColumnChartDataStruct? updateColumnChartDataStruct(
  ColumnChartDataStruct? columnChartData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    columnChartData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addColumnChartDataStructData(
  Map<String, dynamic> firestoreData,
  ColumnChartDataStruct? columnChartData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (columnChartData == null) {
    return;
  }
  if (columnChartData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && columnChartData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final columnChartDataData =
      getColumnChartDataFirestoreData(columnChartData, forFieldValue);
  final nestedData =
      columnChartDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = columnChartData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getColumnChartDataFirestoreData(
  ColumnChartDataStruct? columnChartData, [
  bool forFieldValue = false,
]) {
  if (columnChartData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(columnChartData.toMap());

  // Add any Firestore field values
  columnChartData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getColumnChartDataListFirestoreData(
  List<ColumnChartDataStruct>? columnChartDatas,
) =>
    columnChartDatas
        ?.map((e) => getColumnChartDataFirestoreData(e, true))
        .toList() ??
    [];
