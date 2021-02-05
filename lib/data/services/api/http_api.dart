import 'dart:io';

import 'package:fleetsdownloader/data/models/About.dart';
import 'package:fleetsdownloader/data/models/Fleets.dart';
import 'package:fleetsdownloader/data/models/Information.dart';

import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

import 'api.dart';

class HttpApi implements Api {
  String url = 'https://strapi-giveaways-api.herokuapp.com';
  String profile;
  String fleetsUrl = 'https://twitter-fleets.herokuapp.com/scrape/fleets/';
  List<Information> information = [];
  List<About> about = [];

  // List<Message> message = [];

  var logger = Logger();

  @override
  Future<List<About>> getAboutInformation() async {
    logger.d('Sending http for about information');
    final response = await http.get('$url/abouts');

    logger.v('response status: $response.statusCode ');

    logger.v('Response body: ${response.body}');

    final data = aboutFromJson(response.body);
    about.addAll(data);
    return about;
  }

  @override
  Future<List<Information>> getPolicyInformation() async {
    logger.d("Sending http for privacy policy");
    final response = await http.get('$url/privacypolitics');

    logger.v("response status: $response.statusCode ");

    logger.v("Response body: ${response.body}");

    final data = informationFromJson(response.body);
    information.addAll(data);
    return information;
  }

  @override
  Future<List<Fleets>> getFleets(String profile) async {
    List<Fleets> fleets = [];

    logger.d("Sending http for Fleets");
    final response = await http.get('$fleetsUrl$profile');

    logger.v("Response body: ${response.body}");
    logger.v("response status: ${response.statusCode} ");

    // fleets.addAll(data);
    // return fleets;
  }

  @override
  Future<dynamic> getInfo(String profile) async {
    List<Fleets> fleets = [];

    logger.d("Sending http for Fleets");
    final response = await http.get('$fleetsUrl$profile');

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
