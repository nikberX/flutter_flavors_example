import 'package:flutter/material.dart';
import 'package:flutter_flavors_example/app/app_configuration.dart';
import 'package:flutter_flavors_example/bug_report/bug_report.dart';
import 'package:flutter_flavors_example/puzzle/puzzle.dart';

class UnknownAppConfig implements AppConfiguration {
  const UnknownAppConfig();

  @override
  bool get bugReportEnabled => true;

  @override
  String get flavor => 'lights-out';
}

class LightsOutApp extends StatelessWidget {
  final AppConfiguration appConfig;

  const LightsOutApp({super.key, this.appConfig = const UnknownAppConfig()});

  @override
  Widget build(BuildContext context) {
    return AppConfig(
      config: appConfig,
      child: MaterialApp(
        title: 'Lights out game',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: (settings) {
          final routeName = settings.name ?? '/';
          if (routeName == '/bug-report' && appConfig.bugReportEnabled) {
            return MaterialPageRoute(
              builder: (_) => BugReportPage(),
              settings: settings,
            );
          }
          return MaterialPageRoute(
            builder: (_) => PuzzlePage(),
            settings: settings,
          );
        },
      ),
    );
  }
}
