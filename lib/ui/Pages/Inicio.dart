import 'package:flutter/material.dart';

import '../../main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Aquí puedes agregar cualquier lógica necesaria antes de navegar a la siguiente pantalla.
    // Por ejemplo, podrías cargar datos necesarios o realizar autenticación.
    // Luego, puedes navegar a la siguiente pantalla después de un tiempo determinado.
    Future.delayed(Duration(seconds: 3), () {
      // Navegar a la siguiente pantalla.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage(title: 'Inicio de Sesion')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Puedes personalizar la apariencia del SplashScreen según tus necesidades.
      body: Center(
        child: Text("SpashScreen"), // Muestra la imagen SplashScreen.
      ),
    );
  }
}