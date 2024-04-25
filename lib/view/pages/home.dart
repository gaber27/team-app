import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:team/constant/colors.dart';
import 'package:team/constant/sizes.dart';
import 'package:team/controller/app/cubit.dart';
import 'package:team/controller/app/states.dart';
import 'package:team/controller/user/cubit.dart';
import 'package:team/controller/user/states.dart';
import 'package:team/view/components/selected_player.dart';
import 'package:team/view/components/shimmer_item.dart';
import 'package:team/view/components/text_button.dart';
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
                SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  // Scroll horizontally
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // The initial selected player widget
                      selectedPlayer(
                        context: context,
                        firstName: S.of(context).test,
                        lastName: S.of(context).account,
                        isLocal: true,
                      ),
                      // SizedBox to constrain the width of the list of players
                      SizedBox(
                        height: 15.h,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                            10, // Generate 10 items
                                (index) {
                              if (index < UserCubit.get(context).userMap.length) {
                                // If there is a user in the userMap at the current index, display it
                                final userData = UserCubit.get(context).userMap.values.toList()[index];
                                return selectedPlayer(
                                  id:UserCubit.get(context).userMap.keys.toList()[index] ,
                                  context: context,
                                  firstName: userData[0],
                                  lastName: userData[1],
                                  image: userData[2],
                                );
                              } else {
                                // If there is no user in the userMap at the current index, display a default icon
                                return Padding(
                                  padding: EdgeInsets.all(Sizes.pagePadding),
                                  child: Container(
                                    height: 16.w,
                                    width: 16.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: mainColor,
                                      border: Border.all(color: greyColor),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(Sizes.pagePadding),
                                      child: Icon(
                                        Icons.person_add_alt_outlined,
                                        color: headingColor,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                      userItem(
                          function:()=>
                          UserCubit.get(context).isUserInMap(UserCubit.get(context).usersModel!.users[index].id)?
                              UserCubit.get(context).removeUserFromMap(UserCubit.get(context).usersModel!.users[index].id):
                              UserCubit.get(context).selectNewUser(id: UserCubit.get(context).usersModel!.users[index].id, firstName: UserCubit.get(context).usersModel!.users[index].firstName, lastName: UserCubit.get(context).usersModel!.users[index].lastName, image: UserCubit.get(context).usersModel!.users[index].image, context: context),
                          id: UserCubit.get(context).usersModel!.users[index].id,firstName: UserCubit.get(context).usersModel!.users[index].firstName, lastName: UserCubit.get(context).usersModel!.users[index].lastName, image: UserCubit.get(context).usersModel!.users[index].image, context: context)
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: textBtn(text: S.of(context).cont)
            
          )),
    );
  }

}
