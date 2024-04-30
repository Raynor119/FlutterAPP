import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:votacion/ui/Componentes/Colores.dart' as Colores;
import 'package:votacion/ui/Componentes/EditText.dart';

late EditTextT nombret;
late EditTextT apellidot;
late EditTextNumberT telefonot;

class AgregarPersonas extends StatelessWidget {
  const AgregarPersonas({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool _darktheme = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _darktheme ? Colores.coloarPrimarioDark : Colores.coloarPrimario,
        title: Text("Agregar Personas"),
        titleTextStyle: TextStyle(
            color: _darktheme ? Colors.white : Colors.white, fontSize: 22),
        iconTheme: IconThemeData(
          color: _darktheme ? Colors.white : Colors.white, // Cambia el color de la flecha según el tema
        ),
      ),
      body: Page(),
    );
  }
}
class Page extends StatefulWidget {
  Page({Key? key}) : super(key: key);
  @override
  _Page createState() => _Page();
}

class _Page extends State<Page>{
  @override
  void initState() {
    super.initState();
    nombret = EditTextT();
    apellidot = EditTextT();
    telefonot = EditTextNumberT();

    FocusNode focusNodenombret = FocusNode();
    FocusNode focusNodeapellidot = FocusNode();
    FocusNode focusNodetelefonot = FocusNode();

    nombret.setLabelhit("Nombre");
    nombret.setFocus(focusNodenombret);
    nombret.setFocusNext(focusNodeapellidot);

    apellidot.setLabelhit("Apellido");
    apellidot.setFocus(focusNodeapellidot);
    apellidot.setFocusNext(focusNodetelefonot);

    telefonot.setLabelhit("Telefono");
    telefonot.setFocus(focusNodetelefonot);
  }
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: nombret,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: apellidot,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: telefonot,
          ),
        ],
      ),
    );
  }
}