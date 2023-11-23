import 'package:cloudwalk_test/app/shared/models/nasa_apod_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NasaApodModelAdapter());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
