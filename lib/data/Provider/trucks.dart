import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trucks/utils/constant.dart';

import '../../main.dart';
import '../Network/rest_api.dart';

class Truck {
  String truckYear;
  int truckModelId;
  var isVerified;
  String truckModelName;
  int id;
  int truckTypeId;
  String plateNumber;
  int truckStatus;
  String truckTypeName;
  List truckImages;

  Truck({
    required this.truckYear,
    required this.truckModelId,
    required this.isVerified,
    required this.truckModelName,
    required this.id,
    required this.truckTypeId,
    required this.plateNumber,
    required this.truckStatus,
    required this.truckTypeName,
    required this.truckImages,
  });
}

class Trucks with ChangeNotifier {
  List<Truck> _active = [];
  List<Truck> _expired = [];
  int total_trucks = 0;
  List<Truck> get active => _active;
  List<Truck> get expired => _expired;

  //
  Future getTrucksPerUser({
    required int userId,
  }) async {
    String url = baseUrl + "/truck/get-truck-by-userId/$userId";
    final prefs = await SharedPreferences.getInstance();

    //get token
    var result = await getToken();

    if (result['error'] == false) {
      String accessToken = prefs.getString('token').toString();

      var response = await get(
        Uri.parse(url),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $accessToken",
        },
      );

      print("Get Truck Response response:: ${response.body}");
      if (response.statusCode == 200) {
        //

        _active.clear();
        _expired.clear();
        List data = json.decode(response.body)["data"];
        print("Data from GEt truck by user :$data");
        total_trucks = data.length;
        for (var item in data) {
          if (item["truckStatus"] == 1) {
            _active.add(Truck(
              id: item['id'],
              truckYear: item['truckYear'],
              isVerified: item['isVerified'],
              truckModelId: item['truckModelId'],
              truckModelName: item['truckModelName'],
              truckTypeId: item['truckTypeId'],
              plateNumber: item['plateNumber'],
              truckStatus: item['truckStatus'],
              truckTypeName: item['truckTypeName'],
              truckImages: item['truckImages'],
            ));

            //
            //notifyListeners();
          } else {
            _expired.add(Truck(
              id: item['id'],
              truckYear: item['truckYear'],
              isVerified: item['isVerified'],
              truckModelId: item['truckModelId'],
              truckModelName: item['truckModelName'],
              truckTypeId: item['truckTypeId'],
              plateNumber: item['plateNumber'],
              truckStatus: item['truckStatus'],
              truckTypeName: item['truckTypeName'],
              truckImages: item['truckImages'],
            ));
            //
            //notifyListeners();
          }
        }

        print("===========================Active trucks: $_active");
        print("===========================Expired trucks: $_expired");
      } else {
        var result = {
          "error": false,
          "message": json.decode(response.body)['responseMessage'],
          "data": json.decode(response.body)['data'],
        };
        return result;
      }
    } else {
      var result = {
        "error": true,
        "message": "Failed to get token... please try again",
      };
      return result;
    }
  }
}
