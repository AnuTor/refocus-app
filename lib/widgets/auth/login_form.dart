import 'package:flutter/material.dart';

import '../../screens/intro_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
    required this.submitFn,
    this.isLoading = false,
  }) : super(key: key);

  final bool isLoading;
  final void Function(
    String email,
    String password,
    BuildContext ctx,
  ) submitFn;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = false;
  var _userEmail = '';
  var _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      widget.submitFn(
        _userEmail.trim(),
        _userPassword.trim(),
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (_isLogin)
                    TextFormField(
                      key: const ValueKey('email'),
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                      enableSuggestions: false,
                      validator: (value) {
                        if (value == null || value.isEmpty || !value.contains('@')) {
                          return 'Por favor ingrese un mail válido';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Correo electrónico',
                      ),
                      onSaved: (value) {_userEmail = value!;},
                    ),
                  if (_isLogin)
                    TextFormField(
                      key: const ValueKey('password'),
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length < 6) {
                          return 'La contraseña debe tener al menos 6 caracteres';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(labelText: 'Contraseña'),
                      obscureText: true,
                      onSaved: (value) {_userPassword = value!;},
                    ),
                  const SizedBox(height: 20),
                  if (widget.isLoading) const CircularProgressIndicator(),
                  if (!widget.isLoading)
                    ElevatedButton(
                      onPressed: _isLogin
                        ? _trySubmit
                        : () => {
                          Navigator.of(context).pushNamed(IntroScreen.routeName)
                        },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      child: Text(_isLogin ? 'Iniciar sesión' : 'Crear cuenta'),
                    ),
                    const SizedBox(height: 2),
                  if (!widget.isLoading)
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Theme.of(context).primaryColor,
                        textStyle: const TextStyle(fontSize: 19),
                      ),
                      child: Text(_isLogin
                          ? '¿No tienes una cuenta? Registrate'
                          : 'Ya estás registrado? Ingresá'),
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}