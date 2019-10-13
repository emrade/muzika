import 'package:flutter/foundation.dart';

class HomeModel with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = "";

  // Getters
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  pageIsLoading(bool isLoadn) {
    _isLoading = isLoadn;
    notifyListeners();
  }
}
