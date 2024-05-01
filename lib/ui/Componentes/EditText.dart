import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:votacion/ui/Componentes/Colores.dart' as Colores;


class EditTextT extends StatefulWidget {
  EditTextT({Key? key}) : super(key: key);
  void setText(String text){
    dato.setText(text);
  }
  void setError(bool veri,String error){
    dato.setError(veri,error);
  }
  bool getError(){
    return dato.getError();
  }
  String getText(){
    return dato.getText();
  }
  void setLabelhit(String label){
    dato.setLabelhit(label);
  }
  void setFocus(FocusNode _focus){
    dato.setFocus(_focus);
  }
  void setFocusNext(FocusNode _focus){
    dato.setFocusNext(_focus);
  }
  _TextUsuarioState dato=new _TextUsuarioState();
  @override
  _TextUsuarioState createState() => dato;
}

class _TextUsuarioState extends State<EditTextT> {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  FocusNode _focusNodeSet = FocusNode();
  var _isError=false;
  var _ErrorText="";
  var laberhit="";
  void setText(String dato){
    setState(() {
      _controller.text=dato;
    });
  }
  String getText(){
    return _controller.text.toString();
  }
  void setError(bool dato,String error){
    setState(() {
      _isError=dato;
      _ErrorText=error;
    });
  }
  bool getError(){
    return _isError;
  }
  void setLabelhit(String label){
    laberhit=label;
  }
  void setFocus(FocusNode _focus){
    _focusNode=_focus;
  }
  void setFocusNext(FocusNode _focus){
    _focusNodeSet=_focus;
  }
  @override
  void initState() {
    super.initState();
    // Agregar un listener al controlador para monitorear los cambios en el texto.
    _controller.addListener(_onTextChanged);
  }
  @override
  void dispose() {
    // Limpia el controlador cuando el widget se destruye.
    _controller.dispose();
    super.dispose();
  }
  // Función para manejar los cambios en el texto.
  void _onTextChanged() {
    // Verifica si la longitud del texto es mayor que 12.

    if(getText()=="1"){

    }else{
      setError(false, "");
    }
    //setError(false, "");
  }

  @override
  Widget build(BuildContext context) {

    bool _darktheme = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return SizedBox(
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        onChanged: (text) {
          setState(() {
          }); // Para redibujar el widget cuando cambia el texto
        },
        onSubmitted: (value) {
          FocusScope.of(context).requestFocus(_focusNodeSet);
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: _darktheme ? Colores.coloarPrimarioDark : Colores.coloarPrimario,
            ), // Define el color blanco cuando está enfocado
          ),
          labelText: laberhit,
          errorText: _isError ? _ErrorText : null,
          suffixIcon: _controller.text.isEmpty
              ? null
              : IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              setState(() {
                _controller.clear();
              });
            },
          ),
        ),
      ),
    );
  }
}

class EditTextPasswd extends StatefulWidget {
  EditTextPasswd({Key? key}) : super(key: key);
  _TextPasswordState constru=new _TextPasswordState();
  void setText(String dato){
    constru.setText(dato);
  }
  void setError(bool veri,String error){
    constru.setError(veri,error);
  }
  String getText(){
    return constru.getText();
  }
  bool getError(){
    return constru.getError();
  }
  void setLabelhit(String label){
    constru.setLabelhit(label);
  }
  void setFocus(FocusNode _focus){
    constru.setFocus(_focus);
  }
  void setFocusNext(FocusNode _focus){
    constru.setFocusNext(_focus);
  }
  @override
  _TextPasswordState createState() => constru;
}

class _TextPasswordState extends State<EditTextPasswd> {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  FocusNode _focusNodeSet = FocusNode();
  bool _obscureText = true;
  var _isError=false;
  var _ErrorText="";
  var laberhit="";
  void setText(String dato){
    setState(() {
      _controller.text=dato;
    });
  }
  String getText(){
    return _controller.text.toString();
  }
  void setError(bool dato,String error){
    setState(() {
      _isError=dato;
      _ErrorText=error;
    });
  }
  bool getError(){
    return _isError;
  }
  void setLabelhit(String label){
    laberhit=label;
  }
  void setFocus(FocusNode _focus){
    _focusNode=_focus;
  }
  void setFocusNext(FocusNode _focus){
    _focusNodeSet=_focus;
  }
  @override
  void initState() {
    super.initState();
    // Agregar un listener al controlador para monitorear los cambios en el texto.
    _controller.addListener(_onTextChanged);
  }
  @override
  void dispose() {
    // Limpia el controlador cuando el widget se destruye.
    _controller.dispose();
    super.dispose();
  }
  // Función para manejar los cambios en el texto.
  void _onTextChanged() {
    // Verifica si la longitud del texto es mayor que 12.
    setError(false, "");
    if (_controller.text.length > 12) {
      setError(true, "Error la contraseña no puede superar los 12 caracteres");
    }else{
      setError(false, "");
    }
  }
  @override
  Widget build(BuildContext context) {
    bool _darktheme = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return SizedBox(
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        obscureText: _obscureText,
        onChanged: (text){
          setState(() {

          });
        },
        onSubmitted: (value) {
          FocusScope.of(context).requestFocus(_focusNodeSet);
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: _darktheme ? Colores.coloarPrimarioDark : Colores.coloarPrimario,
            ), // Define el color blanco cuando está enfocado
          ),
          labelText: laberhit,
          errorText: _isError ? _ErrorText : null,
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
      ),
    );
  }
}



