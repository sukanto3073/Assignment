import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assignment/Screen/paragraph_form_screen.dart';
import 'package:flutter_assignment/Utitles/colors_masnager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../Controller/calender_page_controller.dart';
import 'package:gap/gap.dart';
class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {

  final ScrollController _scrollController = ScrollController();

  final controller= Get.put(CalenderPageController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Scroll to the middle item after the first frame
      _scrollToMiddle();
    });
  }
  void _scrollToMiddle() {
    final middleIndex = (controller.myModel.customDates.length / 2).floor();
    _scrollController.jumpTo(
      _scrollController.position.maxScrollExtent / 2,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    var fontFamaliy="Kalpurush";
    return GetBuilder<CalenderPageController>(
      init: CalenderPageController(),
      builder: (CalenderPageController controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 90,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: const Icon(Icons.menu),
            ),
            title:
            Center(child: Text('সময়রেখা',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18,fontFamily: fontFamaliy),)),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child:  SvgPicture.asset('assets/icons/notification.svg'),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// Date and Month Show and Add Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('আজ, ${controller.getdateName(controller.todayDate)} ${controller.currentMonth}',
                      style: TextStyle(
                        fontFamily: fontFamaliy,
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(()=>ParagraphFormScreen(),transition: Transition.rightToLeft);
                      },
                      child: Container(
                        height: screenSize.height/22,
                        width: screenSize.width/3,
                        decoration: BoxDecoration(
                          gradient: ColorManager.button_gradient_color,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text("নতুন যোগ করুন",
                            style: TextStyle(fontFamily: fontFamaliy,fontSize: 12,fontWeight: FontWeight.w700,color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                  Gap(20),
                  /// All Day and Date Show in List View
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      height: screenSize.height/6.7,
              
                      decoration: BoxDecoration(
                        color: ColorManager.bottom_appbar_colors,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            width: 2.0,
                            style: BorderStyle.solid,
                            color: Colors.black12
                        ),
                        boxShadow: [ // shadow
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                     child: ListView.builder(
                       controller: _scrollController,
                       scrollDirection: Axis.horizontal,
                       itemCount: controller.myModel.customDates.length, // The number of items in the list
                       itemBuilder: (context, index) { // The callback to generate each item
                         return InkWell(
                           onTap: (){

                             setState(() {
                               controller.todayDate= controller.getEngDateName(controller.myModel.customDates[index]);
                             });
                             controller.fetchCalebderData();

                           },
                           child: Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 11.0,vertical: 17),
                             child: Container(
                               padding: EdgeInsets.all(2.0),

                               decoration: controller.getdateName(controller.todayDate)==controller.myModel.customDates[index]? BoxDecoration(
                                 border: Border.all(
                                   width: 2.0,
                                   style: BorderStyle.solid,
                                     color: Colors.green
                                 ),
                                 borderRadius: BorderRadius.circular(20.0),
                               ):BoxDecoration(),

                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 mainAxisSize: MainAxisSize.max,
                                 children: [


                                   Text("${controller.myModel.customDay[index]}",style: TextStyle(
                                     fontWeight: FontWeight.w400,
                                     fontFamily: fontFamaliy,
                                     fontSize: 16
                                   ),),
                                   Gap(10),
                                   Text("${controller.myModel.customDates[index]}",style: TextStyle(
                                       fontWeight: FontWeight.w600,
                                       fontFamily: fontFamaliy,
                                       fontSize: 16
                                   ),),
                                 ],
                               ),
                             ),
                           ),
                         ); // The widget to display at the given index
                       },
                     )
                    ),
                  ),
                  Gap(20),
                  controller.isLoading.value?Center(child: CircularProgressIndicator(color: Colors.green,)):
                  Container(
                   // height: screenSize.height/2,
                    width: screenSize.width/1.1,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 2.0,
                          style: BorderStyle.solid,
                          color: Colors.black12
                      ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [ // shadow
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          controller.newData.value.isEmpty?Center(
                            child: Text('আজকের কোন কার্যক্রম নেই',style: TextStyle(
                                fontFamily: fontFamaliy,
                                fontWeight: FontWeight.w700,
                                fontSize: 16
                            ),),
                          ):
                          Text('আজকের কার্যক্রম',style: TextStyle(
                            fontFamily: fontFamaliy,
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                          ),),
                          Gap(10),
                          SizedBox(
                            height:controller.newData.value.isEmpty?0.0:600,
                            child:
                            ListView.builder(
                              scrollDirection: Axis.vertical,
                                physics: ScrollPhysics(),
                                itemCount:controller.newData.value.length,
                                itemBuilder: (context, index){
                                var data= controller.newData[index];


                                 return Padding(
                                   padding: const EdgeInsets.only(bottom: 10),
                                   child: FittedBox(
                                     child: Row(
                                       children: [
                                         Column(
                                           children: [
                                     
                                             Text(controller.getPeriodName(data['period']),style: TextStyle(
                                               color: index % 2 != 0?ColorManager.container_time_blue:Colors.black
                                             ),),
                                             Text('${controller.englishToBanglaTime(data['time'])} মি.',style: TextStyle(
                                                 color: index % 2 != 0?ColorManager.container_time_blue:Colors.black
                                             ),)
                                           ],
                                         ),
                                         Gap(10),
                                         Container(
                                          // height: screenSize.height/4.7,
                                           width: screenSize.width/1.6,
                                           decoration:
                                         index % 2 != 0?
                                         BoxDecoration(
                                     
                                           color:Colors.black,
                                           borderRadius: BorderRadius.circular(25),
                                         ):
                                           BoxDecoration(
                                     
                                             gradient: ColorManager.container_gradient_color,
                                             borderRadius: BorderRadius.circular(25),
                                           ),
                                           child: Padding(
                                             padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
                                             child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 Row(
                                                   children: [
                                                     Icon(Icons.access_time,color: Colors.white,size: 16,),
                                                     Gap(4),
                                                     Text("${controller.englishToBanglaTime(data['time'])} মি.",style: TextStyle(
                                                         fontSize: 14,
                                                         fontWeight: FontWeight.w500,
                                                         fontFamily: fontFamaliy,
                                                         color: Colors.white
                                                     ),)
                                                   ],
                                                 ),
                                                 Gap(10),
                                                 Text(data['name'],
                                                   style: TextStyle(
                                                       fontSize: 14,
                                                       fontWeight: FontWeight.w500,
                                                       fontFamily: fontFamaliy,
                                                       color: Colors.white
                                                   ),),
                                                 Gap(10),
                                                 Text(data['category'],style: TextStyle(
                                                     fontSize: 14,
                                                     fontWeight: FontWeight.w500,
                                                     fontFamily: fontFamaliy,
                                                     color: Colors.white
                                                 ),),
                                                 Gap(10),
                                                 Row(
                                                   children: [
                                                     Icon(Icons.location_on_outlined,color: Colors.white,size: 18,),
                                                     Gap(5),
                                                     Text(data['location'],style: TextStyle(
                                                         fontSize: 14,
                                                         fontWeight: FontWeight.w500,
                                                         fontFamily: fontFamaliy,
                                                         color: Colors.white
                                                     ),)
                                                   ],
                                                 ),
                                                 Gap(10),
                                               ],
                                             ),
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                 );
                                }
                            ),
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );


  }
}
