import 'package:flutter/material.dart';
import 'package:flutter_flavors_example/app/app.dart';
import 'package:flutter_flavors_example/app/targets/production/production_app_config.dart';

void run() => runApp(const LightsOutApp(appConfig: ProductionAppConfig()));
