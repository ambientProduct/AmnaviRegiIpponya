import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MenuItemsRecord extends FirestoreRecord {
  MenuItemsRecord._(
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

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "on_sale" field.
  bool? _onSale;
  bool get onSale => _onSale ?? false;
  bool hasOnSale() => _onSale != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "ProductPhotos" field.
  String? _productPhotos;
  String get productPhotos => _productPhotos ?? '';
  bool hasProductPhotos() => _productPhotos != null;

  // "modifires" field.
  List<String>? _modifires;
  List<String> get modifires => _modifires ?? const [];
  bool hasModifires() => _modifires != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _onSale = snapshotData['on_sale'] as bool?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _productPhotos = snapshotData['ProductPhotos'] as String?;
    _modifires = getDataList(snapshotData['modifires']);
    _category = snapshotData['category'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('MenuItems');

  static Stream<MenuItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MenuItemsRecord.fromSnapshot(s));

  static Future<MenuItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MenuItemsRecord.fromSnapshot(s));

  static MenuItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MenuItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MenuItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MenuItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MenuItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MenuItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMenuItemsRecordData({
  String? name,
  String? description,
  double? price,
  bool? onSale,
  int? quantity,
  String? productPhotos,
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'on_sale': onSale,
      'quantity': quantity,
      'ProductPhotos': productPhotos,
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class MenuItemsRecordDocumentEquality implements Equality<MenuItemsRecord> {
  const MenuItemsRecordDocumentEquality();

  @override
  bool equals(MenuItemsRecord? e1, MenuItemsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price &&
        e1?.onSale == e2?.onSale &&
        e1?.quantity == e2?.quantity &&
        e1?.productPhotos == e2?.productPhotos &&
        listEquality.equals(e1?.modifires, e2?.modifires) &&
        e1?.category == e2?.category;
  }

  @override
  int hash(MenuItemsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.price,
        e?.onSale,
        e?.quantity,
        e?.productPhotos,
        e?.modifires,
        e?.category
      ]);

  @override
  bool isValidKey(Object? o) => o is MenuItemsRecord;
}
