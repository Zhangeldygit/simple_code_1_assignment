part of 'bloc_products.dart';

abstract class EventBlocProducts {}

class EventFetchProducts extends EventBlocProducts {
  EventFetchProducts(this.sort);

  final String sort;
}

class EventCategoryFilter extends EventBlocProducts {
  EventCategoryFilter(this.filterCategory);
  final String filterCategory;
}

class EventRatingFilter extends EventBlocProducts {
  EventRatingFilter(this.filterRating);
  final String filterRating;
}
