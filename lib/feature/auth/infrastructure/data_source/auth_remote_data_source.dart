import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:kiosk_bo/feature/auth/infrastructure/model/request/auth_request.dart';
import 'package:kiosk_bo/feature/auth/infrastructure/model/response/auth_response.dart';
import 'package:kiosk_bo/feature/auth/infrastructure/model/response/user_response.dart';
import 'package:kiosk_bo/feature/core/infrastructure/model/response/navigation_response.dart';

import '../../../../app/common/exception.dart';
import '../../../../app/network/api_provider.dart';
import '../../../../main.dart';
import '../../../../shared/constant/endpoint_path.dart';

class AuthRemoteDataSource {
  final _apiProvider = inject.get<ApiProvider>();
  Future<Either<GenericException, AuthResponse>> login({
    required AuthRequest request,
  }) async {
    try {
      var response = await _apiProvider.postApi(
        EndpointPath.login,
        body: request.toMap(),
      );
      if (!response.isError) {
        return Right(
          AuthResponse.fromMap(jsonDecode(response.result?.body ?? '')),
        );
      }
      return Left(
        ServerRequestException(
          code: ExceptionCode.serverFailure,
          value: response.msg,
        ),
      );
    } catch (e) {
      return Left(
        ServerRequestException(
          code: ExceptionCode.unknown,
          value: e.toString(),
        ),
      );
    }
  }

  Future<Either<GenericException, UserResponse>> getUserProfile() async {
    try {
      var response = await _apiProvider.getApi(EndpointPath.userProfile);
      if (!response.isError) {
        log('test response : ${response.result?.body}');
        return Right(
          UserResponse.fromMap(jsonDecode(response.result?.body ?? '')),
        );
      }
      return Left(
        ServerRequestException(
          code: ExceptionCode.serverFailure,
          value: response.msg,
        ),
      );
    } catch (e) {
      return Left(
        ServerRequestException(
          code: ExceptionCode.unknown,
          value: e.toString(),
        ),
      );
    }
  }

  Future<Either<GenericException, List<NavigationResponse>>>
  getNavigationUser() async {
    try {
      var response = await _apiProvider.getApi(EndpointPath.navigationUser);
      if (!response.isError) {
        return Right(
          List<NavigationResponse>.from(
            (jsonDecode(response.result?.body ?? '') ?? []).map(
              (x) => NavigationResponse.fromJson(x),
            ),
          ),
        );
      }
      return Left(
        ServerRequestException(
          code: ExceptionCode.serverFailure,
          value: response.msg,
        ),
      );
    } catch (e) {
      return Left(
        ServerRequestException(
          code: ExceptionCode.unknown,
          value: e.toString(),
        ),
      );
    }
  }
}
