import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:votacion/infraestruture/ViewModel/ListaPersonaViewModel.dart';
import 'package:votacion/ui/Componentes/Colores.dart' as Colores;
import 'package:votacion/ui/Componentes/EditText.dart';

late EditTextT nombret;
late EditTextT apellidot;
late EditTextNumberT telefonot;
late EditTextFecha FechaN;


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
    nombret = new EditTextT();
    apellidot = new EditTextT();
    telefonot = new EditTextNumberT();
    FechaN = new EditTextFecha("dd/MM/YYYY");

    FocusNode focusNodenombret = FocusNode();
    FocusNode focusNodeapellidot = FocusNode();
    FocusNode focusNodetelefonot = FocusNode();
    FocusNode focusNodeFechaN = FocusNode();

    nombret.setLabelhit("Nombre");
    nombret.setFocus(focusNodenombret);
    nombret.setFocusNext(focusNodeapellidot);

    apellidot.setLabelhit("Apellido");
    apellidot.setFocus(focusNodeapellidot);
    apellidot.setFocusNext(focusNodetelefonot);

    telefonot.setLabelhit("Telefono");
    telefonot.setFocus(focusNodetelefonot);
    telefonot.setFocusNext(focusNodeFechaN);

    FechaN.setLabelhit("Fecha de Nacimiento");
    FechaN.setFocus(focusNodeFechaN);
    //FechaN.setText("dd/MM/YYYYY");
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
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: FechaN,
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: AG_Persona(),
          ),
        ],
      ),
    );
  }
}


class AG_Persona extends StatefulWidget {
  const AG_Persona({Key? key}) : super(key: key);

  @override
  _AG_Persona createState() => _AG_Persona();
}
class _AG_Persona extends State<AG_Persona> {
  @override
  Widget build(BuildContext context) {
    bool _darktheme = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    final personViewModel = Provider.of<PersonViewModel>(context);
    return ElevatedButton(
      onPressed: () {
        if(nombret.getText().isEmpty){
          nombret.setError(true, "Digite el nombre");
        }
        if(apellidot.getText().isEmpty){
          apellidot.setError(true, "Digite el apellido");
        }
        if(telefonot.getText().isEmpty){
          telefonot.setError(true, "Digite el telefono");
        }
        if(FechaN.getText()=="dd/MM/YYYY"){
          FechaN.setError(true, "Digite la fecha de nacimiento");
        }
        if((!nombret.getError()) && (!apellidot.getError()) && (!telefonot.getError()) && (!FechaN.getError())){
          personViewModel.addpersona(
            nombret.getText(),
            apellidot.getText(),
            telefonot.getText(),
            formatearFecha(FechaN.getText()),
          );
          nombret.setText("");
          apellidot.setText("");
          telefonot.setText("");
          FechaN.setText("dd/MM/YYYY");
          print("-----------------------------------------Guardado-----------------------------------");
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _darktheme
            ? Colores.coloarPrimarioDark
            : Colores.coloarPrimario, // Color de fondo del botón
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
          side: BorderSide(
            color: _darktheme ? Colores.coloarPrimarioDark : Colores.coloarPrimario,
          ), // Borde del mismo color que el fondo
        ),
      ),
      child: const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 16.0),
        child: const Text(
          'Agregar Persona',
          style: const TextStyle(
            fontSize: 16.0, // Tamaño de la fuente
            fontWeight: FontWeight.bold, // Negrita
            color: Colors.white, // Color del texto
          ),
        ),
      ),
    );
  }
  String formatearFecha(String fecha) {
    List<String> partes = fecha.split('/');
    String dia = partes[0];
    String mes = partes[1];
    String anio = partes[2];
    return '$anio-$mes-$dia';
  }
}