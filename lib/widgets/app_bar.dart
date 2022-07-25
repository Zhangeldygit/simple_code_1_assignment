import 'package:flutter/material.dart';
import 'package:simple_code_1_assignment/constants/app_colors.dart';
import 'package:simple_code_1_assignment/constants/app_styles.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  const MainAppBar({Key? key, required this.text, required this.isHide}) : super(key: key);

  final Text? text;
  final bool? isHide;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      centerTitle: true,
      title: text,
      titleTextStyle: AppStyles.s20w500,
      leading: isHide == false ? InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_ios, color: AppColors.mainText),
      ) : const Offstage(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
