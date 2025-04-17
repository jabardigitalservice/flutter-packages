import 'package:flutter/material.dart';
import 'package:multi_frc/multi_frc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final apiKey = '';
  final appIdAndroid = '';
  final appIdIos = '';
  final messagingSenderId = '';
  final projectId = '';
  final storageBucket = '';
  final iosBundleId = '';

  await MultiFrc.init(
    [
      MultiFrcOption(
        android: MultiFrc.option(
          apiKey: apiKey,
          appId: appIdAndroid,
          messagingSenderId: messagingSenderId,
          projectId: projectId,
          storageBucket: storageBucket,
        ),
        ios: MultiFrc.option(
          apiKey: apiKey,
          appId: appIdIos,
          messagingSenderId: messagingSenderId,
          projectId: projectId,
          storageBucket: storageBucket,
          iosBundleId: iosBundleId,
        ),
        web: null,
      ),
    ],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String get keyword => MultiFrc.getJson('json_test')['hello'] ?? '';
  List get counting => MultiFrc.getArray('array_test');
  Stream showBtnStream = MultiFrc.getBoolAsStream('bool_test');

  @override
  void initState() {
    super.initState();
    showBtnStream.listen((e) => debugPrint('$e'));
  }

  @override
  void dispose() {
    MultiFrc.removeStream('show_btn');
    super.dispose();
  }

  void _incrementCounter() {
    setState(() => _counter++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Lets count: ${counting.join(', ')}!',
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$keyword $_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: StreamBuilder(
        stream: showBtnStream,
        builder: (context, snapshot) {
          return Visibility(
            visible: snapshot.data == true,
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
