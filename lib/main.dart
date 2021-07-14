import 'package:bloedvoorraad/service/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../screen/blood_overview.dart';
import '../screen/user_profile.dart';
import 'constants.dart' as Constants;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloedvoorraad',
      theme: ThemeData(
        primarySwatch: Constants.PRIMARY_COLOR,
        primaryTextTheme: TextTheme(
          headline6: TextStyle(color: Constants.PRIMARY_COLOR),
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
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
