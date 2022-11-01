import 'dart:io';
import 'package:departments/layout/doctor/doctor_layout.dart';
import 'package:departments/layout/patient/patient_layout.dart';
import 'package:departments/models/profile/get_general_profile.dart';
import 'package:departments/screens/shared/single%20doctor/cubit/cubit.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/components/role%20screen/role_screen.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/network/local/cach_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
          title: Text(
            'Do you want to exit app',
            style: Fonts.semiBold(size: 16, color: grey),
          ),
          actions: [
            textButton(
                text: 'NO',
                color: blue,
                fontStyle: Fonts.semiBold(size: 13, color: blue),
                function: () {
                  Navigator.pop(context, false);
                }),
            textButton(
                text: 'Yes',
                color: red,
                fontStyle: Fonts.semiBold(size: 13, color: red),
                function: () {
                  Navigator.pop(context, true);
                }),
          ],
        ));

bool allText = true;

Future pickImage(ImageSource source, File? i) async {
  final image = await ImagePicker().pickImage(source: source);
  if (image == null) return;
  final imageTemporary = File(image.path);
  i = imageTemporary;
  return i;
}

Future showToast({required String msg, required Color color}) {
  return Fluttertoast.showToast(
      msg: msg,
      textColor: white,
      backgroundColor: color,
      gravity: ToastGravity.BOTTOM);
}

Future takeRole(List<String> roles, BuildContext context) async {
  if (roles.length > 1) {
    return Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const RoleScreen()));
  } else if (roles.first == 'Patient') {
    await CacheHelper.saveData(key: 'role', value: 'Patient');
    role = 'Patient';
    return Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => PatientLayout()));
  } else if (roles.first == 'Doctor') {
    await CacheHelper.saveData(key: 'role', value: 'Doctor');
    role = 'Doctor';
    return Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => DoctorLayout()));
  }
}

Future getAppInfo() async {
  token = await CacheHelper.getData(key: 'token') ?? '';
  role = await CacheHelper.getData(key: 'role') ?? '';
  isDark = await CacheHelper.getData(key: 'isDark') ?? false;
  lang = await CacheHelper.getData(key: 'lang') ?? 'ar';
}

Future removeData(context) async {
  token = '';
  await CacheHelper.removeData(key: 'token');
  role = '';
  await CacheHelper.removeData(key: 'role');
}

int fromHoursToDays(int hours) {
  return (hours / 24).toInt();
}

String pMOrAM(String hour) {
  if (int.parse(hour.substring(0, 1)) < 12) {
    return 'AM';
  }
  return 'PM';
}

String convertToDate(DateTime value) {
  return '${DateFormat('yyyy-MM-dd').format(value)}';
}

Map<String, dynamic> classToMap(Object object) {
  return {};
}

List<String> listOfPhoneNumber(List<Phones> phoneNumber) {
  List<String> listOfPhoneNumber = List.filled(phoneNumber.length, 'x');
  for (int i = 0; i < phoneNumber.length; i++) {
    listOfPhoneNumber[i] = phoneNumber[i].phoneNumber!;
  }
  return listOfPhoneNumber;
}

dynamic getValueOfKeyInMap(Map<String, dynamic> map, String key) {
  dynamic value;
  map.entries.forEach((entries) {
    if (entries.key == key) {
      value = entries.value;
    }
  });
  return value;
}

bool checkUnion(List<int> list, int id) {
  for (int i = 0; i < list.length; i++) {
    if (id == list[i]) {
      return true;
    }
  }
  return false;
}

String enableTextWidth(int width, String text) {
  if (text.length > width) {
    return text.substring(0, width - 3) + '...';
  }
  return text;
}

List<String> getWorkingTimesOfDay(
    List<Map<String, List<Map<String, String>>>> response,
    List<Map<String, String>> listOfWorkingTimes) {
  List<String> newListOfDays = [];
  Map<String, String> temp;
  for (int i = 0; i < response.length; i++) {
    temp = listOfWorkingTimes[i];
    for (int j = 0; j < response.length; j++) {
      if (temp == response[j].values) {}
    }
  }
  return newListOfDays;
}

String getFirstWord(String inputString) {
  List<String> wordList = inputString.split(" ");
  if (wordList.isNotEmpty) {
    return wordList[0];
  } else {
    return ' ';
  }
}

bool isThisListBeing(List<List<List<String>>> inputList,List<List<String>> subList){
  for(int i=0;i<inputList.length;i++){
    if(inputList[i]==subList){
      return true;
    }
  }
  return false;
}

void initializeDays(
    {required List sun,
    required List mon,
    required List tue,
    required List wen,
    required List thi,
    required List fri,
    required List sat}) {
  List<List> inputList = [sun, mon, tue, wen, thi, fri, sat];
  List<String> nameOfDays = ['sun', 'mon', 'tue', 'wen', 'thi', 'fri', 'sat'];
  List<String> groupOfSimilarDays = List.filled(7, 'x');
  for (int i = 0; i < inputList.length; i++) {
    for (int j = i; j < inputList.length; j++) {
      if (inputList[i] == inputList[j]) {
        groupOfSimilarDays[j] = nameOfDays[j];
      }
    }
    SingleDoctorCubit.listOfSimilarDays[i] = groupOfSimilarDays;
    groupOfSimilarDays = List.filled(7, 'x');
  }
}

void initializeTimes(
    {required List<List<String>> sun,
    required List <List<String>> mon,
    required List<List<String>> tue,
    required List<List<String>> wen,
    required List<List<String>> thi,
    required List<List<String>> fri,
    required List<List<String>> sat}) {
  List<List<List<String>>> inputList = [sun, mon, tue, wen, thi, fri, sat];
  for(int i=0;i<inputList.length;i++){
    SingleDoctorCubit.listOfSimilarTimes[i]=inputList[i];
    for(int j=0;j<i;j++){
    if(isThisListBeing(inputList,inputList[i])){
      break;
    }else{
      SingleDoctorCubit.listOfSimilarTimes[j]=inputList[i];
      break;
    }
    }
  }
}



// Map<String,List> mapOfList={'sun':sun,'mon':mon,'tue':tue,'wen':wen,'thi':thi,'fri':fri,'sat':sat};
// List<List> listOfSimilarDays=List.filled(7, []);
// void ahmad(
//     {required List sun,
//     required List mon,
//     required List tue,
//     required List wen,
//     required List thi,
//     required List fri,
//     required List sat}) {
//    Map<String,List> mapOfList={'sun':sun,'mon':mon,'tue':tue,'wen':wen,'thi':thi,'fri':fri,'sat':sat};
//    List listOfList=[];
//    MapEntry<String,List> firstEntryOfMap;
//    while(true) {
//      firstEntryOfMap=mapOfList.entries.first;
//      for (int i = 0; i < mapOfList.length; i++) {
//        for (int j = i; j < mapOfList.length; j++) {
//          if (mapOfList == mapOfList[j]) {
//            SingleDoctorCubit.listOfSimilarDays[i] = maptOfList[j];
//          }
//        }
//      }
//      mapOfList=mapOfList.
//    }
// }
//
// Map<String,List> cutMap(Map<String,List> myMap,int from,int to){
//   Map<String,List> newMap=myMap;
//   for(int i=0;i<myMap.length;i++){
//     newMap.addEntries(myMap[from]);
//   }
// }

//
// List<List<String>> listOfSimilarDays(Map<String, dynamic> getTheDataMap) {
//   List<List<String>> similarDays = [];
//
//   getValueOfKeyInMap(getTheDataMap, 'Sunday');
//
//   return similarDays;
// }
