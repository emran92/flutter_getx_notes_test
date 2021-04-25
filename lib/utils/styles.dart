import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


TextStyle appFont = GoogleFonts.poppins(
  fontWeight: FontWeight.normal,
  fontSize: 18,
  color: Colors.black,
);

InputDecoration styleTextInputDeco = InputDecoration(
  fillColor: Colors.grey[200],
  filled: true,
  hintStyle: appFont,
  contentPadding: EdgeInsets.all(10),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: Colors.white,
    )
  ),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Colors.white,
      )
  ),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Colors.white,
      )
  ),
);

Color colorPrimary = Color(0xff1D82D2);
Color colorPrimaryDark = Color(0xff0A2662);