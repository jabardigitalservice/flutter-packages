import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jabar_design_system/src/colors.dart';

class JdsTextTheme {
  /// Lato (Sans Serif)
  final sansSerif = GoogleFonts.latoTextTheme(
    TextTheme(
      displayLarge: Heading().common.displayLarge,
      displayMedium: Heading().common.displayMedium,
      displaySmall: Heading().common.displaySmall,
      headlineLarge: Heading().common.headlineLarge,
      headlineMedium: Heading().common.headlineMedium,
      headlineSmall: Heading().common.headlineSmall,
      titleLarge: Heading().common.titleLarge,
      titleMedium: Heading().common.titleMedium,
      titleSmall: Heading().common.titleSmall,
      bodyLarge: Paragraph().dense.bodyLarge,
      bodyMedium: Paragraph().common.bodyMedium,
      bodySmall: Paragraph().common.bodySmall,
      labelLarge: Paragraph().dense.labelLarge,
      labelMedium: Paragraph().common.labelMedium,
      labelSmall: Paragraph().common.labelSmall,
    ),
  );

  /// Roboto (Sans Serif)
  final sansSerifAlt = GoogleFonts.robotoTextTheme(
    TextTheme(
      displayLarge: Heading().common.displayLarge,
      displayMedium: Heading().common.displayMedium,
      displaySmall: Heading().common.displaySmall,
      headlineLarge: Heading().common.headlineLarge,
      headlineMedium: Heading().common.headlineMedium,
      headlineSmall: Heading().common.headlineSmall,
      titleLarge: Heading().common.titleLarge,
      titleMedium: Heading().common.titleMedium,
      titleSmall: Heading().common.titleSmall,
      bodyLarge: Paragraph().dense.bodyLarge,
      bodyMedium: Paragraph().common.bodyMedium,
      bodySmall: Paragraph().common.bodySmall,
      labelLarge: Paragraph().dense.labelLarge,
      labelMedium: Paragraph().common.labelMedium,
      labelSmall: Paragraph().common.labelSmall,
    ),
  );

  /// Lora (Serif)
  final serif = GoogleFonts.loraTextTheme(
    TextTheme(
      displayLarge: Heading().common.displayLarge,
      displayMedium: Heading().common.displayMedium,
      displaySmall: Heading().common.displaySmall,
      headlineLarge: Heading().common.headlineLarge,
      headlineMedium: Heading().common.headlineMedium,
      headlineSmall: Heading().common.headlineSmall,
      titleLarge: Heading().common.titleLarge,
      titleMedium: Heading().common.titleMedium,
      titleSmall: Heading().common.titleSmall,
      bodyLarge: Paragraph().dense.bodyLarge,
      bodyMedium: Paragraph().common.bodyMedium,
      bodySmall: Paragraph().common.bodySmall,
      labelLarge: Paragraph().dense.labelLarge,
      labelMedium: Paragraph().common.labelMedium,
      labelSmall: Paragraph().common.labelSmall,
    ),
  );

  final heading = Heading();
  final paragraph = Paragraph();
}

class Heading {
  Heading();

  TextTheme get common => TextTheme(
        /// Headline 1
        displayLarge: TextStyle(
          fontSize: 49,
          height: 1.2,
          color: JdsColors().neutral.grey,
        ),

        /// Headline 2
        displayMedium: TextStyle(
          fontSize: 41,
          height: 1.2,
          color: JdsColors().neutral.grey,
        ),

        /// Headline 3
        displaySmall: TextStyle(
          fontSize: 34,
          height: 1.2,
          color: JdsColors().neutral.grey,
        ),

        /// Headline 3
        headlineLarge: TextStyle(
          fontSize: 34,
          height: 1.2,
          color: JdsColors().neutral.grey,
        ),

        /// Headline 4
        headlineMedium: TextStyle(
          fontSize: 28,
          height: 1.2,
          color: JdsColors().neutral.grey,
        ),

        /// Headline 5
        headlineSmall: TextStyle(
          fontSize: 23,
          height: 1.2,
          color: JdsColors().neutral.grey,
        ),

        /// Headline 6
        titleLarge: TextStyle(
          fontSize: 19,
          height: 1.2,
          color: JdsColors().neutral.grey,
        ),

        /// Subtitle 1
        titleMedium: TextStyle(
          fontSize: 16,
          height: 1.2,
          color: JdsColors().neutral.grey,
        ),

        /// Subtitle 2
        titleSmall: TextStyle(
          fontSize: 13,
          height: 1.2,
          color: JdsColors().neutral.grey,
        ),
      );

