import 'package:flutter/material.dart';
import 'package:intern_task/core/constants/responsiveUi.dart';
import 'package:intern_task/core/constants/theme.dart';
import 'package:google_fonts/google_fonts.dart';

Widget ralewayText(
  String text,
  BuildContext context, {
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
  TextAlign? align,
}) => Text(
  text,
  textAlign: align ?? TextAlign.center,
  style: GoogleFonts.raleway(
    fontSize: fontSize ?? screenWidth(context) * 0.04,
    color: color ??AppColors.salmonColor,
    fontWeight: fontWeight ?? FontWeight.w700,
  ),
);