import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_flux/flutter_flux.dart';

/// Workaround for flutter_flux implementation when state class is dealing
/// with store.
///
/// The widget then should be like regulare StateWidget, delegating build
/// method to State class. StoreWatcher works like this, but has issue where
/// that requires you to have concrete implementation of build and initStores
/// methods, even though they are not used and we only need createState method.

abstract class StatelessStoreWidget extends StoreWatcher {

  @override
  Widget build(BuildContext context, Map<StoreToken, Store> stores) {
    // This shouldn't be called if setState is implemented
    throw new Exception("Implement setState method in your widget");
  }

  @override
  void initStores(ListenToStore listenToStore) {
    // This shouldn't be called if setState is implemented
    throw new Exception("Implement setState method in your widget");
  }


}