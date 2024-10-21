import 'dart:convert';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetSuggestionMapCall {
  static Future<ApiCallResponse> call({
    String? api = 'AIzaSyArSl-isY2tQa--YEne30YvnjTiDb6JQig',
    String? query = 'queensland',
    String? types = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getSuggestionMap',
      apiUrl: 'https://maps.googleapis.com/maps/api/place/autocomplete/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'input': query,
        'key': api,
        'components': "country:au",
        'types': types,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<QueryResultsStruct>? predictions(dynamic response) =>
      (getJsonField(
        response,
        r'''$.predictions''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => QueryResultsStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class GetSuggestionMapProfesionalCall {
  static Future<ApiCallResponse> call({
    String? api = 'AIzaSyArSl-isY2tQa--YEne30YvnjTiDb6JQig',
    String? query = 'queensland',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getSuggestionMapProfesional',
      apiUrl: 'https://maps.googleapis.com/maps/api/place/autocomplete/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'input': query,
        'key': api,
        'components': "country:au",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<QueryResultsStruct>? predictions(dynamic response) =>
      (getJsonField(
        response,
        r'''$.predictions''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => QueryResultsStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class GetPlaceCall {
  static Future<ApiCallResponse> call({
    String? key = 'AIzaSyArSl-isY2tQa--YEne30YvnjTiDb6JQig',
    String? placeId = 'ChIJVZJb3I9b04URL4MbVqqUsJc',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getPlace',
      apiUrl: 'https://maps.googleapis.com/maps/api/place/details/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'key': key,
        'place_id': placeId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static NewLocationStruct? location(dynamic response) =>
      NewLocationStruct.maybeFromMap(getJsonField(
        response,
        r'''$.result.geometry.location''',
      ));
  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result.formatted_address''',
      ));
}

class GetNamePlaceCall {
  static Future<ApiCallResponse> call({
    String? apiKey = 'AIzaSyArSl-isY2tQa--YEne30YvnjTiDb6JQig',
    String? lat = '-33.71217710351823,150.31209443915802',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getNamePlace',
      apiUrl: 'https://maps.googleapis.com/maps/api/geocode/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'key': apiKey,
        'latlng': lat,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? street(dynamic response) => getJsonField(
        response,
        r'''$.results[:].formatted_address''',
        true,
      ) as List?;
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
