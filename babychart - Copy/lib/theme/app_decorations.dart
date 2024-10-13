import 'package:babychart/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray100,
      );

  static BoxDecoration get fillGray200 => BoxDecoration(
        color: appTheme.gray200,
      );

  static BoxDecoration get fillPink => BoxDecoration(
        color: appTheme.pink100,
      );

  static BoxDecoration get fillPurple => BoxDecoration(
        color: appTheme.purple488,
      );

  static BoxDecoration get fillPurple40001 => BoxDecoration(
        color: appTheme.purple40001,
      );

  static BoxDecoration get fillRed => BoxDecoration(
        color: appTheme.red50,
      );

  static BoxDecoration get fillwhiteA => BoxDecoration(
        color: appTheme.whiteA70001,
      );

  // Gradient decorations
  static BoxDecoration get gradientPurpleToPurple => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.52, -0.2),
          end: const Alignment(0.5, 1),
          colors: [
            appTheme.purple40001.withOpacity(0.58),
            appTheme.purple40001.withOpacity(0),
            appTheme.purple40001.withOpacity(0)
          ],
        ),
      );

  static BoxDecoration get gradientPurpleToPurple40001 => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.52, -0.2),
          end: const Alignment(0.5, 1),
          colors: [
            appTheme.purple40001.withOpacity(0.58),
            appTheme.purple40001.withOpacity(0),
            appTheme.purple40001.withOpacity(0)
          ],
        ),
      );

// Outline decorations
  static BoxDecoration get outlinePrimary => BoxDecoration(
        color: appTheme.whiteA70001,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary,
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      );

// BoxDecoration for all
  static BoxDecoration get outlinePrimaryContainer => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: theme.colorScheme.primaryContainer,
          width: 1,
        ),
      );

  static BoxDecoration get outlinePrimaryContainer1 => BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border.all(
          color: theme.colorScheme.primaryContainer,
          width: 1,
        ),
      );

  static BoxDecoration get outlinePrimaryContainer2 => BoxDecoration(
        color: appTheme.whiteA70001,
        border: Border.all(
          color: theme.colorScheme.primaryContainer,
          width: 1.0,
        ),
      );

  static BoxDecoration get outlinePrimary1 => BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary,
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      );

  static BoxDecoration get outlinePrimary2 => BoxDecoration(
        color: appTheme.whiteA70001,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.13),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(5, 4),
          ),
        ],
      );

  static BoxDecoration get outlinePrimary3 => BoxDecoration(
        color: appTheme.whiteA70001,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 1.96),
          ),
        ],
      );

  static BoxDecoration get outlinePrimary4 => BoxDecoration(
        color: appTheme.pink10001.withOpacity(0.76),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary,
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      );

  static BoxDecoration get outlinePurple => BoxDecoration(
        color: appTheme.whiteA70001,
        border: Border.all(
          color: appTheme.purple40001,
          width: 1,
        ),
      );
}

class BorderRadiusStyle {
  static BorderRadius get circleBorder180 => BorderRadius.circular(
        180.0,
      );

  static BorderRadius get circleBorder28 => BorderRadius.circular(
        28.0,
      );

  static BorderRadius get circleBorder38 => BorderRadius.circular(
        38.0,
      );

// Custom Borders
  static BorderRadius get customBorderTL10 => const BorderRadius.horizontal(
        left: Radius.circular(10),
      );

  static BorderRadius get customBorderTL25 => const BorderRadius.only(
        topLeft: Radius.circular(25),
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      );

  static BorderRadius get customBorderTL251 => const BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
        bottomRight: Radius.circular(25),
      );

  static BorderRadius get customBorderTL7 => const BorderRadius.vertical(
        top: Radius.circular(7),
      );

  static BorderRadius get roundedBorder10 => BorderRadius.circular(10);

  static BorderRadius get roundedBorder16 => BorderRadius.circular(16);

  static BorderRadius get roundedBorder21 => BorderRadius.circular(21);

  static BorderRadius get roundedBorder5 => BorderRadius.circular(5);

  static BorderRadius get roundedBorder50 => BorderRadius.circular(50);

  static BorderRadius get roundedBorder72 => BorderRadius.circular(72);
}
