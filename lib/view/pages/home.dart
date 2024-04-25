import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:team/constant/colors.dart';
import 'package:team/controller/app/cubit.dart';
import 'package:team/controller/app/states.dart';
import 'package:team/controller/user/cubit.dart';
import 'package:team/controller/user/states.dart';
import 'package:team/view/components/shimmer_item.dart';
import 'package:team/view/components/user_item.dart';

import '../../generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    UserCubit.get(context).scrollController.addListener(UserCubit.get(context).scrollListener);
    UserCubit.get(context).getUsers();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) => BlocConsumer<UserCubit,UserStates>(
          listener: (context, state){},
          builder: (context, state) => Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(S.of(context).appbar_title,style: GoogleFonts.poppins(
                color: headingColor,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp

              ),),
            ),
            body: Column(
              children: [
                ConditionalBuilder(
                  condition: state is !UserLoadGetUsersState,
                  fallback: (context) =>
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                      itemBuilder: (context, index) =>  Shimmer.fromColors(
                          baseColor: greyColor,
                          highlightColor: greyColor,
                          child:shimmerItem()
                      ),
                  ),
                  builder: (context) => Expanded(
                    child: ListView.builder(
                        controller: UserCubit.get(context).scrollController,
                        shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: UserCubit.get(context).usersModel!.users.length,
                      itemBuilder: (context, index) =>
                      userItem(firstName: UserCubit.get(context).usersModel!.users[index].firstName, lastName: UserCubit.get(context).usersModel!.users[index].lastName, image: UserCubit.get(context).usersModel!.users[index].image, context: context)
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

}
