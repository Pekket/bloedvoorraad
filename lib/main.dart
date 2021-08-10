import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'constants.dart' as Constants;

import '../screen/blood_overview.dart';
import '../screen/family_overview.dart';
import '../screen/settings.dart';
import '../screen/user_profile.dart';
import '../user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  UserProvider userProvider = UserProvider();
  await userProvider.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
      (value) => runApp(ChangeNotifierProvider(
          create: (BuildContext context) => userProvider,
          lazy: false,
          child: App())));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Provider.of<UserProvider>(context).locale,
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
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
        FamilyOverview.id: (context) => FamilyOverview(),
        AppSettings.id: (context) => AppSettings(),
      },
    );
  }
}
