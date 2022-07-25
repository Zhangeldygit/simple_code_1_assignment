part of 'bloc_products.dart';

abstract class StateBlocProducts {}

class StateProductsInitial extends StateBlocProducts {}

class StateProductsLoading extends StateBlocProducts {}

class StateProductsData extends StateBlocProducts {
  StateProductsData({
      this.data,
      this.filtered,
  });

  @override
  bool operator ==(Object other) {
    if(identical(this, other)) return true;

    return other is StateProductsData &&
      listEquals(other.data, data) &&
      listEquals(other.filtered, filtered);
  }

  @override
  int get hashCode => data.hashCode ^ filtered.hashCode;



  final List<Product>? data;
  final List<Product>? filtered;
}

class StateProductsError extends StateBlocProducts {
  StateProductsError(this.error);

  final String error;
}
