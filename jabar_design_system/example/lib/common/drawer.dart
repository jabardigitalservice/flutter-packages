import 'package:example/feature/design/colors_screen.dart';
import 'package:example/feature/design/text_theme_screen.dart';
import 'package:flutter/material.dart';

class JdsDrawer extends StatelessWidget {
  const JdsDrawer({super.key, this.isHome});

  final bool? isHome;

  @override
  Widget build(BuildContext context) {
    void navTo(Widget screen) async {
      final route = MaterialPageRoute(builder: (_) => screen);
      if (isHome == true) Navigator.pop(context);

      isHome == true
          ? Navigator.push(context, route)
          : Navigator.pushReplacement(context, route);
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            margin: const EdgeInsets.all(0),
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            accountName: Text(
              'Jabar Digital Service',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            accountEmail: Text(
              'digital.service@jabarprov.go.id',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            currentAccountPicture: Image.asset(
              'assets/images/logo.png',
            ),
          ),
          const Divider(height: 1),
          const ListTile(
            title: Text('Design'),
          ),
          ListTile(
            leading: const Icon(Icons.palette_outlined),
            title: const Text('Color'),
            onTap: () => navTo(const ColorScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.font_download_outlined),
            title: const Text('Text Theme'),
            onTap: () => navTo(const TextThemeScreen()),
          ),
          const Divider(height: 1),
          const AboutListTile(
            icon: Icon(Icons.info_outline_rounded),
            applicationName: 'Jabar Design System',
            applicationVersion: '0.0.2',
            applicationLegalese: '© 2023 Jabar Digital Service',
            aboutBoxChildren: [],
            child: Text('About Package'),
          ),
        ],
      ),
    );
  }
}
