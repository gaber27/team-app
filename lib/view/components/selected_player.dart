import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../constant/colors.dart';
import '../../constant/images.dart';
import '../../constant/sizes.dart';
import '../../controller/user/cubit.dart';

// this is widget used to fetch data from api and to show local data so i define variable local
Widget selectedPlayer({
  required BuildContext context,
  required String firstName,
  required String lastName,
   int ?id,
  String? image,
  bool isLocal = false,
}) =>
    Padding(
      padding: EdgeInsets.all(Sizes.pagePadding),
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(
                width: 14.w, // Adjust the width as needed
                height: 14.w, // Adjust the height as needed
                child: isLocal
                    ? CircleAvatar(
                  backgroundColor: greyColor,
                  radius: 7.w,
                  child: Image.asset(Images.userImage,width: 10.w,),
                )
                    : Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 8.w,
                      child: Image.network(image!,width: 10.w,),
                    ),
                    Positioned(
                      right: -3.w,
                      top: -3.w,
                      child: IconButton(
                        onPressed: () {
                          // here we increase one because the api start indexing from 1 and index here from 0
                          UserCubit.get(context).removeUserFromMap(id!+1);},
                        icon: CircleAvatar(
                          radius: 3.w,
                          backgroundColor: mainColor,
                          child: Icon(
                            Icons.close,
                            color: redColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                '$firstName $lastName',
                style: GoogleFonts.poppins(
                  color: textColor,
                  fontSize: 9.sp,
                ),
              )
            ],
          ),
        ],
      ),
    );
