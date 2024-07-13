// success_dialog.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../Controller/paragraph_form_controller.dart';
import '../Screen/main_screen.dart';
import '../Screen/paragraph_form_screen.dart';
import '../Utitles/colors_masnager.dart';
class SuccessDialog extends StatelessWidget {
  final controller= Get.put(ParagraphFormController());
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var fontFamaliy="Kalpurush";
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),

        ),

        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
               height: 96,
                width: 96,
                child: SvgPicture.asset('assets/icons/success.svg')
            ),
            SizedBox(height: 16.0),
            Text(
              'নতুন অনুচ্ছেদ সংরক্ষন',
              style: TextStyle(
                fontFamily: fontFamaliy,
                fontSize: 17.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'আপনার সময়রেখাতে নতুন অনুচ্ছেদ সংরক্ষণ সম্পুর্ন হয়েছে ',
              style: TextStyle(
                fontFamily: fontFamaliy,
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: (){

            // Get.off(()=>ParagraphFormScreen());




                Get.back();
              },
              child: Container(
                  height: screenSize.height/16,
                  width: screenSize.width/2,
                  decoration: BoxDecoration(
                    gradient: ColorManager.button_gradient_color,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child:Center(child: Text('আরও যোগ করুন',style: TextStyle(
                      fontFamily: fontFamaliy,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  ),))
              ),
            ),
          ],
        ),
      ),
    );
  }
}
