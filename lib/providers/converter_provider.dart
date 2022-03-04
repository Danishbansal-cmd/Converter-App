import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConverterProvider extends ChangeNotifier {
  //set and represent the converter name
  String converterName = '';

  void setConverterName(String value){
    converterName = value;
    notifyListeners();
  }

  //selecting and getting the barunits and its symbol of the converter app
  String barUnit1 = '', barUnit2 = '', barUnit3 = '';
  String barUnit1Symbol = '', barUnit2Symbol = '', barUnit3Symbol = '';

  void setBarUnit1(String barUnitValue) {
    barUnit1 = barUnitValue;
    notifyListeners();
  }

  void setBarUnit2(String barUnitValue) {
    barUnit2 = barUnitValue;
    notifyListeners();
  }

  void setBarUnit3(String barUnitValue) {
    barUnit3 = barUnitValue;
    notifyListeners();
  }

  void setBarUnit1Symbol(String barUnitValue) {
    barUnit1Symbol = barUnitValue;
    notifyListeners();
  }
  void setBarUnit2Symbol(String barUnitValue) {
    barUnit2Symbol = barUnitValue;
    notifyListeners();
  }
  void setBarUnit3Symbol(String barUnitValue) {
    barUnit3Symbol = barUnitValue;
    notifyListeners();
  }

  //selecting and updating the values of the converter app
  String value1 = '', value2 = '', value3 = '';

  void setValue1(String setValue) {
    value1 += setValue;
    notifyListeners();
  }

  void setValue2(String setValue) {
    value2 += setValue;
    notifyListeners();
  }

  void setValue3(String setValue) {
    value3 += setValue;
    notifyListeners();
  }

  void setValue1to(String setValue) {
    value1 = setValue;
    notifyListeners();
  }

  void setValue2to(String setValue) {
    value2 = setValue;
    notifyListeners();
  }

  void setValue3to(String setValue) {
    value3 = setValue;
    notifyListeners();
  }

  //selecting and updating the selected value
  bool isSelectedValue1 = false,
      isSelectedValue2 = false,
      isSelectedValue3 = false;

  void setSelectedValue1(bool setValue) {
    isSelectedValue1 = setValue;
    isSelectedValue2 = false;
    isSelectedValue3 = false;
    notifyListeners();
  }

  void setSelectedValue2(bool setValue) {
    isSelectedValue2 = setValue;
    isSelectedValue1 = false;
    isSelectedValue3 = false;
    notifyListeners();
  }

  void setSelectedValue3(bool setValue) {
    isSelectedValue3 = setValue;
    isSelectedValue1 = false;
    isSelectedValue2 = false;
    notifyListeners();
  }
}
