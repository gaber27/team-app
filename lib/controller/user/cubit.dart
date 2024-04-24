import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team/constant/end_points.dart';
import 'package:team/controller/user/states.dart';
import 'package:team/model/users.dart';

import '../../network/dio.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitialState());

  static UserCubit get(context) => BlocProvider.of(context);

  // function to get user from api by using dio class special get function take endpoint
  UsersModel? usersModel ;
  void getUsers()
  {
    emit(UserLoadGetUsersState());
    DioHelper.getDate(
        url: userPoint
    ).then((value) {
      usersModel = UsersModel.fromJson(value.data);
      print(usersModel!.users.length);
      emit(UserSuccessGetUsersState());
    }).catchError((error) {
      print(error);
      emit(UserErrorGetUsersState());
    });
  }
}