import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc/core/constants/app_contstants.dart';
import 'package:provider_arc/core/viewmodels/views/login_view_model.dart';
import 'package:provider_arc/ui/shared/app_colors.dart';
import 'package:provider_arc/ui/views/base_widget.dart';
import 'package:provider_arc/ui/widgets/login_header.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      model: LoginViewModel(authenticationService: Provider.of(context)),
      child: LoginHeader(
        controller: _controller,
        validationMessage: '',
      ),
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            child ?? Container(),
            model.busy
                ? const CircularProgressIndicator()
                : TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.white),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      var loginSuccess = await model.login(_controller.text);
                      if (loginSuccess) {
                        Navigator.pushNamed(context, RoutePaths.home);
                      }
                    },
                  )
          ],
        ),
      ),
    );
  }
}
