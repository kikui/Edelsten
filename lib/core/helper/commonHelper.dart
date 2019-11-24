class CommonHelper {
  int stringToInt(String string) {
    int intResult;
    for (var i = 0; i < string.length; i++) {
      print(int.parse(string[i]));
    }
  }
}