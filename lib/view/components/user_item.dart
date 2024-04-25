
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:team/controller/user/states.dart';
import '../../constant/colors.dart';
import '../../constant/sizes.dart';
import '../../controller/user/cubit.dart';
import '../../generated/l10n.dart';

// Widget ui for user to show it take first name , last name & image from api
Widget userItem({required String firstName , required String lastName ,required String image,required context,required function,required int id})=>BlocConsumer<UserCubit,UserStates>(
  listener: (context, state) {},
  builder: (context, state) => Padding(
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
              color:
              // By this condition i can check if this user is selected or not
              UserCubit.get(context).isUserInMap(id)?
              redColor: secondColor,
              borderRadius: BorderRadius.circular(50.w)
          ),
          child: TextButton(onPressed: function, child: Text(
            UserCubit.get(context).isUserInMap(id)?
            S.of(context).remove:S.of(context).add,style: GoogleFonts.poppins(
              color: mainColor,
              fontWeight: FontWeight.w400,
              fontSize: 9.sp

          ),)),
        )
      ],
    ),
  ),
);