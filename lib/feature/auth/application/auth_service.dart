import 'package:dartz/dartz.dart';
import 'package:kiosk_bo/feature/auth/infrastructure/model/response/auth_response.dart';
import 'package:kiosk_bo/feature/auth/infrastructure/repository/auth_repository.dart';
import 'package:kiosk_bo/main.dart';

import '../../../app/common/exception.dart';
import '../../core/infrastructure/model/response/navigation_response.dart';
import '../infrastructure/model/request/auth_request.dart';
import '../infrastructure/model/response/user_response.dart';

class AuthService {
  final _repository = inject.get<AuthRepository>();
  Future<Either<GenericException, AuthResponse>> login({
    required AuthRequest request,
  }) async => await _repository.login(request: request);

  Future<Either<GenericException, UserResponse>> getUserProfile() async {
    return await _repository.getUserProfile();
  }

  Future<Either<GenericException, List<NavigationResponse>>>
  getNavigationUser() async {
    return await _repository.getNavigationUser();
  }
}
