

abstract class CompatibilitiesRepository{


  Future<void> deleteCoversCollections({required List<String> compatibilities, required int index});

  Future addCoversCompatibility({required String docId, required List<String> compatibilities});

  Stream<List<List<String>>> getAllCoversCompatibilities();

  Future<List<List<String>>>  getCoversCompatibilitiesList();


}