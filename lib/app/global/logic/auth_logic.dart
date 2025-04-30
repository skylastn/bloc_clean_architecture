import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main.dart';
import 'local_session.dart';

abstract class AuthState {}

class AuthStateUnauthenticated extends AuthState {}

class AuthStateAuthenticated extends AuthState {}

class AuthLogic extends Cubit<AuthState> {
  final localLogic = services.get<LocalSession>();
  AuthLogic(super.initialState) {}

  void login() {
    emit(AuthStateAuthenticated());
  }
  void logout() {
    localLogic.setUserId(null);
    emit(AuthStateUnauthenticated());
  }
}
