import 'package:flutter_flavors_example/app/app_configuration.dart';

class BetaAppConfig implements AppConfiguration {
  const BetaAppConfig();

  @override
  String get flavor => 'beta';

  @override
  bool get bugReportEnabled => true;
}
