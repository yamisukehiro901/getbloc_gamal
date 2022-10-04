// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List<UserModel> userModel;
  const UserLoadedState({
    required this.userModel,
  });
  @override
  List<Object> get props => [userModel];
}

class UserErrorState extends UserState {
  final String msgError;
  const UserErrorState({
    required this.msgError,
  });
  @override
  List<Object> get props => [msgError];
}
