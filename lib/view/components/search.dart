import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constant/colors.dart';
import '../../constant/sizes.dart';
import '../../generated/l10n.dart';

Widget searchBar({required context,required function, required controller})=> Padding(
  padding:  EdgeInsets.all(Sizes.pagePadding),
  child: TextFormField(
    controller: controller,
    cursorColor: secondColor,
    onEditingComplete: function ,
    decoration: InputDecoration(
        labelText: S.of(context).search_hint,
        border: const OutlineInputBorder(),
        floatingLabelStyle: TextStyle(color: secondColor),
        filled: true,
        fillColor: greyColor,
        prefixIcon: const Icon(Icons.search_outlined),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.w),
            borderSide: BorderSide(color: greyColor)
        ),
        errorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.w),
            borderSide: BorderSide(color: greyColor)
        ),
        enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.w),
            borderSide: BorderSide(color: greyColor)
        ),
        focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.w),
            borderSide: BorderSide(color: secondColor)
        )

    ),
  ),
);