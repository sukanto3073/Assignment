
import 'package:flutter/material.dart';
import 'package:flutter_assignment/Utitles/colors_masnager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../Utitles/text_size_manager.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var fontFamaliy="Kalpurush";
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(Icons.menu),
        ),
        title: Row(
          children: [
            Image.asset('assets/icons/icon.png', height: 30), // replace with your image asset
            const SizedBox(width: 10),
            const Text('Flutter Task',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child:  SvgPicture.asset('assets/icons/notification.svg'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Card section design
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  height: screenSize.height/6.8,

                  decoration: BoxDecoration(
                   color: Colors.white,
                    borderRadius: BorderRadius.circular(20), // border radius
                    boxShadow: [ // shadow
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,

                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/home_profile.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                       const Gap(20),
                        const FittedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'মোঃ মোহাইমেনুল রেজা',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily:"Kalpurush" ,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'সফটবিডি লিমিটেড',
                                style: TextStyle(fontSize: 14,fontFamily: "Kalpurush",fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: 5),
                              Row(
                               crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.location_on_outlined),
                                  SizedBox(width: 5),
                                  Text('ঢাকা',style: TextStyle(fontWeight: FontWeight.w400,fontFamily: "Kalpurush",fontSize: 14),),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(20),
              /// CircularProgressIndicator and Time validity section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: FittedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// CircularProgressIndicator section
                      Column(
                        children: [
                          Container(
                            width: 130,
                            height: 130,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Transform.rotate(
                                  angle: 9.5,
                                  child: SizedBox(
                                    height:110,
                                    width: 110,
                                    child: CircularProgressIndicator(
                                      value: 0.18,
                                      backgroundColor: Colors.grey[200],
                                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                                      strokeWidth: 10,
                                    ),
                                  ),
                                ),
                                Text(
                                  '৬ মাস ৬ দিন',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: fontFamaliy,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Gap(3),
                          Text(
                            'সময় অতিবাহিত',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: fontFamaliy,
                            ),
                          ),
                        ],
                      ),
                      const Gap(5),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0,bottom: 5.0),
                            child: Text(
                              'মেয়াদকাল',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: fontFamaliy,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),

                          FittedBox(
                            child: Row(children: [
                              SizedBox(
                                child:Image.asset('assets/icons/calendar_icon.png',height: 14,width: 14,),
                              ),
                              const Gap(5),
                              Text(
                                '১ই জানুয়ারি ২০২৪ - ৩১ই জানুয়ারি ২০৩০',
                                textScaleFactor: TextSize.textScaleFactor(context),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: fontFamaliy,
                                  fontWeight: FontWeight.w500,

                                ),
                              ),
                            ],),
                          ),
                          const Gap(20),

                          /// Year month day section
                          Text(
                            'আরও বাকি',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: fontFamaliy,
                              color: ColorManager.date_title_color,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Gap(5),
                          Row(

                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 24,
                                        width: 24,
                                        decoration: BoxDecoration(
                                          color: ColorManager.gray,// background color
                                          border: Border.all(width: 2, color: ColorManager.date_title_color), // border
                                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '০',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: fontFamaliy,

                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Gap(5),
                                      Container(
                                        height: 24,
                                        width: 24,
                                        decoration: BoxDecoration(
                                          color: ColorManager.gray, // background color
                                          border: Border.all(width: 2, color: ColorManager.date_title_color), // border
                                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '৫',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: fontFamaliy,

                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const Gap(5),
                                  Text(
                                    'বছর',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: fontFamaliy,

                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(15),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 24,
                                        width: 24,
                                        decoration: BoxDecoration(
                                          color: ColorManager.gray, // background color
                                          border: Border.all(width: 2, color: ColorManager.date_title_color), // border
                                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '০',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: fontFamaliy,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Gap(5),
                                      Container(
                                        height: 24,
                                        width: 24,
                                        decoration: BoxDecoration(
                                          color: ColorManager.gray, // background color
                                          border: Border.all(width: 2, color: ColorManager.date_title_color), // border
                                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '৬',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: fontFamaliy,

                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const Gap(5),
                                  Text(
                                    'মাস',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: fontFamaliy,

                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(15),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 24,
                                        width: 24,
                                        decoration: BoxDecoration(
                                          color: Colors.white, // background color
                                          border: Border.all(width: 2, color: ColorManager.date_title_color), // border
                                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '১',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: fontFamaliy,

                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Gap(5),
                                      Container(
                                        height: 24,
                                        width: 24,
                                        decoration: BoxDecoration(
                                          color: Colors.white, // background color
                                          border: Border.all(width: 2, color: ColorManager.date_title_color), // border
                                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '২',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: fontFamaliy,

                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const Gap(5),
                                  Text(
                                    'দিন',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: fontFamaliy,

                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                          // Time period details
                        ],
                      )
                    ],
                  ),
                ),
              ),
              /// 3rd section
              const Gap(20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CategoryCard(screenSize: screenSize, image: 'assets/icons/profile.png', serialNumber: '০০০০১',),
                      CategoryCard(screenSize: screenSize, image: 'assets/icons/bank.png',  serialNumber: '০০০০২',),
                      CategoryCard(screenSize: screenSize, image: 'assets/icons/wheelchair.png', serialNumber: '০০০০৩',),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CategoryCard(screenSize: screenSize, image: 'assets/icons/school.png', serialNumber: '০০০০৪',),
                      CategoryCard(screenSize: screenSize, image: 'assets/icons/new-document.png',  serialNumber: '০০০০৫',),
                      CategoryCard(screenSize: screenSize, image: 'assets/icons/coding.png', serialNumber: '০০০০৬',),
                    ],
                  )
                ],
              )







            ],
          ),
        ),
      )
    );
  }
}

class CategoryCard extends StatelessWidget {
   CategoryCard({
    super.key,
    required this.screenSize,
    required this.image,
    required this.serialNumber,
  });

  final Size screenSize;
  String image;

  String serialNumber;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Container(
        height: screenSize.height/10,
        width: screenSize.width/5,
        decoration: BoxDecoration(
          color: ColorManager.gray,
            borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: SizedBox(
            height: 34,
              width: 34,
              child: Image.asset(image)
          ),
        ),
      ),
      const Text('মেনু নং'),
      Text(serialNumber)
    ],);
  }
}
