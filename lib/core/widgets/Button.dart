
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intern_task/core/constants/responsiveUi.dart';
import 'package:intern_task/core/constants/theme.dart';

Widget Button(
  BuildContext context, 
  dynamic Widget, {

  double? width,
  double? height,
  Color? TextColor,
  Color? ContainerColor,
  double? fontsize,
  double? radius,
  void Function()? onPressed,
}) {
  return MaterialButton(
    onPressed: onPressed,
    child: Container(
      height: height ?? screenHeight(context) * 0.07,
      width: width ?? screenWidth(context) * 0.4,
      decoration: BoxDecoration(
        color: ContainerColor ?? AppColors.salmonColor,
        borderRadius: BorderRadius.circular(radius ?? 15),
      ),
      alignment: Alignment.center,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Widget,
         
        ],
      ),
    ),
  );
}

Text ButtonText(
  String text,
  BuildContext context, {
  Color? TextColor,
  double? FontSize,
}) {
  return Text(
    text,
    style: GoogleFonts.raleway(
      fontSize: FontSize ?? screenWidth(context) * 0.045,
      fontWeight: FontWeight.w700,
      color: TextColor ?? AppColors.salmonColor,
    ),
  );
}
