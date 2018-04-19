import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home.dart';
import 'login.dart';
import 'notched_corner_border.dart';
import 'supplemental/theming.dart';

class ShrineApp extends StatelessWidget {
  ThemeData _customTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      accentColor: kShrineBrown900,
      primaryColor: kShrinePink100,
      buttonColor: kShrinePink100,
      scaffoldBackgroundColor: kShrineBackgroundWhite,
      cardColor: kShrineBackgroundWhite,
      textSelectionColor: kShrinePink100,
      errorColor: kShrineErrorRed,
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.accent,
      ),
      textTheme: _customTextTheme(theme.textTheme),
      primaryTextTheme: _customTextTheme(theme.primaryTextTheme),
      primaryIconTheme: _customIconTheme(theme.primaryIconTheme),
      inputDecorationTheme:
          new InputDecorationTheme(border: new NotchedCornerBorder()),
    );
  }

  IconThemeData _customIconTheme(IconThemeData original) {
    return original.copyWith(color: kShrineBrown900);
  }

  TextTheme _customTextTheme(TextTheme original) {
    const String rubik = 'Rubik';

    return original
        .copyWith(
          display4: original.display4.copyWith(fontFamily: rubik),
          display3: original.display3.copyWith(fontFamily: rubik),
          display2: original.display2.copyWith(fontFamily: rubik),
          display1: original.display1.copyWith(fontFamily: rubik),
          headline: original.headline.copyWith(
            fontFamily: rubik,
            fontWeight: FontWeight.w500,
          ),
          title: original.title.copyWith(fontFamily: rubik, fontSize: 18.0),
          subhead: original.subhead.copyWith(fontFamily: rubik),
          caption: original.caption.copyWith(
            fontFamily: rubik,
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
          button: original.button.copyWith(fontFamily: rubik),
        )
        .apply(
          displayColor: kShrineBrown900,
          bodyColor: kShrineBrown900,
        );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return MaterialApp(
      title: 'Shrine',
      home: new HomePage(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      theme: _customTheme(context),
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name == '/login') {
      return new MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => new LoginPage(),
        fullscreenDialog: true,
      );
    }

    return null;
  }
}
