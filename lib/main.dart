import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_training/content.dart';
import 'package:flutter_training/network.dart';
import 'package:flutter_training/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MainApp(
        network: StubNetwork(),
      ),
    );
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.network});

  final Network network;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.blue,
          secondary: Colors.red,
          tertiary: Colors.green,
        ),
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => SplashScene(
              onSplashComplete: () {
                Navigator.of(context).pushNamed('/content');
              },
            ),
        '/content': (context) => ContentScene(
              network: StubNetwork(),
              onContentClose: () {
                Navigator.of(context).pop();
              },
            ),
      },
    );
  }
}
