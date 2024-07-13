

class DayDateModelClass {
  List<String> customDates;
  List<String> customDay;

  DayDateModelClass({required this.customDates, required this.customDay});

  factory DayDateModelClass.fromJson(Map<String, dynamic> json) {
    return DayDateModelClass(
      customDates: json['customDates'].cast<String>(),
      customDay: json['customDay'].cast<String>(),
    );
  }
}