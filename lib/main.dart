import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart' as Constants;

import '../screen/blood_overview.dart';
import '../screen/user_profile.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rode kruis',
      theme: ThemeData(
        primarySwatch: Constants.PRIMARY_COLOR,
        primaryTextTheme: TextTheme(
          headline6: TextStyle(color: Constants.PRIMARY_COLOR),
        ),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Constants.PRIMARY_COLOR),
          backgroundColor: Constants.BACKGROUND_COLOR,
        ),
      ),
      home: BloodTypesOverview(),
      routes: {
        BloodTypesOverview.id: (context) => BloodTypesOverview(),
        UserProfile.id: (context) => UserProfile(),
      },
    );
  }
}
