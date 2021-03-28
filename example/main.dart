import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scaffold_messenger_proxy/scaffold_messenger_proxy.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final _streamController = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessengerProxy<int>(
      stream: _streamController.stream,
      snackBarBuilder: (_config) {
        return SynchronousFuture(
          SnackBar(
            content: Text("I am from a stream"),
          ),
        );
      },
      child: Scaffold(
        body: Center(
          child: Text("EXAMPLE"),
        ),
      ),
    );
  }
}
