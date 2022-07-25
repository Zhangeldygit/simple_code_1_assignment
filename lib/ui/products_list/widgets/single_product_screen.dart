

import 'package:flutter/material.dart';
import 'package:simple_code_1_assignment/constants/app_colors.dart';
import 'package:simple_code_1_assignment/constants/app_styles.dart';
import 'package:simple_code_1_assignment/dto/product.dart';
import 'package:simple_code_1_assignment/widgets/app_bar.dart';

import '../../../generated/l10n.dart';

class SingleProductScreen extends StatelessWidget {
  const SingleProductScreen(this.product, {Key? key,}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(text: Text(S.of(context).productDetails), isHide: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text(product.title!, style: AppStyles.s14w500,textAlign: TextAlign.center,),
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Image.network(product.image!),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: Text("${product.rating?.rate}", style: AppStyles.s16w500,),
                    ),
                  decoration: BoxDecoration(
                    color: AppColors.circleBackground,
                    borderRadius: BorderRadius.circular(8)
                  ),
                ),
                Text("\$${product.price}", style: AppStyles.s16w700,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Text(product.description!, style: AppStyles.s14w500, textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}
