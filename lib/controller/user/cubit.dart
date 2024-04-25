import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team/constant/end_points.dart';
import 'package:team/controller/user/states.dart';
import 'package:team/model/users.dart';

import '../../network/dio.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitialState());

  static UserCubit get(context) => BlocProvider.of(context);

  // This variable for pagination
  int limit = 10;
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
      }else{

      }
      print(usersModel!.users.length);
      emit(UserSuccessGetUsersState());
    }).catchError((error) {
      print(error);
      emit(UserErrorGetUsersState());
    });
  }

  // Scroll listener function to handle pagination
  void scrollListener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      limit += 10; // Increase the limit when reaching the end
      getUsers(); // Fetch more data
      emit(UserSuccessIncreaseState());
    }
  }
}