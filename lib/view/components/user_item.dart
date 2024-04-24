
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../constant/colors.dart';
import '../../constant/sizes.dart';
import '../../generated/l10n.dart';

// Widget ui for user to show it take first name , last name & image from api
Widget userItem({required String firstName , required String lastName ,required String image,required context})=>Padding(
  padding: EdgeInsets.all(Sizes.pagePadding),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 8.w,
          child: Image.network(image.toString())),
      SizedBox(width: 3.w,),
      Text('$firstName $lastName',style: GoogleFonts.poppins(
          color: headingColor,
          fontWeight: FontWeight.w500,
          fontSize: 11.sp

      ),),
      const Spacer(),
      Container(
        height: 5.h,
        decoration: BoxDecoration(
            color: secondColor,
            borderRadius: BorderRadius.circular(50.w)
        ),
        child: TextButton(onPressed: (){}, child:  Text(S.of(context).add,style: GoogleFonts.poppins(
            color: mainColor,
            fontWeight: FontWeight.w400,
            fontSize: 9.sp

        ),)),
      )
    ],
  ),
);