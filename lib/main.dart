import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:votacion/infraestruture/ViewModel/ListaPersonaViewModel.dart';
import 'package:votacion/ui/Componentes/EditText.dart';
import 'package:votacion/ui/Componentes/Colores.dart' as Colores;
import 'package:votacion/ui/Pages/Inicio.dart';
import 'package:votacion/ui/Pages/Menu.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {

  if (kIsWeb) {
    // Some web specific code there
  }
  else if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android) {
    // Some android/ios specific code
  }
  else if (defaultTargetPlatform == TargetPlatform.linux || defaultTargetPlatform == TargetPlatform.macOS || defaultTargetPlatform == TargetPlatform.windows || defaultTargetPlatform == TargetPlatform.fuchsia) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PersonViewModel()),
        // Agrega aquí más providers según tus necesidades
      ],
      child: MyApp(),
    ),
  );
}

late EditTextT textUsuari;
late EditTextPasswd textContra;


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colores.negrototal, // Cambia este color según tus preferencias
    ));
    return AdaptiveTheme(
        light: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          colorSchemeSeed: Colores.blueTheme,
        ),
        dark: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colores.negrototal,
          colorSchemeSeed: Colores.blueThemeDark,
        ),
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'App Votacion',
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en'),
              Locale('es'),
            ],
            theme: theme,
            darkTheme: darkTheme,
            home: SplashScreen(),
          );
        });
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    bool _darktheme = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _darktheme ? Colores.coloarPrimarioDark : Colores.coloarPrimario,
        title: Text(widget.title),
        titleTextStyle: TextStyle(
            color: _darktheme ? Colors.white : Colors.white, fontSize: 22),
        actions: [
          Switch(
              value: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark,
              onChanged: (bool value) {
                if (value) {
                  AdaptiveTheme.of(context).setDark();
                } else {
                  AdaptiveTheme.of(context).setLight();
                }
              })
        ],
      ),
      body: Page(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class bontoInicio extends StatefulWidget {
  const bontoInicio({Key? key}) : super(key: key);

  @override
  _bontoInicio createState() => _bontoInicio();
}
class _bontoInicio extends State<bontoInicio> {
  @override
  Widget build(BuildContext context) {
    bool _darktheme = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return ElevatedButton(
      onPressed: () {
        if(textUsuari.getText()=="1"){
          setState(() {
            textUsuari.setError(true,"Error: el numero no valido");
          });
        }else{
          print("--------------------"+textUsuari.getText()+"---------------------");
          print(textContra.getText());
        }
        Navigator.push(context, MaterialPageRoute(builder: (context) => Menu(textUsuari.getText(),textContra.getText())));
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
          'Iniciar Sesion',
          style: const TextStyle(
            fontSize: 16.0, // Tamaño de la fuente
            fontWeight: FontWeight.bold, // Negrita
            color: Colors.white, // Color del texto
          ),
        ),
      ),
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
    textUsuari =new EditTextT();
    textContra = new EditTextPasswd();
    FocusNode _focusNodeUsuario = FocusNode();
    FocusNode _focusNodeContra = FocusNode();
    textUsuari.setLabelhit("Usuario");
    textUsuari.setFocus(_focusNodeUsuario);
    textUsuari.setFocusNext(_focusNodeContra);
    textContra.setLabelhit("Contraseña");
    textContra.setFocus(_focusNodeContra);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: textUsuari,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: textContra,
          ),
          SizedBox(
            height: 80,
          ),
          Container(
            child: bontoInicio(),
          ),
        ],
      ),
    );
  }
}

