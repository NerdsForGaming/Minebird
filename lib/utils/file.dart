import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';

class MinebirdIO {
  static String getHomeDir() {
    Map<String, String> envVars = Platform.environment;
    switch (Platform.operatingSystem) {
      case "linux":
      case "macos":
      case "fuschia":
        return envVars['HOME'].toString();
      case "windows":
        return envVars['UserProfile'].toString();
      case "android":
      case "ios":
        throw Exception("ERR_UNSUPPORTED_OS");
      default:
        throw Exception("ERR_UNKNOWN_OS");
    }
  }

  static String getVersionJson(
      String version, Map<String, dynamic> versionManifest) {
    for (int i = 0; i < versionManifest["versions"].length; i++) {
      if (versionManifest["versions"][i]["id"] == version) {
        return versionManifest["versions"][i]["url"];
      }
    }
    return "{\"Error\":\"Version not found\"}";
  }

  static Future<void> downloadFromUrl(String url, File file) async {
    Uint8List bytes = (await NetworkAssetBundle(Uri.parse(url)).load(url))
        .buffer
        .asUint8List();
    file.writeAsBytes(bytes);
  }

  static void createConfigFile() {
    String home = getHomeDir();
    String configFile = "$home/.minebird/config.json";
    new File(configFile).createSync(recursive: true);
  }

  static void deleteInstance(String name) {
    String home = getHomeDir();
    Directory instanceFolder = new Directory("$home/.minebird/instances/$name");
    if (instanceFolder.existsSync()) {
      instanceFolder.deleteSync(recursive: true);
    } else {
      print("Instance $name does not exist");
      throw new Exception("ERR_INSTANCE_NOT_FOUND");
    }
  }

  static void createInstance(
      String name, String imageUrl, String version) async {
    String home = getHomeDir();
    File imageFile = new File("$home/.minebird/instances/$name/bg.png");
    imageFile.create(recursive: true);
    File launchFile = new File("$home/.minebird/instances/$name/launch.json");
    launchFile.create(recursive: true);
    downloadFromUrl(imageUrl, imageFile);
    http.Response response = await http.get(Uri.parse(
        "https://launchermeta.mojang.com/mc/game/version_manifest.json"));
    Map<String, dynamic> versionManifest = json.decode(response.body);
    downloadFromUrl(
        getVersionJson(version, versionManifest).toString(), launchFile);
  }
}
