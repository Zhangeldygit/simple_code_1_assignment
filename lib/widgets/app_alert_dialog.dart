import 'package:flutter/material.dart';

import '../constants/app_styles.dart';
import '../generated/l10n.dart';
import 'app_button_styles.dart';

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({
    Key? key,
    this.title,
    this.content,
  }) : super(key: key);
  final Widget? title;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      title: title,
      content: content == null
          ? null
          : SizedBox(
              width: double.maxFinite,
              child: content,
            ),
      contentTextStyle: AppStyles.s14w400,
      actionsPadding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 16.0,
      ),
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: AppButtonStyles.outlined1,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(S.of(context).ok),
              ),
            ),
          ],
        )
      ],
    );
  }
}
