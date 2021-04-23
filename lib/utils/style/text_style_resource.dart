import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleResource {
  static TextStyle textTitle(Color clr) => GoogleFonts.openSans(
    fontSize: 24,
    color: clr
  );

  static TextStyle textTitleBold(Color clr) => GoogleFonts.openSans(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: clr
  );
  
  static TextStyle textBody(Color clr) => GoogleFonts.openSans(
    fontSize:18,
    color: clr
  );

  static TextStyle textBodyBold(Color clr) => GoogleFonts.openSans(
    fontSize:18,
    fontWeight: FontWeight.bold,
    color: clr
  );

  static TextStyle textCaption(Color clr) => GoogleFonts.openSans(
    fontSize: 12,
    color: clr
  );

  static TextStyle textCaptionBold(Color clr) => GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: clr
  );
}