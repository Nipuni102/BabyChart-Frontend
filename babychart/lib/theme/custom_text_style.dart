import 'package:babychart/theme/theme_helper.dart';
import 'package:flutter/material.dart';

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get mulish {
    return copyWith(
      fontFamily: 'Mulish',
    );
  }

  TextStyle get nunito {
    return copyWith(
      fontFamily: 'Nunito',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get mochiyPopOne {
    return copyWith(
      fontFamily: 'Mochiy Pop One',
    );
  }

  TextStyle get robotoSerif {
    return copyWith(
      fontFamily: 'Roboto Serif',
    );
  }
}

/// A collection of pre-defined text styles for customizing text appearance,

/// categorized by different font families and weights.

/// Additionally, this class includes extensions on [TextStyle] to easily app

class CustomTextStyles {
// Body text style

  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
      );

  static get bodyMediumRobotoSerifGray700 =>
      theme.textTheme.bodyMedium!.robotoSerif.copyWith(
        color: appTheme.gray700,
        fontSize: 13,
      );

  static get bodySmallPoppinsPrimary =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.43),
      );

// Headline text style

  static get headlineSmallInterPrimary =>
      theme.textTheme.headlineSmall!.inter.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontWeight: FontWeight.w600,
      );

  static get headlineSmallInterWhiteA78001 =>
      theme.textTheme.headlineSmall!.inter.copyWith(
        color: appTheme.whiteA70001,
        fontWeight: FontWeight.w600,
      );

// Label text style

  static get labelLargeErrorContainer => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.errorContainer,
      );

  static get labelLargeGray80002 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray80001,
      );

  static get labelLargePurple400 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.purple488,
      );

// Title text style

  static get titleLargeMochiyPopOneWhiteA70001 =>
      theme.textTheme.titleLarge!.mochiyPopOne.copyWith(
        color: appTheme.whiteA70001,
      );

  static get titleLargeMulish => theme.textTheme.titleLarge!.mulish.copyWith(
        fontWeight: FontWeight.w600,
      );

  static get titleLargeNunitowhiteA70001 =>
      theme.textTheme.titleLarge!.nunito.copyWith(
        color: appTheme.whiteA70001,
        fontWeight: FontWeight.w700,
      );

  static get titlelargePoppins => theme.textTheme.titleLarge!.poppins;

  static get titleLargePoppinsPrimaryContainer =>
      theme.textTheme.titleLarge!.poppins.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w600,
      );

  static get titleLargePoppinsWhiteA700 =>
      theme.textTheme.titleLarge!.poppins.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );

  static get titleLargePoppinsWhiteA70001 =>
      theme.textTheme.titleLarge!.poppins.copyWith(
        color: appTheme.whiteA70001,
        fontWeight: FontWeight.w600,
      );

  static get titleLargePoppinsWhiteA70001_1 =>
      theme.textTheme.titleLarge!.poppins.copyWith(
        color: appTheme.whiteA70001,
      );

  static get titleLargeRobotoPrimaryContainer =>
      theme.textTheme.titleLarge!.roboto.copyWith(
        color: theme.colorScheme.primaryContainer,
      );

  static get titleLargeRobotowhiteA70001 =>
      theme.textTheme.titleLarge!.roboto.copyWith(
        color: appTheme.whiteA70001,
      );

  static get titleLargeSemiBold => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );

  static get titlelargeWhiteA70001 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA70001,
        fontWeight: FontWeight.w700,
      );

  static get titleMediumGreen400 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.green400,
      );

  static get titleMediumNunitowhiteA70001 =>
      theme.textTheme.titleMedium!.nunito.copyWith(
        color: appTheme.whiteA70001,
        fontSize: 17,
      );

  static get titleSmallGray80001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray80001,
        fontWeight: FontWeight.w700,
      );

  static get titleSmall0nPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 15,
        fontWeight: FontWeight.w700,
      );
}
