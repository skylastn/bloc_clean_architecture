import 'package:dartz/dartz.dart';

import '../../../../app/common/exception.dart';
import '../../../../app/global/model/response/base_pagination_response.dart';
import '../../infrastructure/model/response/order_response.dart';

abstract class MarketplaceRepositoryBase {
  Future<Either<GenericException, BasePaginationResponse<OrderResponse>>>
  getListOrder({
    required bool isAdmin,
    String? query,
    required int page,
    String? tenantId,
  });
}
