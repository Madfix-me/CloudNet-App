import '/utils/color.dart' as color;
import '/utils/const.dart' as k;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData cloudnetTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: color.lightPrimary,
    elevation: k.elevation,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(0),
      ),
    ),
    toolbarHeight: k.navbarHeight,
    titleTextStyle: const TextStyle(
      fontFamily: fontFamily,
      color: color.white,
      fontWeight: FontWeight.w600,
      fontSize: 24.0,
      height: 1.25,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: color.lightPrimary.shade900,
    ),
    iconTheme: const IconThemeData(color: color.blackBlack),
    actionsIconTheme: const IconThemeData(
      color: color.blackBlack,
      size: 24.0,
    ),
    // actionsIconTheme: null,
  ),
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  colorScheme: ColorScheme.fromSwatch(
      primarySwatch: color.lightPrimary,
      accentColor: color.lightSecondary.shade700),
  scaffoldBackgroundColor: color.lightGray,
  backgroundColor: color.lightGray,
  iconTheme: const IconThemeData(
    color: color.blackBlack,
    size: k.iconsSize,
  ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
    margin: k.edgeAll.medium / 2.0,
    color: color.white,
    elevation: 2.0,
    shadowColor: color.gray,
  ),
  tooltipTheme: TooltipThemeData(
    waitDuration: k.transitionDuration,
    margin: k.edgeAll.small,
    padding: k.edgeAll.small,
    showDuration: k.transitionDuration,
    decoration: ShapeDecoration(
      color: color.gray,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(k.radius.small),
        ),
      ),
    ),
  ),
  toggleButtonsTheme:
      const ToggleButtonsThemeData(selectedColor: color.lightPrimary),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0.0,
      visualDensity: VisualDensity.comfortable,
      textStyle: cloudnetText.button,
      primary: color.lightPrimary,
      backgroundColor: color.white.withOpacity(0.56),
      side: const BorderSide(color: color.lightPrimary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(k.radius.medium),
        ),
      ),
      padding: k.edgeAll.medium,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(color.lightPrimary),
      foregroundColor: MaterialStateProperty.all(color.blackBlack),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: color.lightPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: UnderlineInputBorder(),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: color.lightPrimary),
    ),
    contentPadding: EdgeInsets.all(10.0),
  ),
  textTheme: cloudnetText,
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(foregroundColor: color.blackBlack),
);

ThemeData cloudnetDarkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: color.darkPrimary,
    elevation: k.elevation,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(0),
      ),
    ),
    toolbarHeight: k.navbarHeight,
    titleTextStyle: const TextStyle(
      fontFamily: fontFamily,
      color: color.white,
      fontWeight: FontWeight.w600,
      fontSize: 24.0,
      height: 1.25,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: color.darkPrimary.shade800,
        statusBarBrightness: Brightness.dark),
    iconTheme: const IconThemeData(color: color.white),
    actionsIconTheme: const IconThemeData(
      color: color.white,
      size: 24.0,
    ),
    // actionsIconTheme: null,
  ),
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  ),
  drawerTheme: const DrawerThemeData(
      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(24.0),
    ),
  )),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: color.darkPrimary,
    accentColor: color.darkSecondary.shade800,
    brightness: Brightness.dark,
  ),
  //scaffoldBackgroundColor: color.blackBlack,
  //backgroundColor: color.blackBlack,
  iconTheme: const IconThemeData(
    color: color.white,
    size: k.iconsSize,
  ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
    margin: k.edgeAll.medium / 2.0,
    color: ThemeData.fallback().cardTheme.color,
    elevation: 2.0,
    shadowColor: color.gray,
  ),
  tooltipTheme: TooltipThemeData(
    waitDuration: k.transitionDuration,
    margin: k.edgeAll.small,
    padding: k.edgeAll.small,
    showDuration: k.transitionDuration,
    decoration: const ShapeDecoration(
      color: color.gray,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0.0,
      visualDensity: VisualDensity.comfortable,
      textStyle: cloudnetText.button,
      primary: color.darkPrimary,
      backgroundColor: color.white.withOpacity(0.56),
      side: const BorderSide(color: color.darkPrimary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(k.radius.medium),
        ),
      ),
      padding: k.edgeAll.medium,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(color.darkPrimary.shade800),
      foregroundColor: MaterialStateProperty.all(color.white),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: color.darkPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: color.darkPrimary.shade800),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: color.darkPrimary.shade800),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: color.gray),
    ),
    /*hintStyle: TextStyle(
      fontFamily: fontFamily,
      color: color.white,
      fontWeight: FontWeight.w600,
      fontSize: 12.0,
      height: 1.25,
    ),
    labelStyle: TextStyle(
      fontFamily: fontFamily,
      color: color.white,
      fontWeight: FontWeight.w600,
      fontSize: 12.0,
      height: 1.25,
    ),*/
    contentPadding: EdgeInsets.all(8.0),
  ),
  switchTheme: SwitchThemeData(
    trackColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected) ||
          states.contains(MaterialState.pressed)) {
        return color.darkPrimary.shade400;
      }
      return null;
    }),
    thumbColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected) ||
          states.contains(MaterialState.pressed)) {
        return color.darkPrimary.shade800;
      }
      return null;
    }),
  ),
  textTheme: cloudnetDarkText,
  checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(color.darkSecondary.shade800)),
);