class EditTextNumberT extends StatefulWidget {
  EditTextNumberT({Key? key}) : super(key: key);
  void setText(String text){
    dato.setText(text);
  }
  void setError(bool veri,String error){
    dato.setError(veri,error);
  }
  bool getError(){
    return dato.getError();
  }
  String getText(){
    return dato.getText();
  }
  void setLabelhit(String label){
    dato.setLabelhit(label);
  }
  void setFocus(FocusNode _focus){
    dato.setFocus(_focus);
  }
  void setFocusNext(FocusNode _focus){
    dato.setFocusNext(_focus);
  }
  _EditTextNumberT dato=new _EditTextNumberT();
  @override
  _EditTextNumberT createState() => dato;
}

class _EditTextNumberT extends State<EditTextNumberT> {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  FocusNode _focusNodeSet = FocusNode();
  var _isError=false;
  var _ErrorText="";
  var laberhit="";
  void setText(String dato){
    setState(() {
      _controller.text=dato;
    });
  }
  String getText(){
    return _controller.text.toString();
  }
  void setError(bool dato,String error){
    setState(() {
      _isError=dato;
      _ErrorText=error;
    });
  }
  bool getError(){
    return _isError;
  }
  void setLabelhit(String label){
    laberhit=label;
  }
  void setFocus(FocusNode _focus){
    _focusNode=_focus;
  }
  void setFocusNext(FocusNode _focus){
    _focusNodeSet=_focus;
  }
  @override
  void initState() {
    super.initState();
    // Agregar un listener al controlador para monitorear los cambios en el texto.
    _controller.addListener(_onTextChanged);
  }
  @override
  void dispose() {
    // Limpia el controlador cuando el widget se destruye.
    _controller.dispose();
    super.dispose();
  }
  // Función para manejar los cambios en el texto.
  void _onTextChanged() {
    // Verifica si la longitud del texto es mayor que 12.

    if(getText().length>10){
      setError(true, "Error no se puede superar los 10 caracteres");
    }else{
      setError(false, "");
    }
    //setError(false, "");
  }

  @override
  Widget build(BuildContext context) {

    bool _darktheme = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return SizedBox(
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
        onChanged: (text) {
          setState(() {
          }); // Para redibujar el widget cuando cambia el texto
        },
        onSubmitted: (value) {
          FocusScope.of(context).requestFocus(_focusNodeSet);
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: _darktheme ? Colores.coloarPrimarioDark : Colores.coloarPrimario,
            ), // Define el color blanco cuando está enfocado
          ),
          labelText: laberhit,
          errorText: _isError ? _ErrorText : null,
          suffixIcon: _controller.text.isEmpty
              ? null
              : IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              setState(() {
                _controller.clear();
              });
            },
          ),
        ),
      ),
    );
  }
}



class EditTextFecha extends StatefulWidget {
  String textoFormato;
  EditTextFecha(this.textoFormato,{Key? key}) : super(key: key);

  void setText(String text){
    dato.setText(text);
  }
  void setError(bool veri,String error){
    dato.setError(veri,error);
  }
  bool getError(){
    return dato.getError();
  }
  String getText(){
    return dato.getText();
  }
  void setLabelhit(String label){
    dato.setLabelhit(label);
  }
  void setFocus(FocusNode _focus){
    dato.setFocus(_focus);
  }
  void setFocusNext(FocusNode _focus){
    dato.setFocusNext(_focus);
  }
  _EditTextFecha dato=new _EditTextFecha();
  @override
  _EditTextFecha createState() => dato;
}

class _EditTextFecha extends State<EditTextFecha> {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  FocusNode _focusNodeSet = FocusNode();
  var _isError = false;
  var _ErrorText = "";
  var laberhit = "";
  String textofecha="";
  void setText(String dato) {
    setState(() {
      _controller.text = dato;
    });
  }

  String getText() {
    return _controller.text.toString();
  }

  void setError(bool dato, String error) {
    setState(() {
      _isError = dato;
      _ErrorText = error;
    });
  }
  void setFocus(FocusNode _focus){
    _focusNode=_focus;
  }
  void setFocusNext(FocusNode _focus){
    _focusNodeSet=_focus;
  }

  bool getError() {
    return _isError;
  }

  void setLabelhit(String label) {
    laberhit = label;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textofecha=widget.textoFormato;
    _controller.text=textofecha;
  }

  @override
  Widget build(BuildContext context) {
    bool _darktheme = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        onChanged: (text) {
          setState(() {
            _controller.text=textofecha;
          }); // Para redibujar el widget cuando cambia el texto
        },
        onSubmitted: (value) {
          FocusScope.of(context).requestFocus(_focusNodeSet);
        },
         // Deshabilita la edición del TextField
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: _darktheme ? Colores.coloarPrimarioDark : Colores.coloarPrimario,
            ), // Define el color blanco cuando está enfocado
          ),
          labelText: laberhit,
          errorText: _isError ? _ErrorText : null,
          suffixIcon: IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              showDatePickerDialog(context);
            },
          ),
        ),
      ),
    );
  }
  Future<void> showDatePickerDialog(BuildContext context) async {
    bool _darktheme = Theme.of(context).brightness == Brightness.dark;
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900), // Fecha mínima
      lastDate: DateTime.now(), // Fecha máxima, hoy
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            useMaterial3: true,
            brightness: _darktheme ? Brightness.dark : Brightness.dark,
            scaffoldBackgroundColor: _darktheme ? Color(0xFF000000) : Color(0xFFFFFFFF),
            colorSchemeSeed:  _darktheme ?  Colores.blueThemeDark:  Colores.blueTheme,
            backgroundColor: _darktheme ? Color(0xFF000000) : Color(0xFFFFFFFF),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      // Actualiza el texto con la fecha seleccionada
      setState(() {
        textofecha = "${selectedDate.day.toString().padLeft(2, '0')}/${selectedDate.month.toString().padLeft(2, '0')}/${selectedDate.year}";
        _controller.text = textofecha;
      });
    }
  }

}
