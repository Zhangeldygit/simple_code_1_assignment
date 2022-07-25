import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_code_1_assignment/repo/repo_settings.dart';

import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';
import '../../generated/l10n.dart';
import '../../widgets/app_alert_dialog.dart';
import '../../widgets/app_button_styles.dart';
import '../products_list/products_list_screen.dart';
import 'widgets/login_text_field.dart';
import 'widgets/password_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  String? login;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Expanded(
            child: Image.asset(AppAssets.images.logo),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      LoginTextField(
                        onSaved: (login) {
                          this.login = login;
                        },
                      ),
                      const SizedBox(height: 10.0),
                      PasswordTextField(
                        onSaved: (value) {
                          password = value;
                        },
                      ),
                      const SizedBox(height: 24.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: AppButtonStyles.elevated1,
                              child: Text(S.of(context).signIn),
                              onPressed: () {
                                final isValidated = formKey.currentState?.validate() ?? false;
                                if (isValidated) {
                                  FocusScope.of(context).unfocus();
                                  formKey.currentState?.save();
                                  if (login == 'qwerty' && password == '123456ab') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const ProductsListScreen(),
                                      ),
                                    );
                                    context.read<RepoSettings>().signIn();
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AppAlertDialog(
                                          title: Text(S.of(context).error),
                                          content: Text(
                                            S.of(context).wrongLoginOrPassword,
                                          ),
                                        );
                                      },
                                    );
                                  }
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
