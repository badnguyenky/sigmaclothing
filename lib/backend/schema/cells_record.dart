import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CellsRecord extends FirestoreRecord {
  CellsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "cell_name" field.
  String? _cellName;
  String get cellName => _cellName ?? '';
  bool hasCellName() => _cellName != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "updated_date" field.
  DateTime? _updatedDate;
  DateTime? get updatedDate => _updatedDate;
  bool hasUpdatedDate() => _updatedDate != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  bool hasColor() => _color != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _cellName = snapshotData['cell_name'] as String?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _updatedDate = snapshotData['updated_date'] as DateTime?;
    _status = snapshotData['status'] as bool?;
    _color = getSchemaColor(snapshotData['color']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cells');

  static Stream<CellsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CellsRecord.fromSnapshot(s));

  static Future<CellsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CellsRecord.fromSnapshot(s));

  static CellsRecord fromSnapshot(DocumentSnapshot snapshot) => CellsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CellsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CellsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CellsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CellsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCellsRecordData({
  int? id,
  String? cellName,
  DateTime? createdDate,
  DateTime? updatedDate,
  bool? status,
  Color? color,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'cell_name': cellName,
      'created_date': createdDate,
      'updated_date': updatedDate,
      'status': status,
      'color': color,
    }.withoutNulls,
  );

  return firestoreData;
}

class CellsRecordDocumentEquality implements Equality<CellsRecord> {
  const CellsRecordDocumentEquality();

  @override
  bool equals(CellsRecord? e1, CellsRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.cellName == e2?.cellName &&
        e1?.createdDate == e2?.createdDate &&
        e1?.updatedDate == e2?.updatedDate &&
        e1?.status == e2?.status &&
        e1?.color == e2?.color;
  }

  @override
  int hash(CellsRecord? e) => const ListEquality().hash([
        e?.id,
        e?.cellName,
        e?.createdDate,
        e?.updatedDate,
        e?.status,
        e?.color
      ]);

  @override
  bool isValidKey(Object? o) => o is CellsRecord;
}
