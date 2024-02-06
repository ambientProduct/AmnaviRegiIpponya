import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemDetailRecord extends FirestoreRecord {
  ItemDetailRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "specifications" field.
  String? _specifications;
  String get specifications => _specifications ?? '';
  bool hasSpecifications() => _specifications != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "tableNo" field.
  String? _tableNo;
  String get tableNo => _tableNo ?? '';
  bool hasTableNo() => _tableNo != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "State" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "Served" field.
  bool? _served;
  bool get served => _served ?? false;
  bool hasServed() => _served != null;

  // "orderTime" field.
  DateTime? _orderTime;
  DateTime? get orderTime => _orderTime;
  bool hasOrderTime() => _orderTime != null;

  // "modifire" field.
  String? _modifire;
  String get modifire => _modifire ?? '';
  bool hasModifire() => _modifire != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _specifications = snapshotData['specifications'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _quantity = castToType<int>(snapshotData['quantity']);
    _tableNo = snapshotData['tableNo'] as String?;
    _photo = snapshotData['photo'] as String?;
    _state = snapshotData['State'] as String?;
    _served = snapshotData['Served'] as bool?;
    _orderTime = snapshotData['orderTime'] as DateTime?;
    _modifire = snapshotData['modifire'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ItemDetail');

  static Stream<ItemDetailRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemDetailRecord.fromSnapshot(s));

  static Future<ItemDetailRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemDetailRecord.fromSnapshot(s));

  static ItemDetailRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ItemDetailRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItemDetailRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItemDetailRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemDetailRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemDetailRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemDetailRecordData({
  String? name,
  String? description,
  String? specifications,
  double? price,
  int? quantity,
  String? tableNo,
  String? photo,
  String? state,
  bool? served,
  DateTime? orderTime,
  String? modifire,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'specifications': specifications,
      'price': price,
      'quantity': quantity,
      'tableNo': tableNo,
      'photo': photo,
      'State': state,
      'Served': served,
      'orderTime': orderTime,
      'modifire': modifire,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItemDetailRecordDocumentEquality implements Equality<ItemDetailRecord> {
  const ItemDetailRecordDocumentEquality();

  @override
  bool equals(ItemDetailRecord? e1, ItemDetailRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.specifications == e2?.specifications &&
        e1?.price == e2?.price &&
        e1?.quantity == e2?.quantity &&
        e1?.tableNo == e2?.tableNo &&
        e1?.photo == e2?.photo &&
        e1?.state == e2?.state &&
        e1?.served == e2?.served &&
        e1?.orderTime == e2?.orderTime &&
        e1?.modifire == e2?.modifire;
  }

  @override
  int hash(ItemDetailRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.specifications,
        e?.price,
        e?.quantity,
        e?.tableNo,
        e?.photo,
        e?.state,
        e?.served,
        e?.orderTime,
        e?.modifire
      ]);

  @override
  bool isValidKey(Object? o) => o is ItemDetailRecord;
}
