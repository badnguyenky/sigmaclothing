import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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
      _random = prefs.getStringList('ff_random') ?? _random;
    });
    _safeInit(() {
      _lineChartData = prefs
              .getStringList('ff_lineChartData')
              ?.map((x) {
                try {
                  return ChartDataStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _lineChartData;
    });
    _safeInit(() {
      _columnChartData = prefs
              .getStringList('ff_columnChartData')
              ?.map((x) {
                try {
                  return ColumnChartDataStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _columnChartData;
    });
    _safeInit(() {
      _isNavBarCollapsed =
          prefs.getBool('ff_isNavBarCollapsed') ?? _isNavBarCollapsed;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _textFromHtmlEditor = '';
  String get textFromHtmlEditor => _textFromHtmlEditor;
  set textFromHtmlEditor(String value) {
    _textFromHtmlEditor = value;
  }

  List<String> _random = [
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World'
  ];
  List<String> get random => _random;
  set random(List<String> value) {
    _random = value;
    prefs.setStringList('ff_random', value);
  }

  void addToRandom(String value) {
    random.add(value);
    prefs.setStringList('ff_random', _random);
  }

  void removeFromRandom(String value) {
    random.remove(value);
    prefs.setStringList('ff_random', _random);
  }

  void removeAtIndexFromRandom(int index) {
    random.removeAt(index);
    prefs.setStringList('ff_random', _random);
  }

  void updateRandomAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    random[index] = updateFn(_random[index]);
    prefs.setStringList('ff_random', _random);
  }

  void insertAtIndexInRandom(int index, String value) {
    random.insert(index, value);
    prefs.setStringList('ff_random', _random);
  }

  String _HTMLMessage = '';
  String get HTMLMessage => _HTMLMessage;
  set HTMLMessage(String value) {
    _HTMLMessage = value;
  }

  List<ChartDataStruct> _lineChartData = [
    ChartDataStruct.fromSerializableMap(
        jsonDecode('{\"yValue\":\"8\",\"xValue\":\"1693559820000\"}')),
    ChartDataStruct.fromSerializableMap(
        jsonDecode('{\"yValue\":\"9\",\"xValue\":\"1696151820000\"}')),
    ChartDataStruct.fromSerializableMap(
        jsonDecode('{\"yValue\":\"29\",\"xValue\":\"1698830280000\"}')),
    ChartDataStruct.fromSerializableMap(
        jsonDecode('{\"yValue\":\"10\",\"xValue\":\"1701425880000\"}'))
  ];
  List<ChartDataStruct> get lineChartData => _lineChartData;
  set lineChartData(List<ChartDataStruct> value) {
    _lineChartData = value;
    prefs.setStringList(
        'ff_lineChartData', value.map((x) => x.serialize()).toList());
  }

  void addToLineChartData(ChartDataStruct value) {
    lineChartData.add(value);
    prefs.setStringList(
        'ff_lineChartData', _lineChartData.map((x) => x.serialize()).toList());
  }

  void removeFromLineChartData(ChartDataStruct value) {
    lineChartData.remove(value);
    prefs.setStringList(
        'ff_lineChartData', _lineChartData.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromLineChartData(int index) {
    lineChartData.removeAt(index);
    prefs.setStringList(
        'ff_lineChartData', _lineChartData.map((x) => x.serialize()).toList());
  }

  void updateLineChartDataAtIndex(
    int index,
    ChartDataStruct Function(ChartDataStruct) updateFn,
  ) {
    lineChartData[index] = updateFn(_lineChartData[index]);
    prefs.setStringList(
        'ff_lineChartData', _lineChartData.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInLineChartData(int index, ChartDataStruct value) {
    lineChartData.insert(index, value);
    prefs.setStringList(
        'ff_lineChartData', _lineChartData.map((x) => x.serialize()).toList());
  }

  List<ColumnChartDataStruct> _columnChartData = [
    ColumnChartDataStruct.fromSerializableMap(jsonDecode(
        '{\"xValue\":\"CELL 1\",\"y1Value\":\"1\",\"y2Value\":\"0\"}')),
    ColumnChartDataStruct.fromSerializableMap(jsonDecode(
        '{\"xValue\":\"CELL 2\",\"y1Value\":\"1\",\"y2Value\":\"0\"}')),
    ColumnChartDataStruct.fromSerializableMap(jsonDecode(
        '{\"xValue\":\"CELL 3\",\"y1Value\":\"1\",\"y2Value\":\"0\"}')),
    ColumnChartDataStruct.fromSerializableMap(jsonDecode(
        '{\"xValue\":\"CELL 4\",\"y1Value\":\"1\",\"y2Value\":\"0\"}'))
  ];
  List<ColumnChartDataStruct> get columnChartData => _columnChartData;
  set columnChartData(List<ColumnChartDataStruct> value) {
    _columnChartData = value;
    prefs.setStringList(
        'ff_columnChartData', value.map((x) => x.serialize()).toList());
  }

  void addToColumnChartData(ColumnChartDataStruct value) {
    columnChartData.add(value);
    prefs.setStringList('ff_columnChartData',
        _columnChartData.map((x) => x.serialize()).toList());
  }

  void removeFromColumnChartData(ColumnChartDataStruct value) {
    columnChartData.remove(value);
    prefs.setStringList('ff_columnChartData',
        _columnChartData.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromColumnChartData(int index) {
    columnChartData.removeAt(index);
    prefs.setStringList('ff_columnChartData',
        _columnChartData.map((x) => x.serialize()).toList());
  }

  void updateColumnChartDataAtIndex(
    int index,
    ColumnChartDataStruct Function(ColumnChartDataStruct) updateFn,
  ) {
    columnChartData[index] = updateFn(_columnChartData[index]);
    prefs.setStringList('ff_columnChartData',
        _columnChartData.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInColumnChartData(int index, ColumnChartDataStruct value) {
    columnChartData.insert(index, value);
    prefs.setStringList('ff_columnChartData',
        _columnChartData.map((x) => x.serialize()).toList());
  }

  bool _isNavBarCollapsed = false;
  bool get isNavBarCollapsed => _isNavBarCollapsed;
  set isNavBarCollapsed(bool value) {
    _isNavBarCollapsed = value;
    prefs.setBool('ff_isNavBarCollapsed', value);
  }
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
