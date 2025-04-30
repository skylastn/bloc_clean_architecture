import 'package:dartz/dartz.dart';

import 'package:kiosk_bo/app/common/exception.dart';

import 'package:kiosk_bo/feature/auth/infrastructure/model/request/auth_request.dart';

import 'package:kiosk_bo/feature/auth/infrastructure/model/response/auth_response.dart';
import 'package:kiosk_bo/feature/auth/infrastructure/model/response/user_response.dart';

import '../../domain/interface/auth_repository_base.dart';
import '../data_source/auth_remote_data_source.dart';

class AuthRepository implements AuthRepositoryBase {
  @override
  Future<Either<GenericException, AuthResponse>> login({
    required AuthRequest request,
  }) async {
    var result = await AuthRemoteDataSource().login(request: request);
    return result.fold((l) => Left(l), (r) {
      return Right(r);
    });
  }

  @override
  Future<Either<GenericException, UserResponse>> getUserProfile() async {
    return await AuthRemoteDataSource().getUserProfile();
  }
}
