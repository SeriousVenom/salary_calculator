import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:salary_calculator/domain/config/assets.dart';
import 'package:salary_calculator/domain/config/localization.dart';
import 'package:salary_calculator/domain/repositories/auth/abstract_auth_repository.dart';
import 'package:salary_calculator/screens/auth/bloc/auth_bloc.dart';
import 'package:salary_calculator/utils/colors.dart';
import 'package:salary_calculator/utils/ui_conts.dart';
import 'package:salary_calculator/utils/widgets/buttons.dart';
import 'package:salary_calculator/utils/widgets/textfield.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthBloc _bloc = AuthBloc(authRepository: GetIt.I<AbstractAuthRepository>());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: BlocBuilder<AuthBloc, AuthState>(
          bloc: _bloc,
          builder: (context, state) {
            switch (state) {
              case AuthStateLoading():
                return const Center(child: CircularProgressIndicator());
              case AuthStateLoaded():
                return AuthWidget(loginController: loginController, passwordController: passwordController, bloc: _bloc);
              case AuthStateError():
                return AuthWidget(
                  loginController: loginController,
                  passwordController: passwordController,
                  bloc: _bloc,
                  hasError: true,
                );
            }
          },
        ),
      ),
    );
  }
}

class AuthWidget extends StatelessWidget {
  const AuthWidget({
    super.key,
    required this.loginController,
    required this.passwordController,
    required AuthBloc bloc,
    this.hasError = false,
  }) : _bloc = bloc;

  final TextEditingController loginController;
  final TextEditingController passwordController;
  final AuthBloc _bloc;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SvgPicture.asset(AppAssets.logoNordClan),
          UIConst.margin124v,
          MainTextField(
            controller: loginController,
            label: AppLocalization.loginText,
          ),
          UIConst.margin16v,
          MainTextField(
            controller: passwordController,
            label: AppLocalization.passwordText,
            isPassword: true,
          ),
          UIConst.margin16v,
          if (hasError)
            const Text(
              'Ошибка',
              style: TextStyle(color: AppColors.errorColor),
            ),
          UIConst.margin16v,
          MainButton(
            label: AppLocalization.enterButtonText,
            onTap: () => _bloc.add(LoginEvent(login: loginController.text, password: passwordController.text)),
          ),
        ],
      ),
    );
  }
}
