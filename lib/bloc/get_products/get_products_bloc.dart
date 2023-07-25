// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:vape_market/data/datasources/product_remote_datasource.dart';
import 'package:vape_market/data/models/responses/list_product_response_model.dart';

part 'get_products_event.dart';
part 'get_products_state.dart';

class GetProductsBloc extends Bloc<GetProductsEvent, GetProductsState> {
  final ProductRemoteDatasource datasource;
  GetProductsBloc(
    this.datasource,
  ) : super(GetProductsInitial()) {
    on<DoGetProductsEvent>((event, emit) async {
      emit(GetProductsLoading());

      final result = await datasource.getAllProduct();

      return result.fold(
        (l) => emit(GetProductsError()),
        (r) => emit(
          GetProductsLoaded(data: r),
        ),
      );
    });
  }
}
