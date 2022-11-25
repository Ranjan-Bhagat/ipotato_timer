import "package:flutter/material.dart";
import 'core/core.dart';

class IPotatoTimerApp extends StatelessWidget {
  const IPotatoTimerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "IPotato Timer",
      theme: IPotatoThemes.light,
      // darkTheme: IPotatoThemes.dark,
      routes: IPotatoRoutes.routes,
    );
  }
}
