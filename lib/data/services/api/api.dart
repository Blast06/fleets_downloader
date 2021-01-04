import 'package:fleetsdownloader/data/models/About.dart';
import 'package:fleetsdownloader/data/models/Fleets.dart';
import 'package:fleetsdownloader/data/models/Information.dart';

abstract class Api {
  String profile;
  Future<List<About>> getAboutInformation();
  Future<List<Information>> getPolicyInformation();
  Future<List<Fleets>> getFleets(String profile);
  Future<void> getInfo(String profile);
}
