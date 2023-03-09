import 'package:example/common/drawer.dart';
import 'package:flutter/material.dart';
import 'package:jabar_design_system/jabar_design_system.dart';

class TextThemeScreen extends StatelessWidget {
  const TextThemeScreen({super.key});

  Widget textListTile(BuildContext context, String? title, TextStyle? style) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        tileColor: Jds.colors.grey.shade200,
        title: Text(title ?? '', style: style),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Theme')),
      drawer: const JdsDrawer(),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: TabBar(
                labelColor: Theme.of(context).primaryColor,
                tabs: const [
                  Tab(text: 'Sans Serif'),
                  Tab(text: 'Sans Serif Alt'),
                  Tab(text: 'Serif'),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                    children: [
                      textListTile(
                        context,
                        'Display Large / H1',
                        Jds.textTheme.sansSerif.displayLarge,
                      ),
                      textListTile(
                        context,
                        'Display Medium / H2',
                        Jds.textTheme.sansSerif.displayMedium,
                      ),
                      textListTile(
                        context,
                        'Display Small / H3',
                        Jds.textTheme.sansSerif.displaySmall,
                      ),
                      textListTile(
                        context,
                        'Headline Large / H3',
                        Jds.textTheme.sansSerif.headlineLarge,
                      ),
                      textListTile(
                        context,
                        'Headline Medium / H4',
                        Jds.textTheme.sansSerif.headlineMedium,
                      ),
                      textListTile(
                        context,
                        'Headline Small / H5',
                        Jds.textTheme.sansSerif.headlineSmall,
                      ),
                      textListTile(
                        context,
                        'Title Large / H6',
                        Jds.textTheme.sansSerif.titleLarge,
                      ),
                      textListTile(
                        context,
                        'Title Medium / Subtitle 1',
                        Jds.textTheme.sansSerif.titleMedium,
                      ),
                      textListTile(
                        context,
                        'Title Small / Subtitle 2',
                        Jds.textTheme.sansSerif.titleSmall,
                      ),
                      textListTile(
                        context,
                        'Body Large / Body 1',
                        Jds.textTheme.sansSerif.bodyLarge,
                      ),
                      textListTile(
                        context,
                        'Body Medium / Body 2',
                        Jds.textTheme.sansSerif.bodyMedium,
                      ),
                      textListTile(
                        context,
                        'Body Small / Endnote, Footnote',
                        Jds.textTheme.sansSerif.bodySmall,
                      ),
                      textListTile(
                        context,
                        'Label Large / Endnote, Footnote',
                        Jds.textTheme.sansSerif.labelLarge,
                      ),
                      textListTile(
                        context,
                        'Label Medium / Endnote, Footnote',
                        Jds.textTheme.sansSerif.labelMedium,
                      ),
                      textListTile(
                        context,
                        'Label Small / Endnote, Footnote',
                        Jds.textTheme.sansSerif.labelSmall,
                      ),
                    ],
                  ),
                  ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                    children: [
                      textListTile(
                        context,
                        'Display Large / H1',
                        Jds.textTheme.sansSerifAlt.displayLarge,
                      ),
                      textListTile(
                        context,
                        'Display Medium / H2',
                        Jds.textTheme.sansSerifAlt.displayMedium,
                      ),
                      textListTile(
                        context,
                        'Display Small / H3',
                        Jds.textTheme.sansSerifAlt.displaySmall,
                      ),
                      textListTile(
                        context,
                        'Headline Large / H3',
                        Jds.textTheme.sansSerifAlt.headlineLarge,
                      ),
                      textListTile(
                        context,
                        'Headline Medium / H4',
                        Jds.textTheme.sansSerifAlt.headlineMedium,
                      ),
                      textListTile(
                        context,
                        'Headline Small / H5',
                        Jds.textTheme.sansSerifAlt.headlineSmall,
                      ),
                      textListTile(
                        context,
                        'Title Large / H6',
                        Jds.textTheme.sansSerifAlt.titleLarge,
                      ),
                      textListTile(
                        context,
                        'Title Medium / Subtitle 1',
                        Jds.textTheme.sansSerifAlt.titleMedium,
                      ),
                      textListTile(
                        context,
                        'Title Small / Subtitle 2',
                        Jds.textTheme.sansSerifAlt.titleSmall,
                      ),
                      textListTile(
                        context,
                        'Body Large / Body 1',
                        Jds.textTheme.sansSerifAlt.bodyLarge,
                      ),
                      textListTile(
                        context,
                        'Body Medium / Body 2',
                        Jds.textTheme.sansSerifAlt.bodyMedium,
                      ),
                      textListTile(
                        context,
                        'Body Small / Endnote, Footnote',
                        Jds.textTheme.sansSerifAlt.bodySmall,
                      ),
                      textListTile(
                        context,
                        'Label Large / Endnote, Footnote',
                        Jds.textTheme.sansSerifAlt.labelLarge,
                      ),
                      textListTile(
                        context,
                        'Label Medium / Endnote, Footnote',
                        Jds.textTheme.sansSerifAlt.labelMedium,
                      ),
                      textListTile(
                        context,
                        'Label Small / Endnote, Footnote',
                        Jds.textTheme.sansSerifAlt.labelSmall,
                      ),
                    ],
                  ),
                  ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                    children: [
                      textListTile(
                        context,
                        'Display Large / H1',
                        Jds.textTheme.serif.displayLarge,
                      ),
                      textListTile(
                        context,
                        'Display Medium / H2',
                        Jds.textTheme.serif.displayMedium,
                      ),
                      textListTile(
                        context,
                        'Display Small / H3',
                        Jds.textTheme.serif.displaySmall,
                      ),
                      textListTile(
                        context,
                        'Headline Large / H3',
                        Jds.textTheme.serif.headlineLarge,
                      ),
                      textListTile(
                        context,
                        'Headline Medium / H4',
                        Jds.textTheme.serif.headlineMedium,
                      ),
                      textListTile(
                        context,
                        'Headline Small / H5',
                        Jds.textTheme.serif.headlineSmall,
                      ),
                      textListTile(
                        context,
                        'Title Large / H6',
                        Jds.textTheme.serif.titleLarge,
                      ),
                      textListTile(
                        context,
                        'Title Medium / Subtitle 1',
                        Jds.textTheme.serif.titleMedium,
                      ),
                      textListTile(
                        context,
                        'Title Small / Subtitle 2',
                        Jds.textTheme.serif.titleSmall,
                      ),
                      textListTile(
                        context,
                        'Body Large / Body 1',
                        Jds.textTheme.serif.bodyLarge,
                      ),
                      textListTile(
                        context,
                        'Body Medium / Body 2',
                        Jds.textTheme.serif.bodyMedium,
                      ),
                      textListTile(
                        context,
                        'Body Small / Endnote, Footnote',
                        Jds.textTheme.serif.bodySmall,
                      ),
                      textListTile(
                        context,
                        'Label Large / Endnote, Footnote',
                        Jds.textTheme.serif.labelLarge,
                      ),
                      textListTile(
                        context,
                        'Label Medium / Endnote, Footnote',
                        Jds.textTheme.serif.labelMedium,
                      ),
                      textListTile(
                        context,
                        'Label Small / Endnote, Footnote',
                        Jds.textTheme.serif.labelSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
