import 'package:dartz/dartz.dart';
import 'package:kiosk_bo/app/common/exception.dart';
import 'package:kiosk_bo/feature/core/domain/interface/marketplace_repository_base.dart';
import 'package:kiosk_bo/feature/core/infrastructure/data_source/marketplace_remote_data_source.dart';
import 'package:kiosk_bo/feature/core/infrastructure/model/response/order_response.dart';

import '../../../../app/global/model/response/base_pagination_response.dart';

class MarketplaceRepository extends MarketplaceRepositoryBase {
  @override
  Future<Either<GenericException, BasePaginationResponse<OrderResponse>>>
  getListOrder({
    required bool isAdmin,
    String? query,
    required int page,
    String? tenantId,
  }) async {
    return await MarketplaceRemoteDataSource().getListOrder(
      isAdmin: isAdmin,
      query: query,
      page: page,
      tenantId: tenantId,
    );
  }
}
