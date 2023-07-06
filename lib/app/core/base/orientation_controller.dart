import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../routes/app_pages.dart';

enum ScreenOrientation {
  portraitOnly,
  landscapeOnly,
  rotating,
}

void _setOrientation(ScreenOrientation orientation) {
  List<DeviceOrientation> orientations;
  switch (orientation) {
    case ScreenOrientation.portraitOnly:
      orientations = [
        DeviceOrientation.portraitUp,
      ];
      break;
    case ScreenOrientation.landscapeOnly:
      orientations = [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ];
      break;
    case ScreenOrientation.rotating:
      orientations = [
        DeviceOrientation.portraitUp,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ];
      break;
  }
  SystemChrome.setPreferredOrientations(orientations);
}


class NavigatorObserverWithOrientation extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    _checkRouteOrientation(previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _checkRouteOrientation(route);

  }

  _checkRouteOrientation(Route? route) {
    if (route == null)  {
      _setOrientation(ScreenOrientation.portraitOnly);
      return;
    }
    switch (route.settings.name) {
      // case Routes.MAIN:
      //   _setOrientation(ScreenOrientation.landscapeOnly);
      //   break;
      default:
        _setOrientation(ScreenOrientation.portraitOnly);
        break;
    }
  }
}