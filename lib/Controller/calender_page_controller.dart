import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Model_Class/calender_data_model_class.dart';
import '../Model_Class/day_date_model_class.dart';
class CalenderPageController extends GetxController {

  List<String> dates = [];
  List<String> customDates = [];
  List<String> day = [];
  List<String> customDay = [];
  var currentMonth='';
  int todayDate=0;
  late DayDateModelClass myModel;
  var isLoading = false.obs;
  final newData = [].obs;
  int index = -1;



  void getCurrentMonth() {
    final now = DateTime.now();
    print(now);
    currentMonth= getMonthName(now.month);
    todayDate= now.day;

  }
  String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'জানুয়ারি';
      case 2:
        return 'ফেব্রুয়ারি';
      case 3:
        return 'মার্চ';
      case 4:
        return 'এপ্রিল';
      case 5:
        return 'মে';
      case 6:
        return 'জুন';
      case 7:
        return 'জুলাই';
      case 8:
        return 'আগস্ট';
      case 9:
        return 'সেপ্টেম্বর';
      case 10:
        return 'অক্টোবর';
      case 11:
        return 'নভেম্বর';
      case 12:
        return 'ডিসেম্বর';
      default:
        return '';
    }
  }

  String getPeriodName(String period) {
    switch (period) {
      case 'morning':
        return 'সকাল';
      case 'launch':
        return 'দুপুর';
      case 'afternoon':
        return 'বিকাল';
      case 'evening':
        return 'সন্ধ্যা';

      default:
        return '';
    }
  }


  @override
  void onInit() {
    getCurrentMonth();
    _getMonthDates();
    fetchCalebderData();
    print("Mounth name : ${currentMonth}");
   // print("day list : ${myModel.day}");
   // print("date list : ${myModel.dates}");
    print("Today date : ${todayDate}");


    // TODO: implement onInit
    super.onInit();
  }

  void _getMonthDates() {
    final now = DateTime.now();
    final firstDayOfMonth = DateTime(now.year, now.month, 1);
    final lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

    for (int i = 1; i <= lastDayOfMonth.day; i++) {
      final date = DateTime(now.year, now.month, i);

      dates.add('${getdateName(date.day)}');
      day.add('${_getDayName(date.weekday)}');

    }
    for (int key = 0; key < dates.length; key++) {
      String value = dates[key];
      if (getdateName(todayDate) == value) {
        index = key;
        break; // Optional: If you want to stop searching after finding the index
      }
    }

    print('Find out Date Index: ${index}');

    int dateStart = (index - 7 < 0) ? 0 : index - 7;
    int dateEnd = (index + 7 > dates.length - 1) ? dates.length : index + 7;

    for (int i = dateStart; i <= dateEnd; i++) {
      customDates.add(dates[i]);
      customDay.add(day[i]);
    }





    print('Find out Date: ${customDates}');
    print('Find out day: ${customDay}');

     myModel = DayDateModelClass( customDates: customDates, customDay:customDay );
  }

  String _getDayName(int day) {
    switch (day) {
      case 1:
        return 'সোম';
      case 2:
        return 'মঙ্গল';
      case 3:
        return 'বুধ';
      case 4:
        return 'বৃহঃ';
      case 5:
        return 'শুক্র';
      case 6:
        return 'শনি';
      case 7:
        return 'রবি';
      default:
        return '';
    }
  }
  String getdateName(int date) {
    switch (date) {
      case 1:
        return '১';
      case 2:
        return '২';
      case 3:
        return '৩';
      case 4:
        return '৪';
      case 5:
        return '৫';
      case 6:
        return '৬';
      case 7:
        return '৭';
      case 8:
        return '৮';
      case 9:
        return '৯';
      case 10:
        return '১০';
      case 11:
        return '১১';
      case 12:
        return '১২';
      case 13:
        return '১৩';
      case 14:
        return '১৪';
      case 15:
        return '১৫';
      case 16:
        return '১৬';
      case 17:
        return '১৭';
      case 18:
        return '১৮';
      case 19:
        return '১৯';
      case 20:
        return '২০';
      case 21:
        return '২১';
      case 22:
        return '২২';
      case 23:
        return '২৩';
      case 24:
        return '২৪';
      case 25:
        return '২৫';
      case 26:
        return '২৬';
      case 27:
        return '২৭';
      case 28:
        return '২৮';
      case 29:
        return '২৯';
      case 30:
        return '৩০';
      case 31:
        return '৩১';

      default:
        return '';
    }
  }
  int getEngDateName(String dateName) {
    switch (dateName) {
      case '১':
        return 1;
      case '২':
        return 2;
      case '৩':
        return 3;
      case '৪':
        return 4;
      case '৫':
        return 5;
      case '৬':
        return 6;
      case '৭':
        return 7;
      case '৮':
        return 8;
      case '৯':
        return 9;
      case '১০':
        return 10;
      case '১১':
        return 11;
      case '১২':
        return 12;
      case '১৩':
        return 13;
      case '১৪':
        return 14;
      case '১৫':
        return 15;
      case '১৬':
        return 16;
      case '১৭':
        return 17;
      case '১৮':
        return 18;
      case '১৯':
        return 19;
      case '২০':
        return 20;
      case '২১':
        return 21;
      case '২২':
        return 22;
      case '২৩':
        return 23;
      case '২৪':
        return 24;
      case '২৫':
        return 25;
      case '২৬':
        return 26;
      case '২৭':
        return 27;
      case '২৮':
        return 28;
      case '২৯':
        return 29;
      case '৩০':
        return 30;
      case '৩১':
        return 31;

      default:
        return -1; // or throw an exception, depending on your requirements
    }
  }


  Future<CalenderData> fetchCalebderData() async {
    newData.clear();
    isLoading.value = true;
    update();
    final response = await http.get(Uri.parse('https://api.npoint.io/bc69ae1f6991da81ab9a'));

    if (response.statusCode == 200) {
      isLoading.value = false;
      update();
      final data= jsonDecode(response.body);
      final msgArray = data['data'];
      final now = DateTime.now();
      int currentMonth = now.month;
      print("MOnth>>>>>>>>>>>>>>>>${currentMonth}");
      final todayDates = DateTime(now.year, currentMonth, todayDate);
      print('my  date>> : ${todayDates}');
      for (final single in msgArray) {
        int date=  int.parse (single['date']);
        final dataDate = DateTime.fromMillisecondsSinceEpoch(date * 1000);
        if (todayDates.year == dataDate.year && todayDates.month == dataDate.month && todayDates.day == dataDate.day) {
          single['time'] = DateFormat('HH:mm a').format(dataDate);
         // DateTime time = DateTime.parse(single['time']);

          List<int> morning = [9,10,11];
          List<int> launch = [1,2,3,12,00];
          List<int> afternoon = [4,5,6];
          List<int> evening = [7,8];


          if(morning.contains(dataDate.hour)){
            single['period'] = 'morning';
          }else if(launch.contains(dataDate.hour)){
            single['period'] = 'launch';
          }else if(afternoon.contains(dataDate.hour)){
            single['period'] = 'afternoon';
          }else if(evening.contains(dataDate.hour)){
            single['period'] = 'evening';
          }
          // if( time.hour<11 ){
          //   single['period'] = 'morning';
          // }else if( time.hour==2){
          //   single['period'] = 'Launce';
          // }else if(time.hour ==4){
          //   single['period'] = 'afternoon';
          // }else if(time.hour ==7){
          //   single['period'] = 'evening';
          // }else {
          //   single['period'] = 'night';
          // }

          newData.add(single);
          update();



        }
      }
      newData.sort((a, b) {
        List<String> periods = ['morning', 'launch', 'afternoon', 'evening'];
        int periodA = periods.indexOf(a['period']);
        int periodB = periods.indexOf(b['period']);
        return periodA.compareTo(periodB);
      });
      print(newData);

      return CalenderData.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      isLoading.value = false;
      update();
      throw Exception('Failed to load album');
    }
  }


  String englishToBanglaTime(String englishTime) {
    Map<String, String> timeData = {
      '1': '১',
      '2': '২',
      '3': '৩',
      '4': '৪',
      '5': '৫',
      '6': '৬',
      '7': '৭',
      '8': '৮',
      '9': '৯',
      '0': '০',
      ':': ':',
      'AM': 'সকাল',
      'PM': 'বিকাল',
    };

    List<String> timeParts = englishTime.split(' ');
    String time = timeParts[0];
    String period = timeParts[1];

    List<String> timeSplit = time.split(':');
    String hour = timeSplit[0];
    String minute = timeSplit[1];

    String banglaHour = '';
    String banglaMinute = '';

    for (int i = 0; i < hour.length; i++) {
      banglaHour += timeData[hour[i]]!;
    }

    for (int i = 0; i < minute.length; i++) {
      banglaMinute += timeData[minute[i]]!;
    }



    return '$banglaHour:$banglaMinute ';
  }










}