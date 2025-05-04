import 'package:dartz/dartz.dart';

import '../../../app/common/exception.dart';
import '../../../app/global/model/response/base_pagination_response.dart';
import '../../../main.dart';
import '../infrastructure/model/response/order_response.dart';
import '../infrastructure/repository/marketplace_repository.dart';

class MarketplaceService {
  final _repository = inject.get<MarketplaceRepository>();
  Future<Either<GenericException, BasePaginationResponse<OrderResponse>>>
  getListOrder({
    required bool isAdmin,
    String? query,
    required int page,
    String? tenantId,
  }) async {
    return await _repository.getListOrder(
      isAdmin: isAdmin,
      query: query,
      page: page,
      tenantId: tenantId,
    );
  }
}
