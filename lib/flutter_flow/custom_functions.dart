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
  String lan,
) {
  if (firts) return lan == 'en' ? 'Premiun' : 'Premiun';
  if (firts && tree) return lan == 'en' ? 'Premiun' : 'Premiun';
  if (second && four) return lan == 'en' ? 'Standar' : 'Estandar';
  if (four) return lan == 'en' ? 'Standar' : 'Estandar';
  if (second) return lan == 'en' ? 'Standar' : 'Estandar';
  if (tree) return lan == 'en' ? 'Premiun' : 'Premiun';
  return lan == 'en' ? 'Basic' : 'Basico';
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
    final maxAgeDate = DateTime(now.year - 125, now.month, now.day);

    if (birthDate.isBefore(adulthoodDate) && birthDate.isAfter(maxAgeDate)) {
      return true; // La persona es mayor de edad y menor de 200 años
    } else if (birthDate.isBefore(maxAgeDate)) {
      return false;
    } else {
      return false; // La persona no es mayor de edad
    }
  } catch (e) {
    return false; // Manejo de error de formato
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
  bool isFilter,
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
    if (isFilter) return false;
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

  // Mapa de traducción de días de la semana
  const Map<String, String> dayTranslations = {
    'lunes': 'Monday',
    'martes': 'Tuesday',
    'miércoles': 'Wednesday',
    'jueves': 'Thursday',
    'viernes': 'Friday',
    'sábado': 'Saturday',
    'domingo': 'Sunday',
    'mon': 'Monday',
    'tue': 'Tuesday',
    'wed': 'Wednesday',
    'thu': 'Thursday',
    'fri': 'Friday',
    'sat': 'Saturday',
    'sun': 'Sunday',
  };

  // Traducir días de user.schedule a inglés, manteniendo la primera letra en mayúscula
  List<String> translatedSchedule = user.schedule.map((day) {
    String lowerDay = day.toLowerCase();
    return dayTranslations[lowerDay] ??
        day; // Retorna la traducción o el día original
  }).toList();

  // Verificar si el horario del profesional coincide con alguno de los días deseados
  bool hasValidSchedule =
      translatedSchedule.any((day) => schedule.contains(day));
  if (user.schedule.isNotEmpty && !hasValidSchedule) {
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

String changeServiceLanguge(
  String service,
  String languageCode,
) {
// Mapa de traducción de servicios (bidireccional: español e inglés)
  final Map<String, Map<String, String>> serviceTranslations = {
    'Trabajadores de apoyo': {
      'en': 'Support Workers',
      'es': 'Trabajadores de apoyo'
    },
    'Support Workers': {'en': 'Support Workers', 'es': 'Trabajadores de apoyo'},
    'Mantenimiento del hogar': {
      'en': 'Home Maintenance',
      'es': 'Mantenimiento del hogar'
    },
    'Home Maintenance': {
      'en': 'Home Maintenance',
      'es': 'Mantenimiento del hogar'
    },
    'Apoyos terapéuticos': {
      'en': 'Therapeutic Supports',
      'es': 'Apoyos terapéuticos'
    },
    'Therapeutic Supports': {
      'en': 'Therapeutic Supports',
      'es': 'Apoyos terapéuticos'
    },
    'Entrenadores de recuperación': {
      'en': 'Recovery Coaches',
      'es': 'Entrenadores de recuperación'
    },
    'Recovery Coaches': {
      'en': 'Recovery Coaches',
      'es': 'Entrenadores de recuperación'
    },
    'Coordinadores de apoyo': {
      'en': 'Support Coordinators',
      'es': 'Coordinadores de apoyo'
    },
    'Support Coordinators': {
      'en': 'Support Coordinators',
      'es': 'Coordinadores de apoyo'
    },
  };

  // Retorna la traducción o el texto original si no hay coincidencia
  return serviceTranslations[service]?[languageCode] ?? service;
}

String transformTextUpper(String text) {
// Transform text to Upper case first letter in each word
  if (text.isEmpty) return ''; // Manejo del texto vacío

  List<String> words = text.split(' ');
  List<String> transformedWords = [];

  for (String word in words) {
    if (word.isNotEmpty) {
      // Asegurarse de que la palabra no esté vacía
      String firstLetter =
          word[0].toUpperCase(); // Usar word[0] para la primera letra
      String restOfWord = word.length > 1
          ? word.substring(1).toLowerCase()
          : ''; // Manejo de palabras de un solo carácter
      String transformedWord = firstLetter + restOfWord;
      transformedWords.add(transformedWord);
    } else {
      transformedWords
          .add(word); // Si la palabra está vacía, agregarla tal cual
    }
  }

  return transformedWords.join(' ');
}

bool validateFormatDate(String dateString) {
  try {
    final format = RegExp(r'^(\d{2})/(\d{2})/(\d{4})$');
    final match = format.firstMatch(dateString);

    if (match == null) {
      return false; // El formato no coincide
    }

    final day = int.parse(match.group(1)!);
    final month = int.parse(match.group(2)!);
    final year = int.parse(match.group(3)!);

    // Verificar que el día esté entre 1 y 31 y el mes entre 1 y 12
    if (day < 1 || day > 31 || month < 1 || month > 12) {
      return false;
    }

    // No validamos la edad ni la existencia de la fecha exacta
    return true; // La fecha tiene un formato válido y los días/meses están en el rango correcto
  } catch (e) {
    return false; // Manejo de error de formato
  }
}

String changeAge(
  String ageRange,
  String languageCode,
) {
  // Mapa de traducción de categorías de edad (bidireccional: español e inglés)
  final Map<String, Map<String, String>> ageCategoryTranslations = {
    '18-25 years': {
      'en': 'Young',
      'es': 'Joven',
    },
    '25-40 years': {
      'en': 'Adult',
      'es': 'Adulto',
    },
    '40-65+ years': {
      'en': 'Senior',
      'es': 'Mayor',
    },
    'Joven': {
      'en': 'Young',
      'es': 'Joven',
    },
    'Adulto': {
      'en': 'Adult',
      'es': 'Adulto',
    },
    'Mayor': {
      'en': 'Senior',
      'es': 'Mayor',
    },
  };

  // Retorna la traducción o el texto original si no hay coincidencia
  return ageCategoryTranslations[ageRange]?[languageCode] ?? ageRange;
}

String getTranslateDay(
  String day,
  String language,
) {
  Map<String, Map<String, String>> translations = {
    'Monday': {'es': 'Lunes'},
    'Tuesday': {'es': 'Martes'},
    'Wednesday': {'es': 'Miércoles'},
    'Thursday': {'es': 'Jueves'},
    'Friday': {'es': 'Viernes'},
    'Saturday': {'es': 'Sábado'},
    'Sunday': {'es': 'Domingo'},
    'Lunes': {'en': 'Monday'},
    'Martes': {'en': 'Tuesday'},
    'Miércoles': {'en': 'Wednesday'},
    'Jueves': {'en': 'Thursday'},
    'Viernes': {'en': 'Friday'},
    'Sábado': {'en': 'Saturday'},
    'Domingo': {'en': 'Sunday'},
  };

  return translations[day]?[language] ?? day;
}
