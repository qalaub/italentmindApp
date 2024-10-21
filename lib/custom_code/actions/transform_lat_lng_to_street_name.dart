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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:geocoding/geocoding.dart';

Future<String> transformLatLngToStreetName(LatLng suburb) async {
  /// MODIFY CODE ONLY BELOW THIS LINE
  try {
    // Obtenemos los detalles del lugar basado en las coordenadas
    List<Placemark> placemarks = await placemarkFromCoordinates(
      suburb.toGeoPoint().latitude,
      suburb.toGeoPoint().longitude,
    );

    // Verificamos si obtenemos resultados
    if (placemarks.isNotEmpty) {
      // Obtenemos la primera ubicación encontrada
      Placemark place = placemarks.first;

      // Retornamos el nombre de la calle
      return place.street ?? "Street name not found";
    } else {
      return "No street name found for the given coordinates.";
    }
  } catch (e) {
    return "Error while retrieving street name: $e";
  }

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
