import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/core/const/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CustomTextInput extends StatefulWidget {
  const CustomTextInput({Key? key, required this.textEditingController})
      : super(key: key);
  final TextEditingController textEditingController;

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  final List<File?> _images = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 382,
          height: 163,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: AppColors.borderGrey
            ),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 6),
                child: TextFormField(
                  controller: widget.textEditingController,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusColor: Colors.white,
                  ),
                  buildCounter: (context,
                      {required currentLength, required isFocused, maxLength}) {
                    return Container(
                      transform: Matrix4.translationValues(0, 105, 0),
                      child: Text("$currentLength/$maxLength"),
                    );
                  },
                  // maxLines: 2,
                  maxLength: 400,
                ),
              ),
              SizedBox(
                child: showImages(),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  _getImages();
                },
                child: SvgPicture.asset(
                  AppIcons.addImage,
                  height: 76,
                  width: 76,
                ),
              ),
              const SizedBox(width: 15),
              SvgPicture.asset(
                AppIcons.edit2,
                height: 76,
                width: 76,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget showImages() {
    return _images.isNotEmpty
        ? SizedBox(
      height: 59, // Set a fixed height for the SizedBox
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _images.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Stack(
              children: [
                Positioned(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.background),
                      ),
                      child: Image.file(_images[index]!, fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  top: -8,
                  right: -8,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _images.removeAt(index);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.background),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: const Icon(Icons.highlight_remove_outlined),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    )
        : const SizedBox();
  }


  Future<void> _getImages() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final imageTemporary = File(image.path);
      setState(() {
        _images.add(imageTemporary);
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    } catch (e) {
      print('Error picking image: $e');
    }
  }
}
