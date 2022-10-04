import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getbloc_gamal/bloc/user/user_bloc.dart';
import 'package:getbloc_gamal/modules/users/controllers/user_controllers.dart';

class UserViews extends StatefulWidget {
  const UserViews({super.key});

  @override
  State<UserViews> createState() => _UserViewsState();
}

class _UserViewsState extends State<UserViews> {
  final UserBloc _userBloc = UserBloc();

  @override
  void initState() {
    super.initState();
    _userBloc.add(LoadUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Views"),
      ),
      body: BlocProvider(
        create: (context) => _userBloc,
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is UserLoadedState) {
              return ListView.builder(
                itemCount: state.userModel.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing: const Icon(Icons.list),
                    title: Text(
                      "${state.userModel[index].firstName}",
                      style: const TextStyle(color: Colors.green, fontSize: 15),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        state.userModel[index].avatar.toString(),
                      ),
                    ),
                  );
                },
              );
            }

            if (state is UserErrorState) {
              return Text(state.msgError);
            }
            return Container();

            /*
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                    leading: const Icon(Icons.list),
                    trailing: const Text(
                      "GFG",
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    ),
                    title: Text("List User $index"));
              },
            );

            */
          },
        ),
      ),
    );
  }
}
