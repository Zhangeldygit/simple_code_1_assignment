
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';
import '../../../dto/product.dart';
import '../../../generated/l10n.dart';
import '../../../widgets/circle_icon.dart';

class PersonListTile extends StatelessWidget {
  const PersonListTile(this.product, {Key? key}) : super(key: key);

  final Product product;

  Color _statusColor(String? status) {
    if (status == 'Dead') return Colors.red;
    if (status == 'Alive') return const Color(0xff00c48c);
    return Colors.grey;
  }

  String _statusLabel(String? status) {
    if (status == 'Dead') return S.current.dead;
    if (status == 'Alive') return S.current.alive;
    return S.current.noData;
  }

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 3,
      color: AppColors.cardBackground,
      child: ListTile(
        leading: CircleIcon(
          "${product.id}",
          margin: const EdgeInsets.only(right: 20.0),
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
