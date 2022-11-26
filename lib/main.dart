import 'package:flutter/material.dart';
import 'app.dart';
import 'core/service_locator.dart';

void main() async {
  // Setting up hydrated bloc for storing data
  // WidgetsFlutterBinding.ensureInitialized();
  // HydratedBloc.storage = await HydratedStorage.build(
  //     storageDirectory: kIsWeb
  //         ? HydratedStorage.webStorageDirectory
  //         : await getTemporaryDirectory(),
  // );

  //Setting service locator
  setUp();
  runApp(const IPotatoTimerApp());
}