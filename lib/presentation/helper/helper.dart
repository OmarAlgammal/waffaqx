
import 'dart:math';

class Helper {

  toDouble(String text) {
    return double.parse(text);
  }

  List<String> splitTextToList({required String text}) {
    return text.split('-').toList();
  }

  int getRandomNumber(){
    Random random = Random();
    return random.nextInt(10000);
  }

  List<String> objectToList(dynamic myData) {

    List<String> myList = [];

    if (myData is String || myData is bool){
      print('my value is String or bool');
      myList.add(myData.toString());
    }else if (myData is List<String>){
      print('my value is list}');
      myData.forEach((element) {
        myList.add(element.toString());
      });
    }
    else{
      print('my value is custom object');
      myData.toJson().forEach((key, value) {
        myList.add(value.toString());
      });
    }

    print('my list is ${myList.toString()}');
    return myList;
  }
}
