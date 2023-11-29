import 'package:celebrare/pages/edit_image.dart';
import 'package:celebrare/util/button.dart';
import 'package:celebrare/util/text_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

abstract class ImageViewModel extends State<EditImage> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController creatorTextEditingController = TextEditingController();
  List<TextInformation> texts = [];
  int currentIndex = 0;
  Color color = Colors.black;

  setCurrentIndex(BuildContext context, int index) {
    setState(() {
      currentIndex = index;
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
      "Selected for Styling",
      style: TextStyle(fontSize: 16),
    )));
  }

  // changing the color
  void changeColor(Color color) {
    setState(() {
      texts[currentIndex].color = color;
    });
  }

  Color colorOfCircle(context) {
    color = texts[currentIndex].color;
    return color;
  }

  addColorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: color,
            onColorChanged: changeColor,
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text(
              'Got it',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  // add new text
  addNewText(BuildContext context) {
    setState(() {
      texts.add(TextInformation(
          textAlign: TextAlign.left,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          color: Colors.black,
          text: textEditingController.text,
          left: 0,
          fontSize: 20,
          top: 0));
      Navigator.of(context).pop();
    });
  }

  // increasing the font size
  increaseFontSize() {
    setState(() {
      texts[currentIndex].fontSize = texts[currentIndex].fontSize + 2;
    });
  }

  // decreasing the font size
  decreaseFontSize() {
    setState(() {
      texts[currentIndex].fontSize = texts[currentIndex].fontSize - 2;
    });
  }

  // bold font
  boldFont() {
    setState(() {
      (texts[currentIndex].fontWeight == FontWeight.bold)
          ? texts[currentIndex].fontWeight = FontWeight.normal
          : texts[currentIndex].fontWeight = FontWeight.bold;
    });
  }

  italicFont() {
    setState(() {
      (texts[currentIndex].fontStyle == FontStyle.italic)
          ? texts[currentIndex].fontStyle = FontStyle.normal
          : texts[currentIndex].fontStyle = FontStyle.italic;
    });
  }

  //  align
  centerAlign() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.center;
    });
  }

  leftAlign() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.left;
    });
  }

  rightAlign() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.right;
    });
  }

  // add lines to the text

  addNewLineToText() {
    setState(() {
      (texts[currentIndex].text.contains("\n"))
          ? texts[currentIndex].text =
              texts[currentIndex].text.replaceAll("\n ", " ")
          : texts[currentIndex].text =
              texts[currentIndex].text.replaceAll(" ", "\n");
    });
  }

  // remove the text

  removeText(BuildContext context) {
    setState(() {
      texts.removeAt(currentIndex);
    });
  }

  // addition of dialog box
  addNewDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("Add New Text"),
        content: TextField(
          controller: textEditingController,
          maxLines: 5,
          decoration: const InputDecoration(
              suffixIcon: Icon(Icons.edit),
              filled: true,
              hintText: "Your Text Here..."),
        ),
        actions: <Widget>[
          Button(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Back"),
              color: Colors.blue,
              textColor: Colors.black),
          Button(
              onPressed: () {
                addNewText(context);
              },
              child: Text("Add Text"),
              color: Colors.red,
              textColor: Colors.black),
        ],
      ),
    );
  }
}
