import 'package:flutter_architecture/locator.dart';
import 'package:flutter_architecture/routing/route_names.dart';
import 'package:flutter_architecture/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class StartupViewModel extends BaseViewModel {
  goToHomeView() {
    locator<NavigationService>().navigateTo(homeRoute);
  }
}
