
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wafaq_x/data/entities/admin_model/admin_model.dart';
import 'package:wafaq_x/data/entities/mobile_model.dart';

class FirebaseDataSource {

  CollectionReference<
      Map<String, dynamic>> mobilesCollection = FirebaseFirestore.instance
      .collection('Mobiles');

  CollectionReference<Map<String, dynamic>> adminsCollection = FirebaseFirestore.instance.collection('Admins');

  CollectionReference<Map<String, dynamic>> coversCompatibilitiesCollection = FirebaseFirestore.instance.collection('Covers Compatibilities');
  CollectionReference<Map<String, dynamic>> glassCompatibilitiesCollection = FirebaseFirestore.instance.collection('Glass Compatibilities');


  Future addMobile({required MobileModel mobileModel}) async{
    return await mobilesCollection
        .doc(mobileModel.mobileId)
        .set(mobileModel.toJson());
  }

  Future<List<MobileModel>> getAllMobiles() async{
    return await mobilesCollection.get().then((docs) {
      return docs.docs.map((collection) {
        return MobileModel.fromJson(collection.data());
      }).toList();
    });
    // yield* mobilesCollection.snapshots().map((snapshot) {
    //   return snapshot.docs.map((mobile) {
    //     return MobileModel.fromJson(mobile.data());
    //   }).toList();
    // });
  }

  Future<MobileModel> getMobile({required String docId}) async{
    DocumentSnapshot<Map<String, dynamic>> map = await mobilesCollection.doc(docId).get();
    return MobileModel.fromJson(map.data()!);
  }


  Future<bool> adminLogin({required String email, required String password}) async{
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await adminsCollection.doc(email).get(const GetOptions(source: Source.serverAndCache));
    if (documentSnapshot.exists){
      String _email = documentSnapshot.get('email');
      String _password = documentSnapshot.get('password');
      if (_email == email && _password == password){
        return true;
      }
      return false;
    }
    return false;
  }

  Future<List<AdminModel>> getAdmins() async{
    return await adminsCollection.get().then((docs) {
      return docs.docs.map((collection) {
       return AdminModel.fromJson(collection.data());
      }).toList();
    });
  }

  Future<void> setAdmin({required AdminModel adminModel}) async{
    return await adminsCollection
        .doc(adminModel.email)
        .set(adminModel.toJson());
  }


  Stream<List<List<String>>> getAllCoversCompatibilities() async*{
    yield* coversCompatibilitiesCollection.snapshots().map((collections) {
      return collections.docs.map((doc) {
        print('here ${doc.data().values.toString()}');
        List<dynamic> list = doc.data().values.toList()[0];
        print('list is ${list.toString()}');
        return list.cast<String>();
      }).toList();
    });

  }

  Future<void> deleteCoversCollections({required List<String> compatibilities, required int index}) async{
    await coversCompatibilitiesCollection.doc(compatibilities.first).delete();
  }

  Future<List<List<String>>> getCoversCompatibilitiesList() async{
    List<List<String>> compatibilities = [];
    QuerySnapshot<Map<String, dynamic>> querySnapShotDocs = await coversCompatibilitiesCollection.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = querySnapShotDocs.docs.map((document) => document).toList();

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in docs){
      Iterable iterable = doc.data().values;
      List list = iterable.elementAt(0) as List;
      List<String> myList = list.cast<String>();
      compatibilities.add(myList);
    }
    return compatibilities;
  }

  Future<void> addCoversCompatibility({required String docId, required List<String> compatibilities}) async {
    await coversCompatibilitiesCollection.doc(docId).set({'covers': compatibilities});
  }
}