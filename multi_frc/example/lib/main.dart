import 'package:flutter/material.dart';
import 'package:multi_frc/multi_frc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MultiFrc.init(
    [
      MultiFrcOption(
        android: MultiFrc.option(
          apiKey: 'AIzaSyDWLZndekQOF-lo0OH6EMaoi7tCzG8uMpc',
          appId: '1:565352898022:android:8d5b13bd4566667f950a27',
          messagingSenderId: '565352898022',
          projectId: 'jabar-superapp-research',
          storageBucket: 'jabar-superapp-research.firebasestorage.app',
        ),
        ios: MultiFrc.option(
          apiKey: 'AIzaSyDgY27C3kFJ91LT4NbwflEujuKGIs6J_Ug',
          appId: '1:565352898022:ios:a73c1d3d61449f58950a27',
          messagingSenderId: '565352898022',
          projectId: 'jabar-superapp-research',
          storageBucket: 'jabar-superapp-research.firebasestorage.app',
          iosBundleId: 'com.example.example',
        ),
      ),
      // MultiFrc.options(
      //   apiKey: 'AIzaSyDlnQcQmtBQ_OUAodGG79ChLdTCQkTXTH0',
      //   appId: '1:35697311623:android:99268267626d48312f9d22',
      //   messagingSenderId: '35697311623',
      //   projectId: 'jabar-superapp',
      //   storageBucket: 'jabar-superapp.appspot.com',
      // )
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
  String get keyword => MultiFrc.getJson('param_test')['hello'] ?? '';
  Stream showBtnStream = MultiFrc.getBoolAsStream('show_btn');

  @override
  void initState() {
    super.initState();
    showBtnStream.listen((e) => print('AAAA $e'));
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
