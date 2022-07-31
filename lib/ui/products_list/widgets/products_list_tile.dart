
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';
import '../../../dto/product.dart';
import '../../../generated/l10n.dart';
import '../../../widgets/circle_icon.dart';

class PersonListTile extends StatelessWidget {
  const PersonListTile(this.product, {Key? key}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 3,
      color: AppColors.cardBackground,
      child: ListTile(
        leading: CircleIcon(
          "${product.id}",
          margin:  EdgeInsets.only(right: 20.0.h),
        ),
        title:  Text(
          product.title ?? S.of(context).noData,
          style: AppStyles.s11w400,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${S.of(context).price}: ${product.price}", style: AppStyles.s11w400,),
            Text("${S.of(context).rating}: ${product.rating?.rate}", style: AppStyles.s11w400,),
          ],
        ),
        trailing: InkWell(
          onTap: (){},
          child: const Icon(Icons.arrow_forward_ios, color: AppColors.mainText,),
        ),
      )
    );
  }
}
