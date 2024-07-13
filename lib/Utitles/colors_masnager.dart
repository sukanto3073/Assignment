import 'package:flutter/material.dart';

class ColorManager{
  static Color primary =HaxColor.fromHex("#4DC515");
  static Color bottom_appbar_colors =HaxColor.fromHex("#fdfdfd");
  static Color gray =HaxColor.fromHex("#f6f6f6");
  static Color date_title_color =HaxColor.fromHex("#ff7b82");
  static Color black_box_container_color =HaxColor.fromHex("#202020");
  static Color container_time_blue =HaxColor.fromHex("#4173ef");
  static Color container_time_black =HaxColor.fromHex("#222222");

  static LinearGradient floatingActionButton_colors= LinearGradient(
    colors: [
      HaxColor.fromHex("#6e9f59"),
      HaxColor.fromHex("#467e4e")
    ],
  );
  static LinearGradient container_gradient_color= LinearGradient(
    colors: [
      HaxColor.fromHex("#6e9f59"),
      HaxColor.fromHex("#467e4e")
    ],
  );
  static LinearGradient button_gradient_color= LinearGradient(
    colors: [
      HaxColor.fromHex("#6e9f59"),
      HaxColor.fromHex("#467e4e")
    ],
  );
}

extension HaxColor on Color{
  static Color fromHex(String hexColorString){
    hexColorString = hexColorString.replaceAll('#', '');
    if(hexColorString.length==6){
      hexColorString ="FF" + hexColorString;
    }
    return Color(int.parse(hexColorString,radix: 16));
  }
}