import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroComponent extends StatefulWidget {
  final String image;
  final Color bgColor;
  final String promoText;

  const IntroComponent(
      {super.key,
      required this.image,
      required this.bgColor,
      required this.promoText});

  @override
  State<IntroComponent> createState() => _IntroComponentState();
}

class _IntroComponentState extends State<IntroComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(widget.image)),
            color: widget.bgColor),
        alignment: Alignment.topLeft,
        // ignore: prefer_const_constructors
        child: Padding(
            padding: const EdgeInsets.only(top: 150, left: 30),
            child: Text(
              widget.promoText,
              style: GoogleFonts.poppins(fontSize: 24),
            )));
  }
}