const fontFamily = 'Inter';

const cloudnetText = TextTheme(
  headline1: TextStyle(
    fontFamily: fontFamily,
    color: color.blackBlack,
    fontWeight: FontWeight.w600,
    fontSize: 32.0,
    height: 1.25,
  ),
  headline2: TextStyle(
    fontFamily: fontFamily,
    color: color.blackBlack,
    fontWeight: FontWeight.w600,
    fontSize: 24.0,
    height: 1.25,
  ),
  headline3: TextStyle(
    fontFamily: fontFamily,
    color: color.blackBlack,
    fontWeight: FontWeight.w400,
    fontSize: 24.0,
    height: 1.25,
  ),
  headline4: TextStyle(
    fontFamily: fontFamily,
    color: color.blackBlack,
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
    height: 1.25,
  ),
  headline5: TextStyle(
    fontFamily: fontFamily,
    color: color.blackBlack,
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    height: 1.25,
  ),
  headline6: TextStyle(
    fontFamily: fontFamily,
    color: color.blackBlack,
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    height: 1.25,
  ),
  bodyText1: TextStyle(
    fontFamily: fontFamily,
    color: color.blackBlack,
    fontWeight: FontWeight.w400,
    fontSize: 20.0,
    height: 1.25,
  ),
  bodyText2: TextStyle(
    fontFamily: fontFamily,
    color: color.blackBlack,
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    height: 1.25,
  ),
  subtitle1: TextStyle(
    fontFamily: fontFamily,
    color: color.blackBlack,
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    height: 1.25,
  ),
  subtitle2: TextStyle(
    fontFamily: fontFamily,
    color: color.blackBlack,
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    height: 1.25,
  ),
  overline: TextStyle(
    fontFamily: fontFamily,
    color: color.blackBlack,
    fontWeight: FontWeight.w600,
    fontSize: 12.0,
    height: 1.25,
  ),
  caption: TextStyle(
    fontFamily: fontFamily,
    color: color.blackBlack,
    fontWeight: FontWeight.w600,
    fontSize: 12.0,
    height: 1.25,
  ),
  button: TextStyle(
    fontFamily: fontFamily,
    color: color.blackBlack,
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    height: 1.25,
  ),
);
const cloudnetDarkText = TextTheme(
  headline1: TextStyle(
    fontFamily: fontFamily,
    color: color.white,
    fontWeight: FontWeight.w600,
    fontSize: 32.0,
    height: 1.25,
  ),
  headline2: TextStyle(
    fontFamily: fontFamily,
    color: color.white,
    fontWeight: FontWeight.w600,
    fontSize: 24.0,
    height: 1.25,
  ),
  headline3: TextStyle(
    fontFamily: fontFamily,
    color: color.white,
    fontWeight: FontWeight.w400,
    fontSize: 24.0,
    height: 1.25,
  ),
  headline4: TextStyle(
    fontFamily: fontFamily,
    color: color.white,
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
    height: 1.25,
  ),
  headline5: TextStyle(
      fontFamily: fontFamily,
      color: color.white,
      fontWeight: FontWeight.w600,
      fontSize: 16.0,
      height: 1.25,
      overflow: TextOverflow.clip),
  headline6: TextStyle(
    fontFamily: fontFamily,
    color: color.white,
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    height: 1.25,
  ),
  bodyText1: TextStyle(
    fontFamily: fontFamily,
    color: color.white,
    fontWeight: FontWeight.w400,
    fontSize: 20.0,
    height: 1.25,
  ),
  bodyText2: TextStyle(
    fontFamily: fontFamily,
    color: color.white,
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    height: 1.25,
  ),
  subtitle1: TextStyle(
    fontFamily: fontFamily,
    color: color.white,
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    height: 1.25,
  ),
  subtitle2: TextStyle(
    fontFamily: fontFamily,
    color: color.white,
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    height: 1.25,
  ),
  overline: TextStyle(
    fontFamily: fontFamily,
    color: color.white,
    fontWeight: FontWeight.w600,
    fontSize: 12.0,
    height: 1.25,
  ),
  caption: TextStyle(
    fontFamily: fontFamily,
    color: color.white,
    fontWeight: FontWeight.w600,
    fontSize: 12.0,
    height: 1.25,
  ),
  button: TextStyle(
    fontFamily: fontFamily,
    color: color.white,
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    height: 1.25,
  ),
);
