import 'package:flutter_flavors_example/app/app_configuration.dart';

class ProductionAppConfig implements AppConfiguration {
  const ProductionAppConfig();

  @override
  bool get bugReportEnabled => false;

  @override
  String get flavor => 'production';
}
