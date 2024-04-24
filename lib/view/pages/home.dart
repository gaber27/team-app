import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team/controller/app/cubit.dart';
import 'package:team/controller/app/states.dart';
import 'package:team/controller/user/cubit.dart';
import 'package:team/controller/user/states.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) => BlocConsumer<UserCubit,UserStates>(
          listener: (context, state) {} ,
          builder: (context, state) => Scaffold()),
    );
  }
}
