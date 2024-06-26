import 'package:blog/auth/auth_bloc.dart';
import 'package:blog/config/consts/submission_status.dart';
import 'package:blog/config/routes/app_routes.dart';
import 'package:blog/config/themes/app_colors.dart';
import 'package:blog/http/auth/auth_user.http.dart';
import 'package:blog/model/user.dart';
import 'package:blog/utils/navigation_util.dart';
import 'package:blog/widgets/password_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

import '../../widgets/correo_input.dart';

final _myFormKey = GlobalKey<FormState>();

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.3,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Form(
                      key: _myFormKey,
                      child: Column(children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 20.0),
                          child: Text('Bienvenido',
                              style: TextStyle(
                                  fontSize: 32.0,
                                  color: LightColors.darkBlue,
                                  fontWeight: FontWeight.bold)),
                        ),
                        CorreoInput.withoutValidation(
                          onChanged: (String? p0) =>
                              (bloc.add(CorreoChanged(correo: p0))),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: PasswordInput(
                              onChanged: (p0) =>
                                  (bloc.add(PasswordChanged(password: p0))),
                            )),
                        const _LoginButton(),
                        const _SignInText(),
                      ])),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SignInText extends StatelessWidget {
  const _SignInText();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(
          height: 50,
          child: Center(
            child: Text('Si no tienes una cuenta puedes ',
                style: TextStyle(fontSize: 16, color: LightColors.text)),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () => Navigation.pushNamed(routeName: AppRoutes.signIn),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.0),
            child: SizedBox(
              height: 50,
              child: Center(
                child: Text('crear una',
                    style: TextStyle(fontSize: 16, color: LightColors.primary)),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (previous, current) {
        return previous.formStatus != current.formStatus;
      },
      listener: (_, state) async {
        if (state.formStatus is Success) {
          try {
            await Navigation.pushNamedAndRemoveUntil(routeName: AppRoutes.home);
            return;
          } on Exception catch (e) {
            print(e);
          }
        }
        if (state.formStatus is Failed) {
          showToast('Usuario o contraseña incorrectos');
          return;
        }
      },
      builder: (_, state) {
        if (state.formStatus is Submitting) {
          return const SizedBox(
              height: 50, width: 50, child: CircularProgressIndicator());
        }
        return SizedBox(
          height: 50,
          child: ElevatedButton(
              onPressed: () {
                if (!_myFormKey.currentState!.validate()) {
                  return;
                }
                final event = OnLogIn<Usuario>(
                  authRepository: UserAuthHttp(),
                );
                bloc.add(event);
              },
              child: const Text('Ingresar')),
        );
      },
    );
  }
}
