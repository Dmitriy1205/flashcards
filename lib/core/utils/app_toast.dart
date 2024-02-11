import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';

class AppToast{
  static OverlayEntry? _currentOverlay;
  static const Duration _delay = Duration(seconds: 4);

  static void showError(BuildContext context, String error) async{
    _showOverlay(context, _Toast(msg: error,
      toastDuration: _delay,
      leading: Text("🚨"), leftBorderColor: const Color(0xFFCD0000), textColor: const Color(0xFFCD0000),));
  }

  static void showSuccess(BuildContext context, String msg) async{
    _showOverlay(context, _Toast(msg: msg,
      toastDuration: _delay,
      leading: Text("✅"), leftBorderColor: AppColors.green, textColor: AppColors.green,));
  }

  static _showOverlay(BuildContext context, Widget widget) async{
    _currentOverlay?.remove();
    _currentOverlay = null;
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(builder: (context){
      return widget;
    });
    overlayState.insert(overlayEntry);
    _currentOverlay = overlayEntry;
    await Future.delayed(_delay);
    if(_currentOverlay != null){
      _currentOverlay!.remove();
      _currentOverlay = null;
    }
  }
}

class _Toast extends StatefulWidget {
  final String msg;
  final Color leftBorderColor;
  final Color textColor;
  final Widget leading;
  final Duration toastDuration;
  const _Toast({Key? key, required this.msg, required this.leftBorderColor, required this.textColor, required this.toastDuration, required this.leading}) : super(key: key);

  @override
  State<_Toast> createState() => _ToastState();
}

class _ToastState extends State<_Toast> with SingleTickerProviderStateMixin{
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _opacity = 1;
      });
    });
    Future.delayed(Duration(seconds: widget.toastDuration.inSeconds - 1), (){
      setState(() {
        _opacity = 0;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).padding.bottom,
      left: 0,
      right: 0,
      child: Material(
        type: MaterialType.transparency,
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 1),
          child: Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
                color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(2,3),
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 6
                )
              ]
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(width: 4, height: 48, color: widget.leftBorderColor,),
                const SizedBox(width: 21,),
                widget.leading,
                const SizedBox(width: 27,),
                Expanded(child: Text(widget.msg, style: TextStyle(color: widget.textColor), maxLines: 2, overflow: TextOverflow.ellipsis,)),
                const SizedBox(width: 13,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
