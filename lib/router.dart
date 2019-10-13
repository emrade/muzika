import 'package:flutter/material.dart';
import 'package:muzika/views/home/home.dart';

const String homeViewRoute = '/';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeViewRoute:
      return MaterialPageRoute(builder: (_) => HomePage());
      break;
    default:
      return MaterialPageRoute(builder: (_)  => HomePage());
  }
}
