
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wafaq_x/data/data_source/firebase_data_source.dart';
import 'package:wafaq_x/domain/repos/compatibilities_repository.dart';

class CompatibilitiesRepositoryImpl extends CompatibilitiesRepository{

  final FirebaseDataSource _firebaseDataSource;

  CompatibilitiesRepositoryImpl(this._firebaseDataSource);


  @override
  Future addCoversCompatibility({required String docId, required List<String> compatibilities}) async{
    await _firebaseDataSource.addCoversCompatibility(docId: docId, compatibilities: compatibilities);
  }

  @override
  Future<List<List<String>>> getCoversCompatibilitiesList() async{
    return await _firebaseDataSource.getCoversCompatibilitiesList();
  }

  @override
  Stream<List<List<String>>> getAllCoversCompatibilities() async*{
    yield* _firebaseDataSource.getAllCoversCompatibilities();
  }

  @override
  Future<void> deleteCoversCollections({required List<String> compatibilities, required int index}) async{
    await _firebaseDataSource.deleteCoversCollections(compatibilities: compatibilities, index: index);

  }

}