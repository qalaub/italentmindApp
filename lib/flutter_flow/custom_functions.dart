import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

LatLng? changeUbication(LatLng ubication) {
  // Radio de la Tierra en metros
  const double earthRadius = 6371000;
  const int meters = 10;
  // Calcular el cambi  o en latitud
  double deltaLatitude = meters / earthRadius;
  // Convertir de radianes a grados
  double newLatitude = ubication.latitude + (deltaLatitude * 180 / math.pi);
  // Calcular el cambio en longitud
  double deltaLongitude =
      meters / (earthRadius * math.cos(math.pi * ubication.latitude / 180));
  // Convertir de radianes a grados
  double newLongitude = ubication.longitude + (deltaLongitude * 180 / math.pi);
  return new LatLng(newLatitude, newLongitude);
}

String? fileToStringPath(FFUploadedFile? image) {
  if (image == null) {
    return null;
  }
  return image.name;
}

String verifyImageIsSet(String image) {
  return image;
}

String handlePhone(String phone) {
  if (!phone.startsWith("04")) {
    phone = "04" + phone;
  }
  return phone;
}

bool verifyCorrectPassword(String password) {
  RegExp regex = RegExp(
      r'^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,50}$');
  return regex.hasMatch(password);
}

String? contactTextAdd(String? name) {
  return "Contact $name";
}

String? concatStrings(
  String? str1,
  String? str2,
  String? space,
) {
  // concat two strings parameters
  // Use the space parameter if it is not null, otherwise use a space
  String separator = space ?? ' ';
  return str1 == null || str2 == null ? null : '$str1$separator$str2';
}

String generateRandomCode() {
  final random = math.Random();
  final letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ12';
  final codeLength = 15;
  final codeUnits = List.generate(
    codeLength,
    (index) => letters.codeUnitAt(random.nextInt(letters.length)),
  );
  return String.fromCharCodes(codeUnits);
}

bool isOdd(int number) {
  if (number % 2 != 0) return true;
  return false;
}

int addDays(
  int seconds,
  int daysToAdd,
) {
  /// Convertir los segundos a DateTime
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(seconds * 1000);

  /// Agregar los días especificados
  DateTime newDateTime = dateTime.add(Duration(days: daysToAdd));

  /// Convertir de nuevo a segundos
  return newDateTime.millisecondsSinceEpoch ~/ 1000;
}

int getRestantDays(
  DateTime dateStart,
  int days,
) {
  // Fecha actual
  DateTime currentDate = DateTime.now();

  // Fecha de finalización de la membresía
  DateTime endDate = dateStart.add(Duration(days: days));

  // Calcular la diferencia en días
  int remainingDays = endDate.difference(currentDate).inDays;

  // Si los días restantes son negativos, devolver 0 (la membresía ya expiró)
  return remainingDays > 0 ? remainingDays : 0;
}

LatLng stringToLatLng(String ubication) {
  // Dividimos la cadena usando la coma como delimitador.
  List<String> parts = ubication.split(',');

  // Convertimos las partes en valores numéricos.
  double latitude = double.parse(parts[0].trim());
  double longitude = double.parse(parts[1].trim());

  // Creamos y retornamos el objeto LatLng.
  return LatLng(latitude, longitude);
}

String generateBodyForEmail(
  String user1,
  String user2,
  String reason,
) {
  return '$user1 has reported $user2 for the following reason: $reason.';
}

int plusOne(double n) {
  return (n + 1).toInt();
}

DateTime convertStringToDate(String dateStr) {
  List<String> dateParts = dateStr.split('/');
  int day = int.parse(dateParts[0]);
  int month = int.parse(dateParts[1]);
  int year = int.parse(dateParts[2]);

  return DateTime(year, month, day);
}

String suguestionPlan(
  bool firts,
  bool second,
  bool tree,
  bool four,
) {
  if (firts) 'Premiun';
  if (firts && tree) return 'Premiun';
  if (second && four) return 'Standar';
  if (four) return 'Standar';
  if (second) return 'Standar';
  if (tree) 'Premiun';
  return 'Basic';
}

String emptyString() {
  return "";
}

int restOne(int index) {
  return index - 1;
}

int averagueReviews(List<ReviewsRecord> reviews) {
  // averague of Reviews from colletion reviews
  if (reviews.isEmpty) {
    return 0;
  }
  int sum = 0;
  for (final review in reviews) {
    sum += review.num;
  }
  return (sum / reviews.length).round();
}

bool? validateDate(String dateString) {
  try {
    final format = RegExp(r'(\d{2})/(\d{2})/(\d{4})');
    final match = format.firstMatch(dateString);

    if (match == null) {
      throw FormatException(); // El formato no coincide
    }

    final day = int.parse(match.group(1)!);
    final month = int.parse(match.group(2)!);
    final year = int.parse(match.group(3)!);

    final birthDate = DateTime(year, month, day);
    final now = DateTime.now();
    final adulthoodDate = DateTime(now.year - 18, now.month, now.day);

    if (birthDate.isBefore(adulthoodDate)) {
      return true; // La persona es mayor de edad
    } else {
      // Mensaje de error corto
      print('Must be 18+ years old.');
      return false; // La persona no es mayor de edad
    }
  } catch (e) {
    return false; // Cambié a `false` para manejar casos de error de formato
  }
}

