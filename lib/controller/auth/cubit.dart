import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team/controller/auth/states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);
}