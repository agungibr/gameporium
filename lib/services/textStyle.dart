import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  static TextStyle text(size, weight) {
    return GoogleFonts.roboto(
      fontSize: size.toDouble(),
      fontWeight: weight,
    );
  }
}
