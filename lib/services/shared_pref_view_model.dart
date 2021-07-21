import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_assignment/models/user_model.dart';

class SharedPreferenceProvider with ChangeNotifier {
  var userDataList = <UserDataModel>[];
var userRemovedItems = <UserDataModel>[];
  SharedPreferenceProvider() {
    loadPreference();
    loadRemovedPreference();
  }

  void reOrderUserData(List<UserDataModel> userDataModel) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
     userDataList.clear();
    userDataList.addAll(userDataModel);
    var data = encode(userDataList);
    pref.setString("todoData", data);

    notifyListeners();
  }
  saveSharedPreference(UserDataModel userDataModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userDataList.add(userDataModel);
    var data = encode(userDataList);
    pref.setString("todoData", data);
    notifyListeners();
  }

  List<UserDataModel> get userDataModel => userDataList ;

  loadPreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString("todoData") != null) {
      List<UserDataModel> userDataModel = decode(pref.getString("todoData")!);
      if (userDataModel != null) {
        userDataList.addAll(userDataModel);
        notifyListeners();
      }
    }
  }

  loadRemovedPreference() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (pref.getString("removedData") != null) {
        List<UserDataModel> userDataModel = decode(
            pref.getString("removedData")!);
        if (userDataModel != null) {
          userRemovedItems.addAll(userDataModel);
          notifyListeners();
        }
      }
    }
    catch(onError){
      print(onError.toString());
    }
  }



  removeSavedDataItem(int index) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      userRemovedItems.add(userDataList.elementAt(index));
      var removedDataItem = encode(userRemovedItems);
      pref.setString("removedData", removedDataItem);
      userDataList.removeAt(index);
      var data = encode(userDataList);
      pref.setString("todoData", data);
      notifyListeners();
    } catch (onError) {
      print(onError.toString());
    }
  }

  clearPreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    UserDataModel model = new UserDataModel();
    model.todoItemDateTime = '';
    model.todoItemName = "";

    saveSharedPreference(model);
  }

  static String encode(List<UserDataModel> userData) {
    return json.encode(
      userData
          .map<Map<String, dynamic>>(
              (userDataModel) => UserDataModel.toMap(userDataModel))
          .toList(),
    );
  }

  static List<UserDataModel> decode(String userData) =>
      (json.decode(userData) as List<dynamic>)
          .map<UserDataModel>((item) => UserDataModel.fromJson(item))
          .toList();
}
