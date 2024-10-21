// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';

bool verifySizeVideo(FFUploadedFile video) {
  // Define el tamaño mínimo y máximo (en bytes)
  const int minSize = 1 * 1024 * 1024; // 1 MB
  const int maxSize = 100 * 1024 * 1024; // 100 MB

  try {
    // Obtén los datos del archivo como `Uint8List`
    final Uint8List? fileBytes = video.bytes;

    // Verifica si `fileBytes` es nulo
    if (fileBytes == null) {
      return false;
    }

    // Obtén el tamaño del archivo en bytes
    final int size = fileBytes.lengthInBytes;

    // Verifica si el tamaño está dentro del rango permitido
    return size >= minSize && size <= maxSize;
  } catch (e) {
    // Maneja excepciones, como si `video.bytes` no está disponible
    print('Error: ${e.toString()}');
    return false;
  }
}
