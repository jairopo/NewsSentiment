import 'package:flutter/material.dart';

/// Class with utility functions that can be used in any part of the app
class Utilities {
  /// Devuelve un SnackBar con el mensaje proporcionado y un color de fondo
  /// según si es un error (rojo) o no (gris)
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      BuildContext context, String message, bool error) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor:
            error ? Theme.of(context).colorScheme.error : Colors.grey[800],
      ),
    );
  }
}
