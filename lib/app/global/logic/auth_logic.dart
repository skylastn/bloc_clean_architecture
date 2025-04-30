import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk_bo/feature/auth/application/auth_service.dart';
import 'package:kiosk_bo/feature/auth/infrastructure/model/response/user_response.dart';

import '../../../feature/auth/infrastructure/model/request/auth_request.dart';
import '../../../main.dart';
import 'local_session.dart';

abstract class AuthState {}

class AuthStateUnauthenticated extends AuthState {}

class AuthStateAuthenticated extends AuthState {
  final UserResponse? user;
  AuthStateAuthenticated(this.user);
}

class AuthLogic extends Cubit<AuthState> {
  final localLogic = inject.get<LocalSession>();
  final _services = AuthService();
  AuthLogic(super.initialState);

  Future<Either<String?, bool>> login(AuthRequest request) async {
    var result = await _services.login(request: request);
    return result.fold((l) => Left(l.message), (r) async {
      await localLogic.setToken(r.token);
      await getUser();
      return Right(true);
    });
  }

  Future<void> getUser() async {
    var result = await _services.getUserProfile();
    result.fold((l) => null, (r) {
      emit(AuthStateAuthenticated(r));
    });
  }

  void logout() {
    localLogic.setToken(null);
    emit(AuthStateUnauthenticated());
  }

  Future<bool> checkAuth() async {
    if (localLogic.token == null) {
      emit(AuthStateUnauthenticated());
      return false;
    }
    await getUser();
    return true;
  }
}
