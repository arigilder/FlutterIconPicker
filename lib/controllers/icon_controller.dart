import 'package:flutter/material.dart';

class FIPIconController with ChangeNotifier {
  FIPIconController({this.iconFilterFunction});

  Map<String, IconData> _icons = {};

  bool Function(String)? iconFilterFunction;

  Map<String, IconData> get icons => _icons;

  set icons(Map<String, IconData> val) {
    _icons = val;
    notifyListeners();
  }

  TextEditingController _searchTextController = TextEditingController();

  TextEditingController get searchTextController => _searchTextController;

  set searchTextController(TextEditingController val) {
    searchTextController = val;
    notifyListeners();
  }

  get length => _icons.length;

  get entries => _icons.entries;

  void addAll(Map<String, IconData> pack) {
    if (iconFilterFunction != null) {
      _icons.addEntries(
          pack.entries.where((entry) => !iconFilterFunction!(entry.key)));
    } else {
      _icons.addAll(pack);
    }
    notifyListeners();
  }

  void removeAll() {
    _icons.clear();
    notifyListeners();
  }
}
