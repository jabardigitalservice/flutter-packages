import 'package:example/common/drawer.dart';
import 'package:flutter/material.dart';
import 'package:jabar_design_system/jabar_design_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jabar Design System',
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Jds.colors.green,
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Jds.colors.grey.shade50,
          foregroundColor: Jds.colors.grey.shade900,
        ),
        textTheme: Jds.textTheme.sansSerif,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jabar Design System'),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: const JdsDrawer(
        isHome: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          child: Image.asset(
            'assets/images/logo.png',
            width: MediaQuery.of(context).size.width * 0.5,
          ),
        ),
      ),
    );
  }
}
