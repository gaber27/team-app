import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team/constant/end_points.dart';
import 'package:team/controller/user/states.dart';
import 'package:team/model/users.dart';

import '../../generated/l10n.dart';
import '../../network/dio.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitialState());

  static UserCubit get(context) => BlocProvider.of(context);

  // This variable for pagination
  int limit = 10;
  Map<int, List<String>> userMap = {};
  final scrollController = ScrollController();
  bool loading = false ;

  UsersModel ? usersModel ;
  // Function to get user data from API
  void getUsers() {
    emit(UserLoadGetUsersState());
    DioHelper.getDate(
      url: userPoint,
      query: {
        'limit': limit.toString(), // Use the updated limit parameter
      },
    ).then((value) {
      usersModel = UsersModel.fromJson(value.data);
      // Here we update list of users if we reach to last index add ten items more
      if(state is UserSuccessIncreaseState)
      {
        usersModel!.users += usersModel!.users;
      }
      emit(UserSuccessGetUsersState());
    }).catchError((error) {
      emit(UserErrorGetUsersState());
    });
  }

  // Scroll listener function to handle pagination
  void scrollListener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      loading = true;
      limit += 10; // Increase the limit when reaching the end
      getUsers(); // Fetch more data
      emit(UserSuccessIncreaseState());
    }
  }

  // This is function to save selected user in new map take id as a key and all required info as a value
  void selectNewUser({required int id, required String firstName, required String lastName, required String image,required context}) {
    // Add the player if the ID is greater than 0
    if (id > 0 && userMap.length < 10) {
      // Add the player to the userMap
      userMap[id - 1] = [firstName, lastName, image];
      // Check if the size of userMap exceeds 10
      emit(UserAddedToNewListState());
    }else if(userMap.length == 10) {
      // Show a snackbar to inform the user that a player should been removed
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(S.of(context).complete_team_msg),
      ));

    }
  }

  // function to remove selected user from map by giving user id
  void removeUserFromMap(int userId) {
    userMap.remove(userId-1);
    emit(UserRemovedFromNewListState());
  }

  // function to check if user is selected ot not
  bool isUserInMap(int userId) {
    return userMap.containsKey(userId-1);
  }

}