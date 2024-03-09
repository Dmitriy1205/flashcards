


/*
class DrawImage {
  OverlayEntry? _dialogOverlayEntry;

  Color _selectedColor = Colors.black;
  final GlobalKey<PaintingAreaState> _signatureKey =
  GlobalKey<PaintingAreaState>();

  void showOverlay(BuildContext context) {
    _dialogOverlayEntry = _createDialogOverlayEntry(context);

    Overlay.of(context).insert(_dialogOverlayEntry!);
  }

  void removeOverlay() {
    _dialogOverlayEntry?.remove();
  }

  OverlayEntry _createDialogOverlayEntry(BuildContext context) {
    return OverlayEntry(builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Stack(children: [
            Positioned(
              bottom: 0,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.black)),
                    boxShadow: [
                      // If you want to add shadow to the container
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: colors.map((color) {
                      return GestureDetector(
                        child: buildColorChoice(color, setState),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 104,
              right: 25,
              child: Material(
                child: InkWell(
                  onTap: () {
                    _signatureKey.currentState!.clearSignature();
                  },
                  child: Container(
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppIcons.erase,
                        height: 28,
                        width: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery
                  .of(context)
                  .size
                  .height / 5.5,
              left: MediaQuery
                  .of(context)
                  .size
                  .width / 10,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.8,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.55,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 59,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () => removeOverlay(),
                              child: Text(
                                'Cancel',
                                style: AppTheme.themeData.textTheme.labelMedium!
                                    .copyWith(
                                    fontSize: 18, color: AppColors.red),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                final img =
                                await _signatureKey.currentState!.rendered;
                                final byteData = await img.toByteData(
                                    format: ImageByteFormat.png);
                                final bytes = byteData!.buffer.asUint8List();
                                if (bytes.any((e) => e != 0)) {
                                  final base64 = base64Encode(bytes.toList());

                                  // _createEditCardKey.currentState?.frontImage = base64;
                                  setState(() {});
                                  // print(
                                  //     '_createEditCardKey.currentState?.image ${_createEditCardKey
                                  //         .currentState?.frontImage}');
                                  print('base64 $base64');
                                  // ApiHandler.clientEventsSink
                                  //     .add(SignContractClientEvent(image: base64));
                                  // context.go(Routes.startPage);
                                }
                                removeOverlay();
                              },
                              child: Text('Confirm',
                                  style: AppTheme
                                      .themeData.textTheme.labelMedium!
                                      .copyWith(
                                      fontSize: 18,
                                      color: AppColors.green)),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white),
                          child: PaintingArea(
                            color: _selectedColor,
                            key: _signatureKey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]);
        },
      );
    });
  }

  static const List<Color> colors = [
    Colors.black,
    AppColors.orangePicker,
    AppColors.yellowPicker,
    AppColors.green,
    AppColors.bluePicker,
    AppColors.redPicker
  ];

  Widget buildColorChoice(Color color, Function setState) {
    return GestureDetector(
      onTap: () {
        _selectedColor = color;
        setState(() {});
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
}*/