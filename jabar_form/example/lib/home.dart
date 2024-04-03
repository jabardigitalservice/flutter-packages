import 'package:example/sources/complete_form.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _menus = ['Complete Form', 'SIDEBAR Style', 'JSA Style'];
  final List<Widget> _pages = [
    const CompleteForm(),
    const Placeholder(),
    const Placeholder()
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
        itemCount: _menus.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(_menus[index]),
              trailing: const Icon(Icons.arrow_right_alt_rounded),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                side: BorderSide(),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => _pages[index],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
