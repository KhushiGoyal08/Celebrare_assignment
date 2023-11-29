import 'dart:io';

import 'package:celebrare/util/view_model.dart';
import 'package:flutter/material.dart';

import '../util/image_text.dart';

class EditImage extends StatefulWidget {
  final String selectedImage;
  const EditImage({Key? key, required this.selectedImage}) : super(key: key);

  @override
  State<EditImage> createState() => _EditImageState();
}

class _EditImageState extends ImageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                _selectedImage(),
                for (int i = 0; i < texts.length; i++)
                  Positioned(
                    left: texts[i].left,
                    top: texts[i].top,
                    child: GestureDetector(
                      onLongPress: () {
                       setState(() {
                         currentIndex=i;
                         removeText(context);
                       });
                      },
                      onTap: () => setCurrentIndex(context,i),
                      child: Draggable(
                        feedback: ImageText(textInfo: texts[i]),
                        child: ImageText(
                          textInfo: texts[i],
                        ),
                        onDragEnd: (drag) {
                          final renderBox =
                              context.findRenderObject() as RenderBox;
                          Offset off = renderBox.globalToLocal(drag.offset);
                          setState(() {
                            texts[i].top = off.dy-90;
                            texts[i].left = off.dx;
                          });
                        },
                      ),
                    ),
                  ),
                creatorTextEditingController.text.isNotEmpty
                    ? Positioned(
                        left: 0,
                        bottom: 0,
                        child: Text(
                          creatorTextEditingController.text,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.3)),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _addNewText,

    );
  }

  // showing the image
  Widget _selectedImage() {
    return Center(
      child: Image.file(
        File(widget.selectedImage),
        fit: BoxFit.fill,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  //floating action button
  Widget get _addNewText {
    return FloatingActionButton(
      onPressed: () {
        addNewDialog(context);
      },
      backgroundColor: Colors.white,
      tooltip: "Add New Text",
      child: const Icon(
        Icons.edit,
        color: Colors.black,
      ),
    );
  }

  // Appbar
  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: SizedBox(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            IconButton(
              tooltip: "Increase Font Size",
                onPressed: () {
                increaseFontSize();
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                )),
            IconButton(
              tooltip: "Decrease Font Size",
                onPressed: () {
                decreaseFontSize();
                },
                icon: const Icon(
                  Icons.remove,
                  color: Colors.black,
                )),
            IconButton(
              tooltip: "Align Left",
                onPressed: () {
                leftAlign();
                },
                icon: const Icon(
                  Icons.format_align_left,
                  color: Colors.black,
                )),
            IconButton(
              tooltip: "Align Center",
                onPressed: () {
                centerAlign();
                },
                icon: const Icon(
                  Icons.format_align_center,
                  color: Colors.black,
                )),
            IconButton(
              tooltip: "Align Right",
                onPressed: () {
                rightAlign();
                },
                icon: const Icon(
                  Icons.format_align_right,
                  color: Colors.black,
                )),
            IconButton(
              tooltip: "Bold",
                onPressed: () {
                boldFont();
                },
                icon: const Icon(
                  Icons.format_bold,
                  color: Colors.black,
                )),
            IconButton(
              tooltip: "Italic",
                onPressed: () {
                italicFont();
                },
                icon: const Icon(
                  Icons.format_italic,
                  color: Colors.black,
                )),
            IconButton(
              tooltip: "Add New Line",
                onPressed: () {
                addNewLineToText();
                },
                icon: const Icon(
                  Icons.space_bar,
                  color: Colors.black,
                )),

          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              addColorDialog(context);
            },
            child: const  Text("Color")
          ),
        )
      ],
    );
  }
}
