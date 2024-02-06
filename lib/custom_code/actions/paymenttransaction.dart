// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future paymenttransaction(
  String updateCollection,
  String updateField,
  String currentState,
  String newState,
) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference collectionRef =
      firestore.collection(updateCollection);

  try {
    await firestore.runTransaction((transaction) async {
      QuerySnapshot querySnapshot =
          await collectionRef.where(updateField, isEqualTo: currentState).get();

      querySnapshot.docs.forEach((doc) {
        transaction.update(doc.reference, {updateField: newState});
      });
    });
  } catch (e) {
    // トランザクションの途中でエラーが発生した場合の処理
    print('Transaction failed: $e');
    throw Exception('Transaction failed: $e');
  }
}
