import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../constant/colors.dart';
import '../../constant/sizes.dart';

Widget textBtn({required String text})=>Padding(
  padding:  EdgeInsets.all(Sizes.pagePadding),
  child: Container(
    decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(16)
    ),
    child: TextButton(onPressed: (){}, child: Padding(
      padding:  EdgeInsets.all(Sizes.btnPadding),
      child: Text(text,style: GoogleFonts.poppins(
          color: mainColor,
          fontWeight: FontWeight.w500,
          fontSize: 12.sp

      ),),
    )),
  ),
);