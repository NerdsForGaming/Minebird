import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class MinebirdIO {

  static Future<String> getApplicationDir() async {
    Directory directory = await getApplicationSupportDirectory();
    return directory.path;
  }

  static String dir = "";


  static String createConfigFile(){
    String path = "$dir/config.json";
    new File(path).createSync(recursive: true);
    return path;
  }

  static Future<String> createInstancesFile() async{
    return await getApplicationDir().then((value) {
      new File("$value/instances.json").createSync(recursive: true);
      return "$value/instances.json";
    });
  }

  static String encodeJson(String instanceName, int id){
    List<Map<String, Object>> data = [
      {"$instanceName": id},
    ];
    return jsonEncode(data);
  }

  static String removeItem(List<Map<String, Object>> data, String item){
    data.remove(item);
    return jsonEncode(data);
  }

  static void writeToFile(String filename, Object data) async {
    await File(filename).writeAsString(data.toString(), mode: FileMode.append);
  }

}