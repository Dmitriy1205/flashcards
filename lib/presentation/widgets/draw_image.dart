import 'package:flashcards/core/const/colors.dart';
import 'package:flashcards/presentation/widgets/painting_area.dart';
import 'package:flutter/material.dart';



mixin DrawImage<T extends StatefulWidget> on State<T> {

  OverlayEntry? _dialogOverlayEntry;
  OverlayEntry? _colorPickerOverlayEntry;
  Function(Color)? onColorSelected;
  Color _selectedColor = Colors.black;

  void showOverlay(BuildContext context) {
    _dialogOverlayEntry = _createDialogOverlayEntry(context);
    _colorPickerOverlayEntry = _createColorPickerOverlayEntry(context);

    Overlay.of(context).insert(_dialogOverlayEntry!);
    Overlay.of(context).insert(_colorPickerOverlayEntry!);
  }

  void removeOverlay() {
    _dialogOverlayEntry?.remove();
    _colorPickerOverlayEntry?.remove();
  }

  OverlayEntry _createDialogOverlayEntry(BuildContext context) {
    return OverlayEntry(builder: (context) {
      return Positioned(
        top: MediaQuery.of(context).size.height / 5.5,
        left: MediaQuery.of(context).size.width / 10,
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black)),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.6,
            // padding: EdgeInsets.all(18),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () => removeOverlay(),
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO: Implement your confirm logic here
                        removeOverlay();
                      },
                      child: Text('Confirm'),
                    ),
                  ],
                ),
                PaintingArea(color: _selectedColor ),
              ],
            ),
          ),
        ),
      );
    });
  }

  OverlayEntry _createColorPickerOverlayEntry(BuildContext context) {
    return OverlayEntry(builder: (context) {
      return Positioned(
        bottom: 0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 85,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.symmetric(
                    horizontal: BorderSide(color: Colors.black))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: colors.map((color) {
                return GestureDetector(
                  onTap: () {
                    // Handle the color selection
                    print('Color $color selected');
                  },
                  child: buildColorChoice(color),
                );
              }).toList(),
            ),
          ),
        ),
      );
    });
  }

  List<Color> colors = [
    Colors.black,
    AppColors.orangePicker,
    AppColors.yellowPicker,
    AppColors.green,
    AppColors.bluePicker,
    AppColors.redPicker
  ];

  Widget buildColorChoice(Color color) {
    return GestureDetector(
      onTap: () {
        print('object $color');
        this.onColorSelected = (color) {
          setState(() {
            _selectedColor = color;
          });

        };
        _selectedColor = color;
      },
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
