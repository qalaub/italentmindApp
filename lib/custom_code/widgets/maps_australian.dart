// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:italentmind/v2/user/profile_info/profile_info_widget.dart';

import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;
import 'dart:math' as math;
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;

class MapsAustralian extends StatefulWidget {
  const MapsAustralian({
    super.key,
    this.width,
    this.height,
    this.current,
    this.markers,
    this.distance,
    this.markersImage,
    this.newUbication,
    this.age,
    this.service,
    this.language,
    this.isProfessional,
    this.schedule,
  });

  final double? width;
  final double? height;
  final LatLng? current;
  final List<UsersRecord>? markers;
  final double? distance;
  final String? markersImage;
  final String? newUbication;
  final List<String>? age;
  final List<String>? service;
  final String? language;
  final bool? isProfessional;
  final List<String>? schedule;

  @override
  State<MapsAustralian> createState() => _MapsAustralianState();
}

class _MapsAustralianState extends State<MapsAustralian> {
  google_maps.GoogleMapController? mapController;
  google_maps.BitmapDescriptor? userMarkerIcon;
  google_maps.BitmapDescriptor? currentLocationMarkerIcon;
  ValueNotifier<LatLng?> newUbicationNotifier = ValueNotifier(null);

  // Variable para controlar si es la primera carga
  bool isFirstLoad = true;

  double? _lastZoom;

  @override
  void initState() {
    super.initState();
    _loadCustomMarkers();

    if (widget.newUbication != null) {
      newUbicationNotifier.value = _parseLatLng(widget.newUbication!);
    }

    newUbicationNotifier.addListener(() {
      if (newUbicationNotifier.value != null && mapController != null) {
        mapController!.animateCamera(
          google_maps.CameraUpdate.newCameraPosition(
            google_maps.CameraPosition(
              target: google_maps.LatLng(
                newUbicationNotifier.value!.latitude,
                newUbicationNotifier.value!.longitude,
              ),
              zoom: 14,
            ),
          ),
        );
      }
    });
  }

