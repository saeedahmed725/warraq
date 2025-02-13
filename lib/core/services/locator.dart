import 'package:get_it/get_it.dart';
import 'package:warraq/core/services/connectivity.dart';

class ServiceLocator {
  static final GetIt _getIt = GetIt.instance;

  // Track the usage count of registered services
  static final Map<Type, int> _usageCount = {};

  // Increment usage count for a type
  static void _incrementUsage<T>() {
    _usageCount[T] = (_usageCount[T] ?? 0) + 1;
  }

  // Decrement usage count for a type
  static void release<T extends Object>() {
    if (_usageCount[T] != null) {
      _usageCount[T] = (_usageCount[T] ?? 1) - 1;
      // If usage count is 0, unregister the service
      if (_usageCount[T] == 0) {
        _getIt.unregister<T>();
        _usageCount.remove(T);
      }
    }
  }

  // Register singletons
  static void setup() {
    _register<NetworkController>(NetworkController.instance);
  }

  // Private method to register services and initialize usage count
  static void _register<T extends Object>(T instance) {
    _getIt.registerSingleton<T>(instance);
    _usageCount[T] = 0; // Initialize usage count
  }

  // Accessor for NetworkController
  static NetworkController get networkController {
    _incrementUsage<NetworkController>();
    return _getIt<NetworkController>();
  }
}
