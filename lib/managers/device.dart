import 'package:flutter/material.dart';

bool _alreadySetup = false;

Future<void> _linkDevice() async {
  // await locator.get<DeviceService>().linkDevice();
}

///
/// Setup device will be basically front
/// for handling notifications and
/// dynamic links.
///
///

Future<void> setupDevice(BuildContext context) async {
  _linkDevice();

  ///
  /// Reconfiguring dynamic links will make them call multiple times
  ///
  if (_alreadySetup) {
    return;
  }
  _setupNotifications(context);
  _setupDynamicLink(context);
  _alreadySetup = true;
}

Future<void> _setupNotifications(BuildContext context) async {

}

Future<void> _setupDynamicLink(BuildContext context) async {

}
