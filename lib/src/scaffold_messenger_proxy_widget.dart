import 'dart:async';
import 'package:flutter/material.dart';

class ScaffoldMessengerProxy<T> extends StatelessWidget {
  ScaffoldMessengerProxy({
    required this.child,
    required this.stream,
    required this.snackBarBuilder,
  });

  final Widget child;

  final Future<SnackBar> Function(T config) snackBarBuilder;

  final _ScaffoldMessengerProxyInternal<T> _internal =
      _ScaffoldMessengerProxyInternal<T>();
  final Stream<T> stream;

  @override
  Widget build(BuildContext context) {
    _internal.subscription ??= stream.listen(
      (_config) async {
        final SnackBar _snackBar = await snackBarBuilder(_config);
        ScaffoldMessenger.of(context).showSnackBar(_snackBar);
      },
      onDone: () => _internal.dispose(),
    );
    return child;
  }
}

class _ScaffoldMessengerProxyInternal<T> {
  _ScaffoldMessengerProxyInternal();
  StreamSubscription<T>? subscription;

  void dispose() {
    subscription?.cancel();
  }
}
