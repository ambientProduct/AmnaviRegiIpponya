import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TableListRecord extends FirestoreRecord {
  TableListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tableNo" field.
  String? _tableNo;
  String get tableNo => _tableNo ?? '';
  bool hasTableNo() => _tableNo != null;

  // "tableOn" field.
  bool? _tableOn;
  bool get tableOn => _tableOn ?? false;
  bool hasTableOn() => _tableOn != null;

  void _initializeFields() {
    _tableNo = snapshotData['tableNo'] as String?;
    _tableOn = snapshotData['tableOn'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tableList');

  static Stream<TableListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TableListRecord.fromSnapshot(s));

  static Future<TableListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TableListRecord.fromSnapshot(s));

  static TableListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TableListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TableListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TableListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TableListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TableListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTableListRecordData({
  String? tableNo,
  bool? tableOn,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tableNo': tableNo,
      'tableOn': tableOn,
    }.withoutNulls,
  );

  return firestoreData;
}

class TableListRecordDocumentEquality implements Equality<TableListRecord> {
  const TableListRecordDocumentEquality();

  @override
  bool equals(TableListRecord? e1, TableListRecord? e2) {
    return e1?.tableNo == e2?.tableNo && e1?.tableOn == e2?.tableOn;
  }

  @override
  int hash(TableListRecord? e) =>
      const ListEquality().hash([e?.tableNo, e?.tableOn]);

  @override
  bool isValidKey(Object? o) => o is TableListRecord;
}
