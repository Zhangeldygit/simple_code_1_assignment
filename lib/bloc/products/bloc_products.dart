
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dto/product.dart';
import '../../repo/repo_products.dart';
part 'events.dart';
part 'states.dart';

class BlocProducts extends Bloc<EventBlocProducts, StateBlocProducts> {
  BlocProducts({
    required this.repo,
  }) : super(StateProductsInitial()) {
     List<Product>? filteredData = [];
     List<Product>? filteredCategory = [];
     List<Product>? filteredRating = [];
    on<EventFetchProducts>(
      (event, emit) async {
        emit(StateProductsLoading());
         final result = await repo.productsList(event.sort);
         filteredData = result.productsList;
         filteredCategory?.addAll(filteredData!);
         filteredRating?.addAll(filteredData!);
        if (result.errorMessage != null) {
          emit(
            StateProductsError(result.errorMessage!),
          );
          return;
        }
        emit(
          StateProductsData(data: filteredData),
        );
      },
    );
    on<EventCategoryFilter>(
      (event, emit) async {
        filteredCategory = filteredData?.where((element) => element.category == event.filterCategory).toList();

        emit(StateProductsData(filtered: event.filterCategory == 'Category' ? filteredData : filteredCategory));
      }
    );
    on<EventRatingFilter>(
      (event, emit) async {
        filteredRating = filteredCategory?.where((element) => element.rating?.rate?.floor().toString() == event.filterRating).toList();
        emit(StateProductsData(filtered: event.filterRating == 'all' ? filteredData : filteredRating));
      }
    );
  }

  final RepoProducts repo;
}
