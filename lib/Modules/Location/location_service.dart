import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class locationService {
  final String key = 'AIzaSyCVbpZTPCiR07sNKXkoGmCymBv6k1cYJfU';
  Future<String> getPlaceId(String input) async{
   final String url = 'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';

  var response = await http.get(Uri.parse(url));
  var json = convert.jsonDecode(response.body);
  var placeId= json['candidates'][0]['place_id'] as String;


  return placeId;
  }

  Future<Map<String, dynamic>> getPlace(String input) async
  {
    final placeId = await getPlaceId(input);
    final String url = 'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?place_id=$placeId&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results= json['results'] as Map<String, dynamic>;

    return results;
  }
  Future<Map<String, dynamic>>getDirections(String origin, String destination) async{
    final String url = 'https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);

    var results={
      'bounds_ne':json['routes'][0]['bounds']['nourtheast'],
      'bounds_sw':json['routes'][0]['bounds']['nourthwest'],
      'start_location':json['routes'][0]['legs'][0]['start_location'],
      'end_location':json['routes'][0]['legs'][0]['end_location'],
      'polyline':json['routes'][0]['overview_polyline']['points'],
      'polyline_decoded':PolylinePoints().decodePolyline(json['routes'][0]['overview_polyline']['points']),

    };

    print(results);
    return results;
  }
  }
