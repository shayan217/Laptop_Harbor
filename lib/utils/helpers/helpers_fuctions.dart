import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LHHelperFunction{
  static Color? getColor(String value){
    if(value == 'black'){
      return Colors.black;
    }else if (value == 'black'){
      return Colors.black;
    }else if (value == 'white'){
      return Colors.white;
    }else if (value == 'grey'){
      return Colors.grey;
    }else if (value == 'skin'){
      return Colors.red.shade100;
    }else if (value == 'blue'){
      return Colors.blue;
    }else if (value == 'green'){
      return Colors.green;
    }else{
      return null;
    }
  }

  static void showSnackBar(String message){
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message))
    );
  }
  static void showAlert(String title, String message){
    showDialog(
      context: Get.context!,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: ()=> Navigator.of(context).pop(),
              child: Text("OK"),
            )
          ],
        );
      }
    );
  }
  static void navigateToScreen(BuildContext context, Widget screen){
    Navigator.push(context, MaterialPageRoute(builder: (_)=> screen));
  }
  static String truncateText(String text, int maxLength){
    if(text.length<= maxLength){
      return text;
    }else{
      return '${text.substring(0, maxLength)}';
    }
  }
  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }
  static Size screenSize(){
    return MediaQuery.of(Get.context!).size;
  }
  static double screenHeight(){
    return MediaQuery.of(Get.context!).size.height;
  }
  static double screenWidth(){
    return MediaQuery.of(Get.context!).size.width;
  }
  static String getFormattedDate(DateTime date, {String format = 'dd MMM yyyy'}){
    return DateFormat(format).format(date);
  }
  static List<LH> removeDuplicate<LH>(List<LH> list){
    return list.toSet().toList();
  }
  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize){
    final wrappedList = <Widget>[];
    for(var i = 0; i< widgets.length; i += rowSize){
      final rowChildren = widgets.sublist(i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren,));
    }
    return wrappedList;
  }
}