import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _Category = prefs.getStringList('ff_Category') ?? _Category;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _Category = ['Hello World', 'Hello Amnavi'];
  List<String> get Category => _Category;
  set Category(List<String> _value) {
    _Category = _value;
    prefs.setStringList('ff_Category', _value);
  }

  void addToCategory(String _value) {
    _Category.add(_value);
    prefs.setStringList('ff_Category', _Category);
  }

  void removeFromCategory(String _value) {
    _Category.remove(_value);
    prefs.setStringList('ff_Category', _Category);
  }

  void removeAtIndexFromCategory(int _index) {
    _Category.removeAt(_index);
    prefs.setStringList('ff_Category', _Category);
  }

  void updateCategoryAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _Category[_index] = updateFn(_Category[_index]);
    prefs.setStringList('ff_Category', _Category);
  }

  void insertAtIndexInCategory(int _index, String _value) {
    _Category.insert(_index, _value);
    prefs.setStringList('ff_Category', _Category);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
