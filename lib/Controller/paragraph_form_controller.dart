

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class ParagraphFormController extends GetxController {

 var banglaDate=''.obs;

 TextEditingController paragraphTextEditingController= TextEditingController();
 TextEditingController paraDescriptionTextEditingController= TextEditingController();
 var loaction=''.obs;
 var category=''.obs;


 bool validationCheck(){
   if(paragraphTextEditingController.text.isEmpty){

     return false;
   }
   return true;
 }
 bool paraDescriptionValidationCheck(){
   if(paraDescriptionTextEditingController.text.isEmpty){
    // showSnackbar('অনুচ্ছেদের বিবরণ','অনুগ্রহ করে অনুচ্ছেদের বিবরণ লিখুন');
     return false;
   }/*else if(paraDescriptionTextEditingController.text.length>121){
    // showSnackbar('অনুচ্ছেদের বিবরণ','আপনি ১২০ টি শব্দের বেশি ব্যবহার করেছেন');
     return false;
   }*/
   return true;
 }

 bool validateCategory(String category) {
   if (category=='') {
     return false;
   }
   return true;
 }
 bool validateDateTime(String date) {
   if (date=='') {
     return false;
   }
   return true;
 }
 bool validateLocation(String location) {
   if (location=='') {
     return false;
   }
   return true;
 }

 bool validateForm() {
   final isvalidationCheck = validationCheck();
   final isCategoryValid = validateCategory(category.value);
   final isDateValid = validateDateTime(banglaDate.value);
   final isLocationValid = validateLocation(loaction.value);
   final isparaDescriptionValidationCheck=paraDescriptionValidationCheck();

    if(!isvalidationCheck){
      if(paragraphTextEditingController.text.length>46){
        showSnackbar('অনুচ্ছেদ','আপনি ৪৫টি শব্দের বেশি ব্যবহার করেছেন');
      }else{
        showSnackbar('অনুচ্ছেদ','অনুগ্রহ করে অনুচ্ছেদটি লিখুন');
      }

    }
   else if (!isCategoryValid) {
     showSnackbar('অনুচ্ছেদের বিভাগ','অনুগ্রহ করে অনুচ্ছেদের বিভাগ নির্বাচন করুন');
   } else if (!isDateValid) {
     showSnackbar('তারিখ ও সময়','অনুগ্রহ করে তারিখ ও সময় নির্বাচন করুন');
   } else if (!isLocationValid) {
     showSnackbar('স্থান','অনুগ্রহ করে স্থান নির্বাচন করুন');
   }else if(!isparaDescriptionValidationCheck){
      if(paraDescriptionTextEditingController.text.length>121){
        showSnackbar('অনুচ্ছেদের বিবরণ','আপনি ১২০ টি শব্দের বেশি ব্যবহার করেছেন');
      }else{
        showSnackbar('অনুচ্ছেদের বিবরণ','অনুগ্রহ করে অনুচ্ছেদের বিবরণ লিখুন');
      }
    }

   return isvalidationCheck && isCategoryValid && isDateValid && isLocationValid && isparaDescriptionValidationCheck;
 }



  Future<void> seleteDate(BuildContext context) async {
    final now = DateTime.now();
    final firstDayOfMonth = DateTime(now.year, now.month,now.day);
    String dateString = firstDayOfMonth.toString();
   // englishDate.value = DateFormat('yyyy-MM-dd').parse(dateString);
    final DateTime? picked = await showDatePicker(
      context: context,

      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now()) {
      DateFormat desiredDateFormat = DateFormat('dd-MM-yyyy');
      String desiredDateString = desiredDateFormat.format(picked);
      banglaDate.value = _convertToBanglaDigits(desiredDateString);
      update();
      print('Date>>>>>>>>> :${banglaDate.value}');

    }

  }

 String _convertToBanglaDigits(String input) {
   const englishDigits = '0123456789';
   const banglaDigits = '০১২৩৪৫৬৭৮৯';

   return input.split('').map((char) {
     final index = englishDigits.indexOf(char);
     return index != -1 ? banglaDigits[index] : char;
   }).join('');
 }


 void showSnackbar(String title, String message) {
   Get.snackbar(
     title,
     message,
     snackPosition: SnackPosition.TOP,
     backgroundColor: Colors.red,
     colorText: Colors.white,
   );
 }













}