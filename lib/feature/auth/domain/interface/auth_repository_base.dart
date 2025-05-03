import 'package:dartz/dartz.dart';
import '../../../../app/common/exception.dart';
import '../../../core/infrastructure/model/response/navigation_response.dart';
import '../../infrastructure/model/request/auth_request.dart';
import '../../infrastructure/model/response/auth_response.dart';
import '../../infrastructure/model/response/user_response.dart';

abstract class AuthRepositoryBase {
  Future<Either<GenericException, AuthResponse>> login({
    required AuthRequest request,
  });
  // Future<Either<GenericException, AuthResponse>> register(AuthRequest request);
  // Future<Either<GenericException, AuthResponse>> forgotPassword(AuthRequest request);

  Future<Either<GenericException, UserResponse>> getUserProfile();
  Future<Either<GenericException, List<NavigationResponse>>>
  getNavigationUser();
}
