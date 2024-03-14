import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key? key,
    required this.formKey,
    required this.setMail,
    required this.setUser,
    required this.setPassword,
    required this.setAge,
    required this.setGender,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final void Function(String email) setMail;
  final void Function(String username) setUser;
  final void Function(String password) setPassword;
  final void Function(int age) setAge;
  final void Function(String gender) setGender;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  var _userEmail = "";
  var _userName = "";
  var _userPassword = "";
  var _userAge = 0;
  var _userGender = ""; 

  @override
  Widget build(BuildContext context) {
    var formKey = widget.formKey;
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
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    key: const ValueKey('email'),
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    enableSuggestions: false,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains('@')) {
                        return 'Por favor ingrese un mail válido';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Correo electrónico',
                    ),
                    onSaved: (value) {
                      _userEmail = value!;
                      widget.setMail(_userEmail);
                    },
                  ),
                  TextFormField(
                    key: const ValueKey('username'),
                    autocorrect: true,
                    textCapitalization: TextCapitalization.words,
                    enableSuggestions: false,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 4) {
                        return 'El nombre de usuario debe tener al menos 4 caracteres';
                      }
                      return null;
                    },
                    decoration:
                        const InputDecoration(labelText: 'Nombre de usuario'),
                    onSaved: (value) {
                      _userName = value!;
                      widget.setUser(_userName);
                    },
                  ),
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
                    onSaved: (value) {
                      _userPassword = value!;
                      widget.setPassword(_userPassword);
                    },
                  ),
                  TextFormField(
                    key: const ValueKey('age'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    autocorrect: false,
                    enableSuggestions: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese su edad';
                      }
                      int? age = int.tryParse(value);
                      if (age == null || age <= 0) {
                        return 'La edad debe ser un número positivo';
                      } else if (age < 18 || age > 120) {
                        return 'La aplicación es para mayores de 18 años';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: 'Edad'),
                    onSaved: (value) {
                      _userAge = int.parse(value!);
                      widget.setAge(_userAge);
                    },
                  ),
                  DropdownButtonFormField(
                    //value: _userGender,
                    onChanged: (newValue) {
                      setState(() {
                        _userGender = newValue.toString();
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Género',
                      hintText: 'Selecciona tu género',
                    ),
                    items: ['Masculino', 'Femenino', 'No binario', 'Otro']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, selecciona tu género';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _userGender = value!;
                      widget.setGender(_userGender);
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
