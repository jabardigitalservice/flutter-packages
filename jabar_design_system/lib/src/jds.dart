library jabar_design_system;

import 'package:jabar_design_system/src/text_theme.dart';

import 'colors.dart';

/// JDS Main Class
///
/// Fungsi yang tersedia:
/// - **colors**
/// - **textTheme**
class Jds {
  Jds._();

  /// Sistem Warna JDS mengelompokkan warna-warna yang sering kami gunakan untuk
  /// merancang user interface yang menarik ke dalam kelompok **Warna Primer,
  /// Warna Sekunder, dan Warna Netral.** Selain itu, sistem ini memuat pula
  /// kombinasi turunan warna dari warna primer, sekunder, maupun netral.
  ///
  /// Proses pemilihan warna selalu mengikuti standar kontras dan warna AA dari
  /// **WCAG 2 Contrast and Color** supaya teks mudah dibaca.
  ///
  /// Contoh pemakaian:
  /// {@tool snippet}
  /// ```dart
  /// Icon(
  ///   Icons.widgets,
  ///   color: JdsColors.primary.green,
  /// )
  /// ```
  /// {@end-tool}
  static JdsColors get colors => JdsColors();

  /// Jabar Design System menggunakan 3 tipe font: 2 tipe Sans Serif dan
  /// 1 tipe Serif.
  ///
  /// - **sansSerif** menggunakan font Lato.
  /// - **sansSerifAlt** menggunakan font Roboto.
  /// - **serif** menggunakan font Lora.
  ///
  /// Contoh pemakaian:
  /// {@tool snippet}
  /// ```dart
  /// Text(
  ///   'Jabar Design System',
  ///   style: Jds.textTheme.sansSerif.BodyMedium,
  /// )
  /// ```
  /// {@end-tool}
  static JdsTextTheme get textTheme => JdsTextTheme();
}
