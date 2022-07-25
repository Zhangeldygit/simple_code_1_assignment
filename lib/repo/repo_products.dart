
import 'dart:convert';
import 'dart:math';


import 'package:http/http.dart';

import '../dto/product.dart';
import '../generated/l10n.dart';
import 'api.dart';

class RepoProducts {
  RepoProducts({required this.api});

  final Api api;

  Future<ResultRepoProducts> productsList(String sort) async {
    try {
      final result = await api.dio.get(
        '/products/',
        queryParameters: {
          "sort": sort,
        },
      );

      final List personsListJson = result.data ?? [];
      final personsList = personsListJson
          .map(
            (item) => Product.fromJson(item),
      )
          .toList();
      return ResultRepoProducts(productsList: personsList);
    } catch (error) {
      print('🏐 Error : $error');
      return ResultRepoProducts(
        errorMessage: S.current.somethingWentWrong,
      );
    }
  }
}

class ResultRepoProducts {
  ResultRepoProducts({
    this.errorMessage,
    this.productsList,
  });

  final String? errorMessage;
  final List<Product>? productsList;
}
