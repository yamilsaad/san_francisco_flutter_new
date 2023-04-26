import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../UI/input_decoration.dart';
import '../providers/login_form_provider.dart';
import '../services/auth_service.dart';
import '../widgets/widget.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: AuthBackground(
        //el SingleChildScrollView me va a permitir que haga scroll si los hijos del wiget supera en cantidad el tamaño del contenedor!
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 250),
              CardContainer(
                  child: Column(
                children: [
                  SizedBox(height: 10),
                  Text('Bienvenido',
                      style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox(height: 30),
                  ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: _LoginForm(),
                  )
                ],
              )),
              SizedBox(height: 50),
              TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, 'register'),
                style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all(Colors.blue.withOpacity(0.1)),
                    shape: MaterialStateProperty.all(StadiumBorder())),
                child: Text('Crear una nueva cuenta',
                    style: TextStyle(fontSize: 18, color: Colors.black87)),
              ),
              SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
          //Mantener la referencia al Key
          key: loginForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authImputDecoration(
                    hintText: 'sfhogar@google.com',
                    labelText: 'Correo electronico',
                    prefixIcon: Icons.alternate_email_outlined),
                onChanged: (value) => loginForm.email = value,
                /*validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = new RegExp(pattern);
                  return regExp.hasMatch(value ?? '')
                      ? null
                      : '¡Error al ingresar la direccion de correo!';
                },*/
              ),
              SizedBox(height: 30),
              TextFormField(
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authImputDecoration(
                    hintText: '******',
                    labelText: 'Contraseña',
                    prefixIcon: Icons.lock_outline),
                onChanged: (value) => loginForm.password = value,
                /*validator: (value) {
                  return (value != null && value.length >= 6)
                      ? null
                      : '¡La contraseña debe tener 6 caracteres!';
                },*/
              ),
              SizedBox(height: 30),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.blue.shade700,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                    loginForm.isLoading ? 'Espere...' : 'Ingresar',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                //LoginForm llamado en este botón

                /*  onPressed: loginForm.isLoading //loading sin conexión!
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();

                          if (!loginForm.isValidForm()) return;

                          loginForm.isLoading = true;

                          await Future.delayed(Duration(seconds: 2));
                          //TODO: VALIDAR SI LOGIN ES CORRECTO!!!
                          Navigator.pushReplacementNamed(context, 'home');
                        }*/

                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();

                        if (!loginForm.isValidForm()) return;

                        loginForm.isLoading = true;

                        final authService =
                            Provider.of<AuthService>(context, listen: false);
                        final success = await authService.authenticate(
                            loginForm.email, loginForm.password);

                        if (success) {
                          Navigator.pushReplacementNamed(context, 'home');
                        } else {
                          // Mostrar mensaje de error
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Usuario o contraseña incorrectos'),
                          ));
                        }

                        loginForm.isLoading = false;
                      },
              )
            ],
          )),
    );
  }
}
