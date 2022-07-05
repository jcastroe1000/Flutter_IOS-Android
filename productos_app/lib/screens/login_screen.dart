import 'package:flutter/material.dart';
import 'package:productos_app/providers/login_form_provider.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/ui/input_decoration.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            CardContainer(
              child: Column(children: [
                const SizedBox(height: 10),
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(height: 30),
                ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(),
                  child: _LoginForm(),
                ),
              ]),
            ),
            SizedBox(
              height: 50,
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'registrar'),
              style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
                  shape: MaterialStateProperty.all(StadiumBorder())),
              child: Text(
                'Crear cuenta nueva',
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: loginForm.formKey,
          child: Column(
            children: [
              TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInpuDecoration(
                      hintText: 'mi_correo@gmail.com',
                      labelText: 'Email',
                      prefixIcon: Icons.alternate_email_outlined),
                  onChanged: (value) => loginForm.email = value,
                  validator: (value) {
                    String pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = new RegExp(pattern);
                    return regExp.hasMatch(value ?? '')
                        ? null
                        : 'correo ingresado no es valido';
                  }),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                  autocorrect: false,
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInpuDecoration(
                      hintText: '*****',
                      labelText: 'Password',
                      prefixIcon: Icons.lock_clock_outlined),
                  onChanged: (value) => loginForm.password = value,
                  validator: (value) {
                    return (value != null && value.length >= 6)
                        ? null
                        : 'la contraseña deber ser mayor a 6 caracteres';
                  }),
              SizedBox(height: 30),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Colors.deepPurple,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text(
                      loginForm.isLoading ? 'Espere' : 'Ingresar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: loginForm.isLoading
                      ? null
                      : () async {
                          // FocusScope.of(context).unfocus();
                          // if (!loginForm.isValidForm()) return;
                          // loginForm.isLoading = true;
                          // await Future.delayed(Duration(seconds: 5));
                          // loginForm.isLoading = false;
                          // Navigator.pushReplacementNamed(context, 'home');
                          FocusScope.of(context).unfocus();
                          final authservice =
                              Provider.of<AuthService>(context, listen: false);
                          if (!loginForm.isValidForm()) return;
                          loginForm.isLoading = true;
                          final String? errorMessage = await authservice.login(
                              loginForm.email, loginForm.password);
                          if (errorMessage == null) {
                            Navigator.pushReplacementNamed(context, 'home');
                          } else {
                            //print(errorMessage);
                            ServiceNotifications.showSnackbar(errorMessage);
                            loginForm.isLoading = false;
                          }
                        })
            ],
          )),
    );
  }
}
