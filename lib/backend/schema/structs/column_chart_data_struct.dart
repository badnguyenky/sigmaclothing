// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ColumnChartDataStruct extends FFFirebaseStruct {
  ColumnChartDataStruct({
    String? xValue,
    int? y1Value,
    int? y2Value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _xValue = xValue,
        _y1Value = y1Value,
        _y2Value = y2Value,
        super(firestoreUtilData);

  // "xValue" field.
  String? _xValue;
  String get xValue => _xValue ?? '';
  set xValue(String? val) => _xValue = val;

  bool hasXValue() => _xValue != null;

  // "y1Value" field.
  int? _y1Value;
  int get y1Value => _y1Value ?? 0;
  set y1Value(int? val) => _y1Value = val;

  void incrementY1Value(int amount) => y1Value = y1Value + amount;

  bool hasY1Value() => _y1Value != null;

  // "y2Value" field.
  int? _y2Value;
  int get y2Value => _y2Value ?? 0;
  set y2Value(int? val) => _y2Value = val;

  void incrementY2Value(int amount) => y2Value = y2Value + amount;

  bool hasY2Value() => _y2Value != null;

  static ColumnChartDataStruct fromMap(Map<String, dynamic> data) =>
      ColumnChartDataStruct(
        xValue: data['xValue'] as String?,
        y1Value: castToType<int>(data['y1Value']),
        y2Value: castToType<int>(data['y2Value']),
      );

  static ColumnChartDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ColumnChartDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'xValue': _xValue,
        'y1Value': _y1Value,
        'y2Value': _y2Value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'xValue': serializeParam(
          _xValue,
          ParamType.String,
        ),
        'y1Value': serializeParam(
          _y1Value,
          ParamType.int,
        ),
        'y2Value': serializeParam(
          _y2Value,
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
        y1Value: deserializeParam(
          data['y1Value'],
          ParamType.int,
          false,
        ),
        y2Value: deserializeParam(
          data['y2Value'],
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
        y1Value == other.y1Value &&
        y2Value == other.y2Value;
  }

  @override
  int get hashCode => const ListEquality().hash([xValue, y1Value, y2Value]);
}

ColumnChartDataStruct createColumnChartDataStruct({
  String? xValue,
  int? y1Value,
  int? y2Value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ColumnChartDataStruct(
      xValue: xValue,
      y1Value: y1Value,
      y2Value: y2Value,
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
