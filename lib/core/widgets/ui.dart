import 'package:flutter/material.dart';
import 'package:intern_task/core/constants/theme.dart';

Widget backGroundcircle(double redius, Widget widget) {
  return CircleAvatar(
    maxRadius: redius,
    backgroundColor: AppColors.salmonColor,

    child: Align(alignment: Alignment.center, child: widget),
  );
}
