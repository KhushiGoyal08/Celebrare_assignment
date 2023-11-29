import 'dart:ui';

class TextInformation{
  String text;
  double left;
  double top;
  Color color;
  FontWeight fontWeight;
  FontStyle fontStyle;
  double fontSize;
  TextAlign textAlign;

  TextInformation({
    required this.textAlign,
    required this.fontStyle,
    required this.fontWeight,
    required this.color,
    required this.text,
    required this.left,
    required this.fontSize,
    required this.top
});
}