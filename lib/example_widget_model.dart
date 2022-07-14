import 'package:flutter/material.dart';

class ExampleWidgetModel {
  void readFile() async {

  }
}

class ExampleWidgetModelProvider extends InheritedNotifier {
  final ExampleWidgetModel model;

  const ExampleWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, child: child);

  static ExampleWidgetModelProvider? watch (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ExampleWidgetModelProvider>();
  }

  static ExampleWidgetModelProvider? read (BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType()?.widget;
    return widget is ExampleWidgetModelProvider ? widget : null;
  }
}
