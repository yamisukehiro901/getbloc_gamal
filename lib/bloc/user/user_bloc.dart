// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'package:getbloc_gamal/modules/users/controllers/user_controllers.dart';
import 'package:getbloc_gamal/modules/users/models/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      final UserControllers userControllers = UserControllers();
      emit(UserLoadingState());

      try {
        List<UserModel> users = await userControllers.getDataUser();
        emit(UserLoadedState(userModel: users));
      } catch (e) {
        debugPrint("error");
        emit(UserErrorState(msgError: e.toString()));
      }
    });
  }
}
