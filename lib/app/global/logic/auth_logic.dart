import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk_bo/app/global/model/token_model.dart';
import 'package:kiosk_bo/feature/auth/application/auth_service.dart';
import 'package:kiosk_bo/feature/auth/infrastructure/model/response/user_response.dart';
import 'package:kiosk_bo/feature/core/infrastructure/model/response/navigation_response.dart';

import '../../../feature/auth/infrastructure/model/request/auth_request.dart';
import '../../../main.dart';
import 'local_session.dart';

abstract class AuthState {}

class AuthStateUnauthenticated extends AuthState {}

class AuthStateAuthenticated extends AuthState {
  final UserResponse? user;
  final List<NavigationResponse> navigation;

  AuthStateAuthenticated(this.user, this.navigation);
}

class AuthLogic extends Cubit<AuthState> {
  final localLogic = inject.get<LocalSession>();
  final _services = AuthService();
  UserResponse? user;
  List<NavigationResponse> navigation = [];
  AuthLogic(super.initialState);

  Future<Either<String?, bool>> login(AuthRequest request) async {
    var result = await _services.login(request: request);
    return result.fold((l) => Left(l.message), (r) async {
      await localLogic.setTokenModel(
        TokenModel(
          token: r.token,
          refreshToken: r.refreshToken,
          updatedAt: DateTime.now(),
        ),
      );
      await initAfterLogin();
      return Right(true);
    });
  }

  Future<void> initAfterLogin() async {
    await getUser();
    await getNavigationUser();
    // log('user 2 : ${user?.name}');
    emit(AuthStateAuthenticated(user, navigation));
  }

  Future<void> getUser() async {
    var result = await _services.getUserProfile();
    result.fold((l) => null, (r) {
      // emit(AuthStateAuthenticated(r));
      // log('user 1 : ${user?.toJson()}');
      user = r;
    });
  }

  Future<void> getNavigationUser() async {
    var result = await _services.getNavigationUser();
    result.fold((l) => null, (r) {
      // emit(AuthStateAuthenticated(r));
      navigation = r;
    });
  }

  void logout() {
    localLogic.setTokenModel(null);
    emit(AuthStateUnauthenticated());
  }

  Future<bool> checkAuth() async {
    if (await localLogic.tokenModel == null) {
      emit(AuthStateUnauthenticated());
      return false;
    }
    return true;
  }
}
