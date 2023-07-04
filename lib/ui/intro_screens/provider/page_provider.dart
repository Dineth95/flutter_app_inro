import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageProvider with ChangeNotifier, DiagnosticableTreeMixin {
  double? _page = 0;

  bool? isFresher;
  bool? isLoading;

  double? get page => _page;
  late final SharedPreferences prefs;

  PageProvider() {
    checkFresher();
    notifyListeners();
  }

  void scrollPage(double? currentPage) {
    _page = currentPage;
    notifyListeners();
  }

  checkFresher() async {
    isLoading = true;
    notifyListeners();
    prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isFresher') ?? true) {
      isFresher = true;
    } else {
      isFresher = false;
    }
    isLoading = false;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}
