

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles{
  static TextStyle nameTextStyle(){
  return GoogleFonts.nunito(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );
  }
  static TextStyle headerTextStyle(double fontSize) {
    return GoogleFonts.nunito(
      fontSize:  fontSize,
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(243, 251, 252, 1),
    );
  }
   static TextStyle headerMenuTextStyle({required Color color, required }) {
    return GoogleFonts.nunito(
      fontSize:  19,
      fontWeight: FontWeight.bold,
     color: color,
    );
  }

  static TextStyle monteserratStyle(double fontSize) {
    return GoogleFonts.montserrat(
      color: Color.fromRGBO(243, 251, 252, 1),
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      letterSpacing: 2,
    );
  }

  static TextStyle monteserratblueStyle({required Color color, required double fontSize}) {
    return GoogleFonts.montserrat(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      letterSpacing: 2,
    );
  }

  static TextStyle normalStyle({required double fontSize}) {
    return GoogleFonts.signikaNegative(
      color: Color.fromRGBO(243, 251, 252, 1),
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
      letterSpacing: 1,
    );
  }
}