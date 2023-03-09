import 'package:flutter/material.dart';

class JdsColors {
  /// JDS memiliki kombinasi warna primer, yaitu **warna kuning, hijau, dan biru.**
  /// Warna primer adalah warna yang paling sering ditampilkan dalam komponen
  /// seperti tombol, header, dll., serta merupakan warna branding yang mewakili
  /// produk.
  final primary = const Primary();

  /// Warna sekunder memberikan pilihan aksen untuk ditampilkan dalam desain
  /// produk namun tidak menggambarkan branding dari produk tersebut.
  /// Umumnya, warna sekunder sangat sedikit digunakan dan hanya digunakan
  /// untuk feedback, notifikasi, pesan error, dll.
  final secondary = const Secondary();

  /// Warna netral digunakan untuk teks atau latar yang memiliki aksen yang
  /// tidak terlalu mencolok.
  final neutral = const Neutral();

  /// Dark Theme menampilkan permukaan gelap di sebagian besar UI.
  /// Warna ini dirancang untuk menjadi mode tambahan untuk tema
  /// default (Light Theme).
  final dark = const Dark();

  /// Warna turunan adalah kumpulan semua kelompok warna
  /// (primer, sekunder, dan netral) ditambah komposisi light (terang)
  /// dan dark (gelap) dari masing-masing warna tersebut.
  final yellow = MaterialColor(
    const Primary().yellow.value,
    const {
      50: Color(0xFFFFF9E1),
      100: Color(0xFFFFEEB4),
      200: Color(0xFFFFE483),
      300: Color(0xFFFFDA4F),
      400: Color(0xFFFFD026),
      500: Color(0xFFFFC800),
      600: Color(0xFFFFB900),
      700: Color(0xFFFFA600),
      800: Color(0xFFFF9500),
      900: Color(0xFFFF7500),
    },
  );

  /// Warna turunan adalah kumpulan semua kelompok warna
  /// (primer, sekunder, dan netral) ditambah komposisi light (terang)
  /// dan dark (gelap) dari masing-masing warna tersebut.
  final green = MaterialColor(
    const Primary().green.value,
    const {
      50: Color(0xFFE6F6EC),
      100: Color(0xFFC3E9D0),
      200: Color(0xFF9BDBB3),
      300: Color(0xFF70CD94),
      400: Color(0xFF4DC27E),
      500: Color(0xFF1FB767),
      600: Color(0xFF16A75C),
      700: Color(0xFF069550),
      800: Color(0xFF008444),
      900: Color(0xFF006430),
    },
  );

  /// Warna turunan adalah kumpulan semua kelompok warna
  /// (primer, sekunder, dan netral) ditambah komposisi light (terang)
  /// dan dark (gelap) dari masing-masing warna tersebut.
  final blue = MaterialColor(
    const Primary().blue.value,
    const {
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(0xFF2196F3),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );

  /// Warna turunan adalah kumpulan semua kelompok warna
  /// (primer, sekunder, dan netral) ditambah komposisi light (terang)
  /// dan dark (gelap) dari masing-masing warna tersebut.
  final pink = MaterialColor(
    const Secondary().pink.value,
    const {
      50: Color(0xFFFFE6EC),
      100: Color(0xFFFFBFCF),
      200: Color(0xFFFF96AF),
      300: Color(0xFFFF6C8F),
      400: Color(0xFFFF4D77),
      500: Color(0xFFFD355F),
      600: Color(0xFFEC305D),
      700: Color(0xFFD62A59),
      800: Color(0xFFC12357),
      900: Color(0xFF9D1951),
    },
  );

  /// Warna turunan adalah kumpulan semua kelompok warna
  /// (primer, sekunder, dan netral) ditambah komposisi light (terang)
  /// dan dark (gelap) dari masing-masing warna tersebut.
  final red = MaterialColor(
    const Secondary().red.value,
    const {
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(0xFFF44336),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71B1C),
    },
  );

  /// Warna turunan adalah kumpulan semua kelompok warna
  /// (primer, sekunder, dan netral) ditambah komposisi light (terang)
  /// dan dark (gelap) dari masing-masing warna tersebut.
  final purple = MaterialColor(
    const Secondary().purple.value,
    const {
      50: Color(0xFFF3E5F5),
      100: Color(0xFFE1BEE7),
      200: Color(0xFFCE93D8),
      300: Color(0xFFBA68C8),
      400: Color(0xFFAB47BC),
      500: Color(0xFF9B27B0),
      600: Color(0xFF8D24AA),
      700: Color(0xFF7A1FA2),
      800: Color(0xFF691B9A),
      900: Color(0xFF49148C),
    },
  );

  /// Warna turunan adalah kumpulan semua kelompok warna
  /// (primer, sekunder, dan netral) ditambah komposisi light (terang)
  /// dan dark (gelap) dari masing-masing warna tersebut.
  final grey = MaterialColor(
    const Neutral().grey.value,
    const {
      50: Color(0xFFFAFAFA),
      100: Color(0xFFF5F5F5),
      200: Color(0xFFEEEEEE),
      300: Color(0xFFE0E0E0),
      400: Color(0xFFBDBDBD),
      500: Color(0xFF9E9E9E),
      600: Color(0xFF757575),
      700: Color(0xFF616161),
      800: Color(0xFF424242),
      900: Color(0xFF212121),
    },
  );

  /// Warna turunan adalah kumpulan semua kelompok warna
  /// (primer, sekunder, dan netral) ditambah komposisi light (terang)
  /// dan dark (gelap) dari masing-masing warna tersebut.
  final blueGrey = MaterialColor(
    const Neutral().blueGrey.value,
    const {
      50: Color(0xFFE3E7ED),
      100: Color(0xFFB9C3D3),
      200: Color(0xFF8D9DB5),
      300: Color(0xFF627798),
      400: Color(0xFF415C84),
      500: Color(0xFF1A4373),
      600: Color(0xFF133C6B),
      700: Color(0xFF083461),
      800: Color(0xFF022B55),
      900: Color(0xFF001B3D),
    },
  );
}

class Primary {
  const Primary();
  Color get blue => const Color(0xFF1E88E5);
  Color get yellow => const Color(0xFFFFD026);
  Color get green => const Color(0xFF16A75C);
}

class Secondary {
  const Secondary();
  Color get pink => const Color(0xFFFF4D77);
  Color get red => const Color(0xFFF44336);
  Color get purple => const Color(0xFFAB47BC);
}

class Neutral {
  const Neutral();
  Color get grey => const Color(0xFF212121);
  Color get blueGrey => const Color(0xFF001B3D);
}

class Dark {
  const Dark();
  final elevation = const ElevationDark();
  final state = const StateDark();
  final text = const TextDark();

  Color get background => const Color(0xFF111313);
}

class ElevationDark {
  const ElevationDark();
  Color get lowEmphasis => const Color(0xFF1F2121);
  Color get mediumEmphasis => const Color(0xFF4F5050);
  Color get mediumEmphasis2 => const Color(0xFF292C2A);
  Color get highEmphasis => const Color(0xFFD7D7D7);
}

class StateDark {
  const StateDark();
  Color get active => const Color(0xFF20A95A);
  Color get focus => const Color(0xFFFEd32C);
  Color get error => const Color(0xFFDD5E5E);
}

class TextDark {
  const TextDark();
  Color get lowEmphasis => const Color(0xFFAAB0B7);
  Color get mediumEmphasis => const Color(0xFF868C89);
  Color get highEmphasis => const Color(0xFFF8F8F8);
  Color get error => const Color(0xFFDD5E5E);
}
