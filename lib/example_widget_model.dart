import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class ExampleWidgetModel extends ChangeNotifier{
  void readFile() async {
    // pathProvider.getApplicationDocumentsDirectory();
    // pathProvider.getApplicationSupportDirectory();
    // pathProvider.getTemporaryDirectory();
    // pathProvider.getLibraryDirectory();

    final directory = await pathProvider.getApplicationSupportDirectory();
    final filePath = directory.path + '/text.txt';
    final file = File(filePath);
    file.writeAsString('This is some text');
    if (await file.exists()) {
      print(await file.readAsString());
    }
  }
}

class ExampleWidgetModelProvider extends InheritedNotifier {
  final ExampleWidgetModel model;

  const ExampleWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, notifier: model, child: child);

  static ExampleWidgetModelProvider? watch (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ExampleWidgetModelProvider>();
  }

  static ExampleWidgetModelProvider? read (BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ExampleWidgetModelProvider>()
        ?.widget;
    return widget is ExampleWidgetModelProvider ? widget : null;
  }
}
