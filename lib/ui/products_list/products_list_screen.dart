import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_code_1_assignment/ui/products_list/widgets/single_product_screen.dart';
import 'package:simple_code_1_assignment/widgets/app_bar.dart';

import '../../bloc/products/bloc_products.dart';
import '../../dto/product.dart';
import '../../generated/l10n.dart';
import '../../widgets/app_nav_bar.dart';
import 'widgets/products_list_tile.dart';

part 'widgets/_list_view.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({Key? key}) : super(key: key);


  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {

   String firstDropDownValue = 'asc';
   String secondDropDownValue = 'Category';
   String thirdDropDownValue = 'all';

   final sortItems = [
    'asc',
    'desc',
  ];
   final categoryItems = [
    'Category',
    'electronics',
    'jewelery',
    "men's clothing",
    "women's clothing",
  ];
   final ratingItems = [
    'all',
    '2',
    '3',
    '4',
    '5',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: MainAppBar(text: Text(S.of(context).products), isHide: true),
        bottomNavigationBar: const AppNavBar(current: 0),
        body: Column(
          children: [
            DropdownButton(
              value: firstDropDownValue,
                items: sortItems.map((String sortItem) {
                  return DropdownMenuItem(
                    value: sortItem,
                    child: Text(sortItem),
                  );
                }).toList(),
                onChanged: (String? value){
                  setState((){
                    firstDropDownValue = value!;
                  });
                  context.read<BlocProducts>().add(EventFetchProducts(value!));
                }
            ),
            const Divider(thickness: 2,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Category:'),
                      DropdownButton(
                          value: secondDropDownValue,
                          items: categoryItems.map((String category) {
                            return DropdownMenuItem(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          onChanged: (String? value){
                            setState((){
                              secondDropDownValue = value!;
                            });
                            context.read<BlocProducts>().add(EventCategoryFilter(value!));
                          }
                      ),
                    ],
                  ),
                  DropdownButton(
                      value: thirdDropDownValue,
                      items: ratingItems.map((String rating) {
                        return DropdownMenuItem(
                          value: rating,
                          child: Text(rating),
                        );
                      }).toList(),
                      onChanged: (String? value){
                        setState((){
                          thirdDropDownValue = value!;
                        });
                        context.read<BlocProducts>().add(EventRatingFilter(value!));
                      }
                  ),
                ],
              ),
            ),


            Expanded(
              child: BlocBuilder<BlocProducts, StateBlocProducts>(
                builder: (context, state) {
                  if (state is StateProductsLoading) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                      ],
                    );
                  }
                  if (state is StateProductsError) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(state.error),
                        ),
                      ],
                    );
                  }
                  if (state is StateProductsData) {
                    if(state.filtered != null && state.filtered!.isNotEmpty){
                      return _ListView(productsList: state.filtered!);
                    }
                    if(state.data != null && state.data!.isNotEmpty){
                      return _ListView(productsList: state.data!);
                    }  else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(S.of(context).personsListIsEmpty),
                          ),
                        ],
                      );
                    }
                  }
                  //если состояние любое другое
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
