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

import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;
import 'package:http/http.dart' as http;
import 'dart:convert';

class PlaceSearch extends StatefulWidget {
  const PlaceSearch({
    super.key,
    this.width,
    this.height,
    this.onPlacePicked,
  });

  final double? width;
  final double? height;
  final Function(google_maps.LatLng)? onPlacePicked;

  @override
  State<PlaceSearch> createState() => _PlaceSearchState();
}

class _PlaceSearchState extends State<PlaceSearch> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String _errorMessage = '';
  List<dynamic> _predictions = [];
  bool _isLoading = false;

  Future<void> _searchPlace(String query) async {
    if (query.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter a location';
        _predictions = [];
        _isLoading = false;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final apiKey =
          'AIzaSyArSl-isY2tQa--YEne30YvnjTiDb6JQig'; // Reemplaza con tu clave de API real
      final url =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&key=$apiKey';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        if (json['status'] == 'OK') {
          setState(() {
            _predictions = json['predictions'];
            _errorMessage = 'Found ${_predictions.length} results';
          });
        } else {
          setState(() {
            _predictions = [];
            _errorMessage = 'No suggestions found';
          });
        }
      } else {
        setState(() {
          _predictions = [];
          _errorMessage = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _predictions = [];
        _errorMessage = 'Client exception occurred: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _selectPlace(String placeId) async {
    final apiKey =
        'AIzaSyArSl-isY2tQa--YEne30YvnjTiDb6JQig'; // Reemplaza con tu clave de API real
    final url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);

    if (json['status'] == 'OK') {
      final location = json['result']['geometry']['location'];
      final latLng = google_maps.LatLng(location['lat'], location['lng']);
      if (widget.onPlacePicked != null) {
        widget.onPlacePicked!(latLng);
      }
      setState(() {
        _errorMessage = '';
        _predictions = [];
        _controller.clear();
      });
    } else {
      setState(() {
        _errorMessage = 'Location not found';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: [
          TextField(
            controller: _controller,
            focusNode: _focusNode,
            decoration: InputDecoration(
              hintText: 'Enter a location',
            ),
            onChanged: _searchPlace,
          ),
          if (_isLoading)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CircularProgressIndicator(),
            ),
          if (_errorMessage.isNotEmpty)
            Text(
              _errorMessage,
              style: TextStyle(color: Colors.red),
            ),
          if (_predictions.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: _predictions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_predictions[index]['description']),
                    onTap: () => _selectPlace(_predictions[index]['place_id']),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
