import 'package:flutter/material.dart';

enum ButtonSize { fill, normal }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final ButtonSize buttonSize;
  final BorderSide side;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.buttonSize,
    required this.side,
  });

  factory AppButton.fill({
    Key? key,
    required String text,
    required VoidCallback? onPressed,
  }) {
    return AppButton(
      key: key,
      text: text,
      onPressed: onPressed,
      backgroundColor: Colors.blue,
      buttonSize: ButtonSize.fill,
      side: BorderSide.none,
    );
  }

  factory AppButton.normal({
    Key? key,
    required String text,
    required VoidCallback? onPressed,
  }) {
    return AppButton(
      key: key,
      text: text,
      onPressed: onPressed,
      backgroundColor: Colors.transparent,
      buttonSize: ButtonSize.normal,
      side: const BorderSide(
        width: 1,
        color: Colors.blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        fixedSize: Size(MediaQuery.sizeOf(context).width, 65),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: side,
        ),
        disabledBackgroundColor: const Color(0xff8C8C8C),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xFFFDFDFD),
          fontSize: 18,
        ),
      ),
    );
  }
}
