import 'package:example/common/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jabar_design_system/jabar_design_system.dart';

class ColorScreen extends StatelessWidget {
  const ColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shades = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];

    final swatches = [
      Jds.colors.yellow,
      Jds.colors.blue,
      Jds.colors.green,
      Jds.colors.pink,
      Jds.colors.red,
      Jds.colors.purple,
      Jds.colors.grey,
      Jds.colors.blueGrey,
    ];

    final swatchesName = [
      'Yellow',
      'Blue',
      'Green',
      'Pink',
      'Red',
      'Purple',
      'Grey',
      'Blue Grey',
    ];

    String colorToHex(Color? color) {
      return '#${color?.value.toRadixString(16).substring(2).toUpperCase()}';
    }

    Widget colorListTile(String title, Color? color) {
      return ListTile(
        tileColor: color,
        leading: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 2,
          ),
          decoration: BoxDecoration(
            color: Jds.colors.grey.shade50.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(title),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 2,
          ),
          decoration: BoxDecoration(
            color: Jds.colors.grey.shade50.withOpacity(0.3),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Text(colorToHex(color)),
        ),
        onTap: () async {
          Clipboard.setData(ClipboardData(text: colorToHex(color))).then((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Color copied to your clipboard: ${colorToHex(color)}',
                ),
              ),
            );
          });
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Color')),
      drawer: const JdsDrawer(),
      body: ListView(
        children: [
          colorListTile(
            'Primary/Blue',
            Jds.colors.primary.blue,
          ),
          colorListTile(
            'Primary/Yellow',
            Jds.colors.primary.yellow,
          ),
          colorListTile(
            'Primary/Green',
            Jds.colors.primary.green,
          ),
          colorListTile(
            'Secondary/Pink',
            Jds.colors.secondary.pink,
          ),
          colorListTile(
            'Secondary/Red',
            Jds.colors.secondary.red,
          ),
          colorListTile(
            'Secondary/Purple',
            Jds.colors.secondary.purple,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: swatches.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, i) => ListView.builder(
              shrinkWrap: true,
              itemCount: shades.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, j) => colorListTile(
                '${swatchesName[i]}/${shades[j]}',
                swatches[i][shades[j]],
              ),
            ),
          ),
          colorListTile(
            'Dark/Background',
            Jds.colors.dark.background,
          ),
          colorListTile(
            'Dark/Elevation Low',
            Jds.colors.dark.elevation.lowEmphasis,
          ),
          colorListTile(
            'Dark/Elevation Medium',
            Jds.colors.dark.elevation.mediumEmphasis,
          ),
          colorListTile(
            'Dark/Elevation Medium 2',
            Jds.colors.dark.elevation.mediumEmphasis2,
          ),
          colorListTile(
            'Dark/Elevation Hight',
            Jds.colors.dark.elevation.highEmphasis,
          ),
          colorListTile(
            'Dark/State Active',
            Jds.colors.dark.state.active,
          ),
          colorListTile(
            'Dark/State Focus',
            Jds.colors.dark.state.focus,
          ),
          colorListTile(
            'Dark/State Error',
            Jds.colors.dark.state.error,
          ),
          colorListTile(
            'Dark/Text Low',
            Jds.colors.dark.text.lowEmphasis,
          ),
          colorListTile(
            'Dark/Text Medium',
            Jds.colors.dark.text.mediumEmphasis,
          ),
          colorListTile(
            'Dark/Text High',
            Jds.colors.dark.text.highEmphasis,
          ),
          colorListTile(
            'Dark/Text Error',
            Jds.colors.dark.text.error,
          ),
        ],
      ),
    );
  }
}
