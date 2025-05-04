import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../../app/common/exception.dart';
import '../../../../app/global/model/response/base_pagination_response.dart';
import '../../../../app/network/api_provider.dart';
import '../../../../main.dart';
import '../../../../shared/constant/endpoint_path.dart';
import '../model/response/order_response.dart';

class MarketplaceRemoteDataSource {
  final _apiProvider = inject.get<ApiProvider>();

  Future<Either<GenericException, BasePaginationResponse<OrderResponse>>>
  getListOrder({
    required bool isAdmin,
    String? query,
    required int page,
    String? tenantId,
  }) async {
    try {
      var response = await _apiProvider.getApi(
        EndpointPath.order,
        query: {
          'isAdmin': isAdmin,
          'query': query,
          'page': page,
          'tenantId': tenantId,
        },
      );
      if (!response.isError) {
        return Right(
          BasePaginationResponse<OrderResponse>.fromMap(
            jsonDecode(response.result?.body ?? ''),
            (map) => OrderResponse.fromMap(map),
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
