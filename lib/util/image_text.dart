import 'package:celebrare/util/text_info.dart';
import 'package:flutter/material.dart';

class ImageText extends StatelessWidget {
  final TextInformation textInfo;
  const ImageText({super.key,required this.textInfo});

  @override
  Widget build(BuildContext context) {
    return Text(
      textInfo.text,
      textAlign: textInfo.textAlign,
      style: TextStyle(
        fontSize: textInfo.fontSize,
        fontWeight: textInfo.fontWeight,
        color: textInfo.color,
        fontStyle: textInfo.fontStyle
      ),
    );
  }
}