bool verifyDistanceFilter(
  String? current,
  LatLng user,
  int zoom,
) {
  if (current == null || user.toString().isEmpty) {
    return true;
  }
  // Función para convertir grados a radianes
  double _degreesToRadians(double degrees) {
    return degrees * math.pi / 180;
  }

  // Función para calcular la distancia entre dos puntos en la superficie de una esfera
  double _calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const double radius = 6371; // Radio de la Tierra en kilómetros
    final double dLat = _degreesToRadians(lat2 - lat1);
    final double dLon = _degreesToRadians(lon2 - lon1);
    final double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_degreesToRadians(lat1)) *
            math.cos(_degreesToRadians(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return radius * c * 1000; // Convertir a metros
  }

  // Parsear el string current para obtener latitud y longitud
  final parts = current.split(',');
  if (parts.length != 2) {
    return true;
  }
  final double currentLat = double.tryParse(parts[0]) ?? 0.0;
  final double currentLng = double.tryParse(parts[1]) ?? 0.0;

  // Calcular la distancia usando la fórmula de Haversine
  final double distance = _calculateDistance(
    currentLat,
    currentLng,
    user.latitude,
    user.longitude,
  );

  const double base = 2;

  // Evita que el zoom sea menor a 10 y ajusta el crecimiento
  double adjustedZoom = zoom - 100;
  if (adjustedZoom <= 0) {
    adjustedZoom = 5;
  }
  if (adjustedZoom == 150) adjustedZoom = 1000;
  double multiplier = 1000.0 * (adjustedZoom * 1.8);
  return distance <=
      ((multiplier) * (math.log(adjustedZoom + 20) / math.log(base + 2)))
          .toInt();

  // Retornar true si la distancia es menor o igual a 100 metros
  // return distance <= (zoom / 10) * 100000; // 100 metros
}

bool filterProfessionals(
  UsersRecord user,
  double distance,
  List<String> services,
  List<String> age,
  LatLng current,
  List<String> schedule,
) {
// Calcular la distancia entre la ubicación del usuario y la ubicación del profesional
  const double earthRadius = 6371; // Radio de la Tierra en kilómetros
  double dLat =
      (user.suburb!.latitude - current.latitude) * (3.141592653589793 / 180);
  double dLon =
      (user.suburb!.longitude - current.longitude) * (3.141592653589793 / 180);

  double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(current.latitude * (3.141592653589793 / 180)) *
          math.cos(user.suburb!.latitude * (3.141592653589793 / 180)) *
          math.sin(dLon / 2) *
          math.sin(dLon / 2);
  double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  double userDistance = earthRadius * c; // Distancia en kilómetros

  // Verificar si la distancia es aceptable
  if (userDistance > distance) {
    return false;
  }

  // Verificar si los servicios ofrecidos están en la lista de servicios deseados
  bool hasValidServices =
      user.serviceType.any((service) => services.contains(service));
  if (!hasValidServices) {
    return false;
  }

  // Verificar si la edad del profesional está en el rango aceptable
  bool hasValidAge = age.contains(user.age);
  if (!hasValidAge) {
    return false;
  }

  // Verificar si el horario del profesional coincide con alguno de los días deseados
  bool hasValidSchedule = user.schedule.any((day) => schedule.contains(day));
  if (user.schedule.length > 0) if (!hasValidSchedule) {
    return false;
  }

  return true;
}

String upperCaseFirstLetter(String word) {
  if (word.isEmpty) {
    return '';
  }

  List<String> words = word.split(' ');
  List<String> capitalizedWords = [];

  for (String w in words) {
    if (w.isNotEmpty) {
      // Capitaliza la primera letra y concatena el resto en minúsculas
      String capitalizedWord =
          w[0].toUpperCase() + w.substring(1).toLowerCase();
      capitalizedWords.add(capitalizedWord);
    } else {
      capitalizedWords.add(w); // Para manejar palabras vacías
    }
  }

  return capitalizedWords.length > 1
      ? capitalizedWords.join(' ')
      : capitalizedWords[0];
}

int getLengthString(String str) {
  // get Length String
  return str.length;
}

String latLngToString(LatLng latlng) {
  return '${latlng.latitude}, ${latlng.longitude}';
}

String formatnameStreet(String input) {
  // Encontrar el índice del primer espacio
  int spaceIndex = input.indexOf(' ');

  // Si encontramos un espacio
  if (spaceIndex != -1) {
    // Obtener la subcadena desde el primer espacio hasta la coma (o el final si no hay coma)
    String address =
        input.substring(spaceIndex + 1); // Cortamos desde el primer espacio
    int commaIndex = address.indexOf(',');

    // Si hay una coma, cortamos hasta la coma; de lo contrario, devolvemos la cadena completa
    if (commaIndex != -1) {
      return address.substring(0, commaIndex).trim(); // Cortamos hasta la coma
    } else {
      return address.trim(); // Devolvemos la dirección completa si no hay coma
    }
  } else {
    return "Location"; // Manejo de caso si no hay espacio
  }
}

String extractStateAndPostalCode(String input) {
  // Encontrar la posición de la primera y segunda coma
  int firstCommaIndex = input.indexOf(',');
  int secondCommaIndex = input.indexOf(',', firstCommaIndex + 1);

  // Verificar si encontramos ambas comas
  if (firstCommaIndex != -1 && secondCommaIndex != -1) {
    // Obtener la subcadena entre la segunda coma y el final
    String statePostalCode = input.substring(secondCommaIndex + 1).trim();

    // Verificar si hay al menos dos espacios antes del estado
    if (statePostalCode.startsWith(' ')) {
      // Retornar la parte de "estado código postal"
      return statePostalCode
          .substring(2)
          .trim(); // Cortar los dos espacios y devolver el resto
    }
  }

  return "NSW 2781"; // Manejo de caso si no se cumplen las condiciones
}
