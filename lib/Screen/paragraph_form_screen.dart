import 'package:flutter/material.dart';
import 'package:flutter_assignment/Utitles/colors_masnager.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../Common_Widget/custom_dialog_box.dart';
import '../Controller/paragraph_form_controller.dart';

class ParagraphFormScreen extends StatefulWidget {
  const ParagraphFormScreen({super.key});

  @override
  State<ParagraphFormScreen> createState() => _ParagraphFormScreenState();
}

class _ParagraphFormScreenState extends State<ParagraphFormScreen> {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var fontFamaliy = "Kalpurush";

    return GetBuilder<ParagraphFormController>(
      init: ParagraphFormController(),
      builder: (ParagraphFormController controller) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              toolbarHeight: 80,
              leading: BackButton(),
              title: Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Center(
                    child: Text(
                      'নতুন যোগ করুন',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          fontFamily: fontFamaliy),
                    )),
              ),
            ),
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'অনুচ্ছেদ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: fontFamaliy,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  '৪৫ শব্দ',
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: ColorManager.bottom_appbar_colors,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                    color: Colors.black12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: TextFormField(
                                  controller: controller.paragraphTextEditingController,
                                  decoration: InputDecoration(
                                    hintText: 'অনুচ্ছেদ লিখুন',
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        fontFamily: fontFamaliy,
                                        fontWeight: FontWeight.w400),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: ColorManager.bottom_appbar_colors,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'অনুচ্ছেদের বিভাগ',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: fontFamaliy,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: ColorManager.bottom_appbar_colors,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                    color: Colors.black12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: DropdownButtonFormField<String>(
                                  //value: controller.category.value,
                                  icon: Icon(Icons.arrow_forward_ios),
                                  iconSize: 16,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: ColorManager.bottom_appbar_colors,
                                    hintText: 'অনুচ্ছেদের বিভাগ নির্বাচন করুন',
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: fontFamaliy),
                                  ),
                                  items: <String>['অনুচ্ছেদ', 'বাক্য', 'শব্দ']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value:  value,
                                      child: Text(value??'অনুচ্ছেদের বিভাগ নির্বাচন করুন'),
                                    );
                                  }).toList(),

                                  onChanged: (String? newValue) {
                                     setState(() {
                                       controller.category.value = newValue!;

                                     });
                                  },
                                 /* validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'বিভাগ নির্বাচন করুন';
                                    }
                                    return null;
                                  },*/
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'তারিখ ও সময়',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: fontFamaliy,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 10),
                            InkWell(
                              onTap: (){
                                controller.seleteDate(context);
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  color: ColorManager.bottom_appbar_colors,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                      color: Colors.black12),
                                ),
                                child:  Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_month_outlined,
                                            size: 18,
                                            color: Colors.black54,
                                          ),
                                          Gap(10),
                                          controller.banglaDate.value==''?
                                          Text(
                                            'নির্বাচন করুন',
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Kalpurush',
                                            ),
                                          ):Text(
                                            controller.banglaDate.value,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Kalpurush',
                                            ),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'স্থান',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: fontFamaliy,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: ColorManager.bottom_appbar_colors,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                    color: Colors.black12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: DropdownButtonFormField<String>(
                                  //value: controller.loaction.value,
                                  icon: Icon(Icons.arrow_forward_ios),
                                  iconSize: 16,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.location_on_outlined,color: Colors.black54,size: 18,),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: ColorManager.bottom_appbar_colors,
                                    hintText: 'নির্বাচন করুন',
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: fontFamaliy),
                                  ),
                                  items: <String>['ঢাকা', 'চট্টগ্রাম', 'বরিশাল','খুলনা', 'রাজশাহী', 'রংপুর', 'সিলেট']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                     setState(() {
                                      controller.loaction.value = newValue!;
                                     });
                                  },
                                  /*validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'বিভাগ নির্বাচন করুন';
                                    }
                                    return null;
                                  },*/
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'অনুচ্ছেদের বিবরণ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: fontFamaliy,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  '১২০ শব্দ',
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: screenSize.height/5.3,
                              decoration: BoxDecoration(
                                color: ColorManager.bottom_appbar_colors,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                    color: Colors.black12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: TextField(
                                  controller: controller.paraDescriptionTextEditingController,
                                  maxLines: 100,
                                  decoration: InputDecoration(
                                    hintText: 'কার্যক্রমের বিবরণ লিখুন',
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        fontFamily: fontFamaliy,
                                        fontWeight: FontWeight.w400),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: ColorManager.bottom_appbar_colors,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            InkWell(
                              onTap: (){

                                if (controller.validateForm()) {
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SuccessDialog();
                                    },
                                  );
                                  controller.paraDescriptionTextEditingController.clear();
                                  controller.paragraphTextEditingController.clear();
                                  setState(() {
                                    controller.loaction.value='';
                                    controller.category.value='';
                                    controller.banglaDate.value='';
                                  });




                                  // Perform form submission or navigation
                                }
                              },
                              child: Container(
                                  height: screenSize.height/15,
                                  decoration: BoxDecoration(
                                    gradient: ColorManager.button_gradient_color,
                                    borderRadius: BorderRadius.circular(10),

                                  ),
                                  child:Center(child: Text('সংরক্ষন করুন',style: TextStyle(
                                      fontFamily: fontFamaliy,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white
                                  ),))
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );


  }
}
