import 'dart:async';
import 'package:bloc_cubit/domain/data_provider/user_data_provider.dart';
import 'package:bloc_cubit/domain/entity/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserState {
  final User currentUser;

  UserState({required this.currentUser});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserState &&
          runtimeType == other.runtimeType &&
          currentUser == other.currentUser);

  @override
  int get hashCode => currentUser.hashCode;

  @override
  String toString() {
    return 'UsersState{ currentUser: $currentUser }';
  }

  UserState copyWith({
    User? currentUser,
  }) {
    return UserState(
      currentUser: currentUser ?? this.currentUser,
    );
  }

//</editor-fold>
}

class UserCubit extends Cubit<UserState> {
  final _userDataProvider = UserDataProvider();

  // var _state = UserState(currentUser: User(0));
  //
  // final _stateController = StreamController<UserState>.broadcast();

  // UserState get state => _state;
  //
  // Stream<UserState> get stream => _stateController.stream;

  UserCubit() : super(UserState(currentUser: User(0))) {
    _initialaze();
  }

//
// void updateState(UserState state) {
//   if (_state == state) return;
//   _state = state;
//   _stateController.add(state);
// }

  Future<void> _initialaze() async {
    final user = await _userDataProvider.loadValue();
    final newState = state.copyWith(currentUser: user);
    emit(newState);
  }

  void increment() {
    var user = state.currentUser;
    user = user.copyWith(age: user.age + 1);
    emit(state.copyWith(currentUser: user));
    _userDataProvider.saveValue(user);
  }

  void decrement() {
    var user = state.currentUser;
    user = user.copyWith(age: user.age - 1);
    emit(state.copyWith(currentUser: user));
    _userDataProvider.saveValue(user);
  }
}
