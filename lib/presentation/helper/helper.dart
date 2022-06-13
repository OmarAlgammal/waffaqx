
class Helper {

  toDouble(String text) {
    return double.parse(text);
  }

  List<String> splitTextToList({required String text}) {
    return text.split('-').toList();
  }

  List<String> objectToList(dynamic myData) {

    List<String> myList = [];

    if (myData is String || myData is bool){
      myList.add(myData.toString());
    }else if (myData is List<String>){
      myData.forEach((element) {
        myList.add(element.toString());
      });
    }
    else{
      myData.toJson().forEach((key, value) {
        myList.add(value.toString());
      });
    }

    return myList;
  }
}
