import 'package:file_management/example_widget_model.dart';
import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final _model = ExampleWidgetModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ExampleWidgetModelProvider(
            model: _model,
            child: Column(
              children: const [
                _ReadFileButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ReadFileButton extends StatelessWidget {
  const _ReadFileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => ExampleWidgetModelProvider.read(context)!.model.readFile(),
        child: const Text('Read file')
    );
  }
}
