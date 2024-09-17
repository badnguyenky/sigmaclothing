import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JobsRecord extends FirestoreRecord {
  JobsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "job_name" field.
  String? _jobName;
  String get jobName => _jobName ?? '';
  bool hasJobName() => _jobName != null;

  // "style_no" field.
  String? _styleNo;
  String get styleNo => _styleNo ?? '';
  bool hasStyleNo() => _styleNo != null;

  // "cell_ref" field.
  DocumentReference? _cellRef;
  DocumentReference? get cellRef => _cellRef;
  bool hasCellRef() => _cellRef != null;

  // "target_per_day" field.
  int? _targetPerDay;
  int get targetPerDay => _targetPerDay ?? 0;
  bool hasTargetPerDay() => _targetPerDay != null;

  // "target_per_hour" field.
  int? _targetPerHour;
  int get targetPerHour => _targetPerHour ?? 0;
  bool hasTargetPerHour() => _targetPerHour != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "completion_time" field.
  DateTime? _completionTime;
  DateTime? get completionTime => _completionTime;
  bool hasCompletionTime() => _completionTime != null;

  // "scores" field.
  List<ScoreStruct>? _scores;
  List<ScoreStruct> get scores => _scores ?? const [];
  bool hasScores() => _scores != null;

  // "completionStatus" field.
  bool? _completionStatus;
  bool get completionStatus => _completionStatus ?? false;
  bool hasCompletionStatus() => _completionStatus != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _jobName = snapshotData['job_name'] as String?;
    _styleNo = snapshotData['style_no'] as String?;
    _cellRef = snapshotData['cell_ref'] as DocumentReference?;
    _targetPerDay = castToType<int>(snapshotData['target_per_day']);
    _targetPerHour = castToType<int>(snapshotData['target_per_hour']);
    _status = snapshotData['status'] as bool?;
    _completionTime = snapshotData['completion_time'] as DateTime?;
    _scores = getStructList(
      snapshotData['scores'],
      ScoreStruct.fromMap,
    );
    _completionStatus = snapshotData['completionStatus'] as bool?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('jobs');

  static Stream<JobsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JobsRecord.fromSnapshot(s));

  static Future<JobsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JobsRecord.fromSnapshot(s));

  static JobsRecord fromSnapshot(DocumentSnapshot snapshot) => JobsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JobsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JobsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JobsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JobsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJobsRecordData({
  int? id,
  String? jobName,
  String? styleNo,
  DocumentReference? cellRef,
  int? targetPerDay,
  int? targetPerHour,
  bool? status,
  DateTime? completionTime,
  bool? completionStatus,
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'job_name': jobName,
      'style_no': styleNo,
      'cell_ref': cellRef,
      'target_per_day': targetPerDay,
      'target_per_hour': targetPerHour,
      'status': status,
      'completion_time': completionTime,
      'completionStatus': completionStatus,
      'created_at': createdAt,
      'updated_at': updatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class JobsRecordDocumentEquality implements Equality<JobsRecord> {
  const JobsRecordDocumentEquality();

  @override
  bool equals(JobsRecord? e1, JobsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.jobName == e2?.jobName &&
        e1?.styleNo == e2?.styleNo &&
        e1?.cellRef == e2?.cellRef &&
        e1?.targetPerDay == e2?.targetPerDay &&
        e1?.targetPerHour == e2?.targetPerHour &&
        e1?.status == e2?.status &&
        e1?.completionTime == e2?.completionTime &&
        listEquality.equals(e1?.scores, e2?.scores) &&
        e1?.completionStatus == e2?.completionStatus &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt;
  }

  @override
  int hash(JobsRecord? e) => const ListEquality().hash([
        e?.id,
        e?.jobName,
        e?.styleNo,
        e?.cellRef,
        e?.targetPerDay,
        e?.targetPerHour,
        e?.status,
        e?.completionTime,
        e?.scores,
        e?.completionStatus,
        e?.createdAt,
        e?.updatedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is JobsRecord;
}