  @override
  void didUpdateWidget(covariant MapsAustralian oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.newUbication != oldWidget.newUbication) {
      newUbicationNotifier.value = _parseLatLng(widget.newUbication!);
    }
  }

  LatLng _parseLatLng(String latLngString) {
    final parts = latLngString.split(',');
    final latitude = double.parse(parts[0]);
    final longitude = double.parse(parts[1]);
    return LatLng(latitude, longitude);
  }

  Future<void> _loadCustomMarkers() async {
    if (widget.markersImage != null) {
      final markerIcon = await _buildMarkerIcon(widget.markersImage!, 100);
      setState(() {
        userMarkerIcon = markerIcon;
      });
    } else {
      setState(() {
        userMarkerIcon = google_maps.BitmapDescriptor.defaultMarker;
      });
    }

    final currentLocationImageUrl =
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/evrj8rjucpf8/currentMarker.png';
    final currentLocationMarkerIcon =
        await _buildMarkerIcon(currentLocationImageUrl, 100);

    setState(() {
      this.currentLocationMarkerIcon = currentLocationMarkerIcon;
    });
  }

  Future<google_maps.BitmapDescriptor> _buildMarkerIcon(
      String pathImage, double size) async {
    try {
      final Uint8List bytes;

      if (pathImage.startsWith('http://') || pathImage.startsWith('https://')) {
        final response = await http.get(Uri.parse(pathImage));
        if (response.statusCode == 200) {
          bytes = response.bodyBytes;
        } else {
          throw Exception(
              'Failed to load image. Status code: ${response.statusCode}');
        }
      } else {
        final ByteData data = await rootBundle.load(pathImage);
        bytes = data.buffer.asUint8List();
      }

      final image = img.decodeImage(Uint8List.fromList(bytes))!;
      final resizedImage = img.copyResize(image, width: 55, height: 80);

      final Uint8List resizedBytes =
          Uint8List.fromList(img.encodePng(resizedImage));

      return google_maps.BitmapDescriptor.fromBytes(resizedBytes);
    } catch (e) {
      print('Error loading marker image: $e');
      return google_maps.BitmapDescriptor.defaultMarker;
    }
  }

  final google_maps.LatLngBounds usaBounds = google_maps.LatLngBounds(
    southwest:
        google_maps.LatLng(24.396308, -125.0), // Extremo suroeste (Hawái)
    northeast:
        google_maps.LatLng(49.384358, -66.93457), // Extremo noreste (Maine)
  );

  double _calculateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    const double radius = 6371;
    final double dLat = _degreesToRadians(lat2 - lat1);
    final double dLon = _degreesToRadians(lon2 - lon1);
    final double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_degreesToRadians(lat1)) *
            math.cos(_degreesToRadians(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return radius * c;
  }

  double _degreesToRadians(double degrees) {
    return degrees * math.pi / 180;
  }

// Función para aplicar filtros
  bool _applyFilters(UsersRecord user) {
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

    // Si es la primera carga, no aplicar filtros
    if (isFirstLoad) {
      return true;
    }

    // Verifica si el usuario cumple con los filtros de edad
    bool ageMatch = widget.age == null ||
        widget.age!.isEmpty ||
        widget.age!.contains(user.age ?? '');

    // Verifica si el usuario cumple con los filtros de servicio
    bool serviceMatch = widget.service == null ||
        widget.service!.isEmpty ||
        user.serviceType.any((service) => widget.service!.contains(service));

    // Traduce el horario del usuario a inglés antes de comparar
    List<String> translatedSchedule = user.schedule.map((day) {
      String lowerDay = day.toLowerCase();
      return dayTranslations[lowerDay] ??
          day; // Retorna la traducción o el día original
    }).toList();

    // Verifica si el usuario tiene algún día en común con el horario especificado
    bool scheduleMatch = widget.schedule == null ||
        widget.schedule!.isEmpty ||
        translatedSchedule.any((day) => widget.schedule!.contains(day));

    // Si el usuario es profesional, no se aplican los filtros
    if (widget.isProfessional == true) {
      return true;
    }

    // Retorna verdadero si cumple con alguno de los filtros
    return ageMatch || serviceMatch || scheduleMatch;
  }

  void navigateToProfileInfo(UsersRecord user) {
    if (widget.isProfessional != true) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProfileInfoWidget(
                    professional: user.reference,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    final Set<google_maps.Marker> markers = {};

    if (widget.current != null) {
      markers.add(
        google_maps.Marker(
          markerId: google_maps.MarkerId('currentLocation'),
          position: google_maps.LatLng(
            widget.current!.latitude,
            widget.current!.longitude,
          ),
          icon: currentLocationMarkerIcon ??
              google_maps.BitmapDescriptor.defaultMarkerWithHue(
                  google_maps.BitmapDescriptor.hueGreen),
        ),
      );
    }

    // Agrega los marcadores de los usuarios
    if (widget.markers != null) {
      for (UsersRecord user in widget.markers!) {
        final LatLng? marker = user.suburb;

        // Verifica que `user.suburb` sea una ubicación válida.
        if (marker != null) {
          bool isUserMatching = _applyFilters(user);
          print(
              'Usuario ${user.uid} coincide con los filtros: $isUserMatching');

          if (isUserMatching) {
            // Agrega el marcador solo si está dentro de la distancia, si la distancia es especificada.
            if (widget.distance != null) {
              final double distance = _calculateDistance(
                widget.current!.latitude,
                widget.current!.longitude,
                marker.latitude,
                marker.longitude,
              );
              print('Distancia al usuario ${user.uid}: $distance');

              // Verifica que el marcador esté dentro del rango especificado.
              if (distance <= widget.distance!) {
                markers.add(
                  google_maps.Marker(
                    markerId: google_maps.MarkerId(user.uid),
                    position: google_maps.LatLng(
                      marker.latitude,
                      marker.longitude,
                    ),
                    icon: userMarkerIcon ??
                        google_maps.BitmapDescriptor.defaultMarkerWithHue(
                            google_maps.BitmapDescriptor.hueViolet),
                    onTap: () {
                      navigateToProfileInfo(user);
                    },
                  ),
                );
              }
            } else {
              // Si no se especifica una distancia, agrega el marcador directamente.
              markers.add(
                google_maps.Marker(
                  markerId: google_maps.MarkerId(user.uid),
                  position: google_maps.LatLng(
                    marker.latitude,
                    marker.longitude,
                  ),
                  icon: userMarkerIcon ??
                      google_maps.BitmapDescriptor.defaultMarkerWithHue(
                          google_maps.BitmapDescriptor.hueViolet),
                  onTap: () {
                    navigateToProfileInfo(user);
                  },
                ),
              );
            }
          }
        } else {
          print('El usuario ${user.uid} no tiene una ubicación válida.');
        }
      }
    }

    return Container(
      width: widget.width,
      height: widget.height,
      child: google_maps.GoogleMap(
        onMapCreated: (controller) => mapController = controller,
        markers: markers,
        initialCameraPosition: google_maps.CameraPosition(
          target: widget.current != null
              ? google_maps.LatLng(
                  widget.current!.latitude, widget.current!.longitude)
              : google_maps.LatLng(-33.8688, 151.2093), // Coordenadas de Sídney
          zoom: _lastZoom ?? 10.0,
        ),
      ),
    );
  }
}
