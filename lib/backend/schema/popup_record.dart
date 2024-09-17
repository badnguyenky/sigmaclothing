import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PopupRecord extends FirestoreRecord {
  PopupRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _text = snapshotData['text'] as String?;
    _status = snapshotData['status'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('popup');

  static Stream<PopupRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PopupRecord.fromSnapshot(s));

  static Future<PopupRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PopupRecord.fromSnapshot(s));

  static PopupRecord fromSnapshot(DocumentSnapshot snapshot) => PopupRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PopupRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PopupRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PopupRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PopupRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPopupRecordData({
  String? text,
  bool? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': text,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class PopupRecordDocumentEquality implements Equality<PopupRecord> {
  const PopupRecordDocumentEquality();

  @override
  bool equals(PopupRecord? e1, PopupRecord? e2) {
    return e1?.text == e2?.text && e1?.status == e2?.status;
  }

  @override
  int hash(PopupRecord? e) => const ListEquality().hash([e?.text, e?.status]);

  @override
  bool isValidKey(Object? o) => o is PopupRecord;
}
