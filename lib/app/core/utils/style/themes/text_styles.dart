import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/general_colors.dart';

///O [TextStyles] é uma classe responsável por gerenciar e armazenar variádos
///tipos de estilização de textos.
class TextStyles {
  ///Método que retorna estilização de texto de forma customizável.
  ///
  ///Deve ser utilizado somente caso os outros métodos da
  ///classe [TextStyles] não contemplem a estilização de texto proposto no design.
  ///
  ///**Exemplo:**
  /// ```dart
  /// Text(
  ///   'texto',
  ///   style: TextStyles.custom(
  ///     color: kColorStatusActive,
  ///     fontWeight: FontWeight.bold,
  ///     fontSize: 13,
  ///    ),
  /// ),
  /// ```

  ///Método que retorna estilização de texto correspondente ao **Headline 1**.
  static TextStyle headline1({Color? color}) {
    return GoogleFonts.notoSerif(
      color: color ?? kColorPrimary,
      fontWeight: FontWeight.bold,
      fontSize: 25,
      letterSpacing: -0.5,
    );
  }

  ///Método que retorna estilização de texto correspondente ao **Headline 2**.
  static TextStyle headline2({Color? color}) {
    return GoogleFonts.notoSerif(
      color: color ?? kColorPrimary,
      fontWeight: FontWeight.w700,
      fontSize: 14,
      letterSpacing: 0.2,
    );
  }

  ///Método que retorna estilização de texto correspondente ao **subtitle1**.
  static TextStyle subtitle1({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.notoSerif(
      color: color ?? kColorPrimary,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontSize: 12,
      letterSpacing: 0.1,
    );
  }

  ///Método que retorna estilização de texto correspondente ao **BodyText 1**.
  static TextStyle bodyText1({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.notoSerif(
      color: color ?? kColorPrimary,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontSize: 12,
      letterSpacing: 0.2,
    );
  }

  static TextStyle bodyText2({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.notoSerif(
      color: color ?? kColorPrimaryAdmin,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontSize: 12,
      letterSpacing: 0.2,
    );
  }

  ///Método que retorna estilização de texto correspondente ao **Button**.
  static TextStyle button({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.notoSerif(
      color: color ?? kColorTextButton,
      fontWeight: fontWeight ?? FontWeight.bold,
      fontSize: 18,
      letterSpacing: 0.04,
    );
  }
}
