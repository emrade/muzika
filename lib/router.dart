import 'package:flutter/material.dart';
import 'package:muzika/views/home/home.dart';
import 'package:muzika/views/list/list.dart';

const String homeViewRoute = '/';
const String listViewRoute = 'list';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeViewRoute:
      return MaterialPageRoute(builder: (_) => HomePage());
    case listViewRoute:
      return MaterialPageRoute(builder: (_) => ListPage());
      break;
    default:
      return MaterialPageRoute(builder: (_)  => HomePage());
  }
}
