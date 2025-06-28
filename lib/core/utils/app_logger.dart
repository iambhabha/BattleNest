import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class AppLogger {
  static final Logger _logger = Logger('App');

  static void init({bool isDebug = false}) {
    Logger.root.level = isDebug ? Level.ALL : Level.WARNING;

    Logger.root.onRecord.listen((record) {
      final log =
          '[${record.level.name}] ${record.time.toIso8601String()} ${record.loggerName}: ${record.message}';
      // Print to console
      debugPrint(log);

      // Optional: Send to remote server, crashlytics, or save to file here
    });
  }

  static void info(String message) => _logger.info(message);
  static void warning(String message) => _logger.warning(message);
  static void error(String message, [Object? error, StackTrace? stack]) {
    _logger.severe(message, error, stack);
  }
}
