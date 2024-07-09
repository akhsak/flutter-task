import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidgets {
  Widget rectangleButton(Size size,
      {required String name,
      required VoidCallback? onPressed,
      Color? bgColor,
      Color? fgColor,
      BorderRadius? borderRadius,
      Border? border}) {
    return Container(
      height: size.height * .08,
      width: size.width * double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: const MaterialStatePropertyAll(BeveledRectangleBorder()),
          foregroundColor: MaterialStateProperty.all(
              fgColor ?? const Color.fromARGB(255, 8, 5, 5)),
        ),
        onPressed: onPressed,
        child: Text(name,
            style: GoogleFonts.abel(
              fontSize: size.width * .05,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }

  Widget rectangleButtonWidth(
    Size size, {
    required String name,
    required VoidCallback? onPressed,
    double? height,
    double? width,
    Color? bgColor,
    Color? fgColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Color.fromARGB(255, 5, 5, 5), width: 2),
      ),
      height: height ?? size.height,
      width: width ?? size.width,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: const MaterialStatePropertyAll(BeveledRectangleBorder()),
          backgroundColor: MaterialStateProperty.all(
              bgColor ?? Color.fromARGB(255, 2, 2, 3)),
          foregroundColor: MaterialStateProperty.all(
              fgColor ?? const Color.fromARGB(255, 9, 7, 7)),
        ),
        onPressed: onPressed,
        child: Text(name,
            style: GoogleFonts.abel(
              fontSize: size.width * .05,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
