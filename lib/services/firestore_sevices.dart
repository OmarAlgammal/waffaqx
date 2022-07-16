import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wafaq_x/models/mobile_model/mobile_model.dart';
import 'package:wafaq_x/utilities/constants/texts/api.dart';

class FirestoreServices {
  FirestoreServices._();

  static final instance = FirestoreServices._();

  final _fireStore = FirebaseFirestore.instance;

  Stream<T> documentStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? map) builder,
  }) {

    final reference = _fireStore.doc(path);
    final snapshot = reference.snapshots();
    return snapshot.map((doc) => builder(doc.data()));
  }

  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? map) builder,
    Query Function(Query query)? queryBuilder,
  }) {
    Query collections = _fireStore.collection(path);
    if (queryBuilder != null) {
      collections = queryBuilder(collections);
    }

    final snapshot = collections.snapshots();
    final result = snapshot.map((collections) => collections.docs
        .map((doc) {
      return builder(doc.data() as Map<String, dynamic>);
    })
        .where((element) => element != null)
        .toList());
    return result;
  }

  Future<List<T>> futureCollection<T>({required String path, required T Function(Map<String, dynamic>) builder}) async{
    final collection = await _fireStore.collection(path);
    final docs = await collection.get();
    final result = docs.docs.map((e) => builder(e.data())).toList();
    return result;
  }

  Future<List<List>> getCoverCollection() async{
    final collection = await _fireStore.collection(coversPath);
    final docs = await collection.get();
    final result = docs.docs.map((e) {
      List<dynamic> list = e.data()[compParameter];
      return list;
    }).toList();

    return result;
  }

  Future<void> setData(
      {required String path, required Map<String, dynamic> map}) async {
    final reference = _fireStore.doc(path);
    debugPrint('reference is ${reference.path}');
    await reference.set(map);
  }

  Future<void> deleteData({required String path}) async {
    final reference = _fireStore.doc(path);
    await reference.delete();
  }


}
