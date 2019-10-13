import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'router.dart' as router;
import 'theme.dart';
import 'utils/utils.dart';
import 'view_models/home_model.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeModel>.value(value: HomeModel()),
      ],
      child: MaterialApp(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: buildThemeData(),
        onGenerateRoute: router.generateRoute,
        initialRoute: router.homeViewRoute,
      ),
    );
  }
}
