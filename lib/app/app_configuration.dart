import 'package:flutter/widgets.dart';

abstract class AppConfiguration {
  String get flavor;
  bool get bugReportEnabled;
}

class AppConfig extends InheritedWidget {
  final AppConfiguration config;

  const AppConfig({
    required this.config,
    required super.child,
    super.key,
  });

  static AppConfig? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  static AppConfig of(BuildContext context) {
    final AppConfig? result = maybeOf(context);
    assert(result != null, 'No AppConfig in context');
    return result!;
  }

  T mapBugReportEnabled<T>({
    required T Function() enabled,
    required T Function() disabled,
  }) {
    if (config.bugReportEnabled) {
      return enabled();
    }
    return disabled();
  }

  @override
  bool updateShouldNotify(AppConfig oldWidget) => config != oldWidget.config;
}
