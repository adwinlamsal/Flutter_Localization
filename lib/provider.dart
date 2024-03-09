import 'package:flutter/cupertino.dart';

class adwinprovider extends ChangeNotifier {
  String language = 'ne';

  ChangeLanguage(String value) {
    language = value;
    notifyListeners();
  }
}
