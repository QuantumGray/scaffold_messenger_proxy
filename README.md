# scaffold_messenger_proxy

reactively trigger SnackBar notifications by listening to a stream

## Usage

````dart
    // string is just an example type but can be any type
    StreamController<String> myAwesomeStreamController = StreamController<String>();

    ...

    MaterialApp(
        // ------------
        home: ScaffoldMessengerProxy(
            stream: myAwesomeStreamController.stream,
            snackBarBuilder: (config) => SnackBar(content: Text(config)),
            // -------------
            child: Scaffold(
                body: Center(
                    child: TextButton(
                        onPressed: () => myAwesomeStreamController.sink.add('Hello World Snackbar!'), 
                        child: Text("trigger snackbar"),
                        ),
                )
            )
        )
    )
````
