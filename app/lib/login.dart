import 'package:flutter/material.dart';
import 'welcome.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      if (_emailController.text == 'admin' &&
          _passwordController.text == 'admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WelcomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Usuario o contraseña incorrectos')),
        );
      }
    }
  }

  void _forgotPassword() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Función recuperar contraseña')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),

                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Usuario',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Campo obligatorio' : null,
                ),
                SizedBox(height: 16),

                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) return 'Campo obligatorio';
                    if (value.length < 4) return 'Mínimo 4 caracteres';
                    return null;
                  },
                ),
                SizedBox(height: 10),

                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value!;
                        });
                      },
                    ),
                    Text("Recordar mi contraseña"),
                  ],
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _forgotPassword,
                    child: Text("¿Olvidaste tu contraseña?"),
                  ),
                ),

                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: _login,
                  child: Text('Entrar'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        vertical: 15, horizontal: 40),
                  ),
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("¿No tienes cuenta? "),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  RegisterScreen()),
                        );
                      },
                      child: Text("Registrarse"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// ================= REGISTRO =================

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() =>
      _RegisterScreenState();
}

class _RegisterScreenState
    extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _lastNameController =
      TextEditingController();
  final _usernameController =
      TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController =
      TextEditingController();
  final _passwordController =
      TextEditingController();
  final _confirmPasswordController =
      TextEditingController();

  DateTime? _birthDate;
  String? _gender;
  bool _acceptTerms = false;

  void _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _birthDate = picked;
      });
    }
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      if (!_acceptTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text("Debes aceptar los términos")),
        );
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registro exitoso")),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("Registro Completo")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Nombre",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty
                        ? "Campo obligatorio"
                        : null,
              ),
              SizedBox(height: 15),

              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: "Apellido",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty
                        ? "Campo obligatorio"
                        : null,
              ),
              SizedBox(height: 15),

              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "Usuario",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.length < 4
                        ? "Mínimo 4 caracteres"
                        : null,
              ),
              SizedBox(height: 15),

              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Correo",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    !value!.contains('@')
                        ? "Correo inválido"
                        : null,
              ),
              SizedBox(height: 15),

              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: "Teléfono",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),

              InkWell(
                onTap: _selectDate,
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText:
                        "Fecha de nacimiento",
                    border:
                        OutlineInputBorder(),
                  ),
                  child: Text(
                    _birthDate == null
                        ? "Seleccionar fecha"
                        : "${_birthDate!.day}/${_birthDate!.month}/${_birthDate!.year}",
                  ),
                ),
              ),
              SizedBox(height: 15),

              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Género",
                  border: OutlineInputBorder(),
                ),
                value: _gender,
                items: ["Masculino", "Femenino", "Otro"]
                    .map((g) => DropdownMenuItem(
                          value: g,
                          child: Text(g),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                },
                validator: (value) =>
                    value == null
                        ? "Selecciona una opción"
                        : null,
              ),
              SizedBox(height: 15),

              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: "Dirección",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),

              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "Contraseña",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) =>
                    value!.length < 6
                        ? "Mínimo 6 caracteres"
                        : null,
              ),
              SizedBox(height: 15),

              TextFormField(
                controller:
                    _confirmPasswordController,
                decoration: InputDecoration(
                  labelText:
                      "Confirmar contraseña",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) =>
                    value !=
                            _passwordController.text
                        ? "No coinciden"
                        : null,
              ),
              SizedBox(height: 15),

              Row(
                children: [
                  Checkbox(
                    value: _acceptTerms,
                    onChanged: (value) {
                      setState(() {
                        _acceptTerms = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                        "Acepto términos y condiciones"),
                  ),
                ],
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: _register,
                child: Text("Registrarse"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}