  TextTheme get dense => Heading().common.copyWith(
        /// Headline 1
        displayLarge: TextStyle(
          fontSize: 49,
          height: 1,
          color: JdsColors().neutral.grey,
        ),

        /// Headline 2
        displayMedium: TextStyle(
          fontSize: 41,
          height: 1,
          color: JdsColors().neutral.grey,
        ),

        /// Headline 3
        displaySmall: TextStyle(
          fontSize: 34,
          height: 1,
          color: JdsColors().neutral.grey,
        ),

        /// Headline 3
        headlineLarge: TextStyle(
          fontSize: 34,
          height: 1,
          color: JdsColors().neutral.grey,
        ),

        /// Headline 4
        headlineMedium: TextStyle(
          fontSize: 28,
          height: 1,
          color: JdsColors().neutral.grey,
        ),

        /// Headline 5
        headlineSmall: TextStyle(
          fontSize: 23,
          height: 1,
          color: JdsColors().neutral.grey,
        ),

        /// Headline 6
        titleLarge: TextStyle(
          fontSize: 19,
          height: 1,
          color: JdsColors().neutral.grey,
        ),

        /// Subtitle 1
        titleMedium: TextStyle(
          fontSize: 16,
          height: 1,
          color: JdsColors().neutral.grey,
        ),

        /// Subtitle 2
        titleSmall: TextStyle(
          fontSize: 13,
          height: 1,
          color: JdsColors().neutral.grey,
        ),
      );
}

class Paragraph {
  Paragraph();

  TextTheme get common => TextTheme(
        /// Body 1
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 1.618,
          color: JdsColors().neutral.grey,
        ),

        /// Body 2
        bodyMedium: TextStyle(
          fontSize: 13,
          height: 1.618,
          color: JdsColors().neutral.grey,
        ),

        /// Endnote, Footnote
        bodySmall: TextStyle(
          fontSize: 11,
          height: 1.618,
          color: JdsColors().neutral.grey,
        ),

        /// Endnote, Footnote
        labelLarge: TextStyle(
          fontSize: 11,
          height: 1.618,
          color: JdsColors().neutral.grey,
        ),

        /// Endnote, Footnote
        labelMedium: TextStyle(
          fontSize: 11,
          height: 1.618,
          color: JdsColors().neutral.grey,
        ),

        /// Endnote, Footnote
        labelSmall: TextStyle(
          fontSize: 11,
          height: 1.618,
          color: JdsColors().neutral.grey,
        ),
      );

  TextTheme get dense => Paragraph().common.copyWith(
        /// Body 1
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 1.2,
          color: JdsColors().neutral.grey,
        ),

        /// Body 2
        bodyMedium: TextStyle(
          fontSize: 13,
          height: 1.2,
          color: JdsColors().neutral.grey,
        ),

        /// Endnote, Footnote
        bodySmall: TextStyle(
          fontSize: 11,
          height: 1.2,
          color: JdsColors().neutral.grey,
        ),

        /// Endnote, Footnote
        labelLarge: TextStyle(
          fontSize: 11,
          height: 1.2,
          color: JdsColors().neutral.grey,
          fontWeight: FontWeight.bold,
        ),

        /// Endnote, Footnote
        labelMedium: TextStyle(
          fontSize: 11,
          height: 1.2,
          color: JdsColors().neutral.grey,
        ),

        /// Endnote, Footnote
        labelSmall: TextStyle(
          fontSize: 11,
          height: 1.2,
          color: JdsColors().neutral.grey,
        ),
      );
}
