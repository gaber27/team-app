import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constant/colors.dart';
import '../../constant/sizes.dart';

// This is shimmer item use in loading state when get user
Widget shimmerItem()=>Padding(
  padding: EdgeInsets.all(Sizes.pagePadding),
  child: Row(
      children: [
        CircleAvatar(
          radius: 8.w,
          backgroundColor: mainColor,
        ),
        SizedBox(width: 3.w,),
        Container(
          width: 50.w,
          height: 0.5.h,
          color: Colors.white,
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.w),
            color: Colors.white,
          ),
          width: 15.w,
          height: 8.w,
        ),

      ]
  ),
);