import 'dart:io';

import 'package:fleetsdownloader/data/models/About.dart';
import 'package:fleetsdownloader/data/models/Fleets.dart';
import 'package:fleetsdownloader/data/models/Information.dart';

import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

import 'api.dart';

class HttpApi implements Api {
  Uri url = Uri.parse('https://strapi-giveaways-api.herokuapp.com');
  String? profile;
  String fleetsUrl = 'https://twitter-fleets.herokuapp.com/scrape/fleets/';
  List<Information> information = [];
  List<About> about = [];

  // List<Message> message = [];

  var logger = Logger();

  @override
  Future<List<About>> getAboutInformation() async {
    logger.d('Sending http for about information');
    Uri uri = Uri.parse('$url/abouts');
    final response = await http.get(uri);

    logger.v('response status: $response.statusCode ');

    logger.v('Response body: ${response.body}');

    final data = aboutFromJson(response.body);
    about.addAll(data);
    return about;
  }

  @override
  Future<List<Information>> getPolicyInformation() async {
    logger.d("Sending http for privacy policy");
    Uri uri = Uri.parse('$url/privacypolitics');
    final response = await http.get(uri);

    logger.v("response status: $response.statusCode ");

    logger.v("Response body: ${response.body}");

    final data = informationFromJson(response.body);
    information.addAll(data);
    return information;
  }

  @override
  Future<List<Fleets>> getFleets(String profile) async {
    List<Fleets> fleets = [];
    Uri uri = Uri.parse('$fleetsUrl/$profile');
    logger.d("Sending http for Fleets");
    final response = await http.get(uri);

    logger.v("Response body: ${response.body}");
    logger.v("response status: ${response.statusCode} ");

    // fleets.addAll(data);
    return fleets;
  }

  @override
  Future<dynamic> getInfo(String profile) async {
    List<Fleets> fleets = [];
    Uri uri = Uri.parse('$fleetsUrl/$profile');
    logger.d("Sending http for Fleets");
    final response = await http.get(uri);

    logger.v("Response body: ${response.body}");
    logger.v("response status: ${response.statusCode} ");

    if (response.statusCode == 404) {
      logger.v("status code: ${response.statusCode}");
      return 404;
    }

    final data = fleetsFromJson(response.body);

    fleets.add(data);
    return fleets;
  }
}
