//
import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constant.dart';

//get auth token
Future getToken() async {
  String otpUrl = baseUrl + "/auth/token";
  final prefs = await SharedPreferences.getInstance();
  var body = {
    "clientId": "ui-34783822",
    "clientSecret": "538mdue832",
    "grantType": "password",
    "password": "UI2324@123",
    "username": "development"
  };

  var response = await post(Uri.parse(otpUrl),
      headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
      },
      body: json.encode(body));

  print("response from Token ${response.body}");
  if (response.statusCode == 200) {
    prefs.setString(
        "token", json.decode(response.body)['data']['access_token']);
    var result = {
      "error": false,
      "message": json.decode(response.body)['responseMessage'],
    };
    return result;
  } else {
    print("Error::");
    var result = {
      "error": true,
      "message": json.decode(response.body)['error_description'],
    };
    return result;
  }
}

//REGISTER
Future register({
  required String companyName,
  required String firstName,
  required String lastName,
  required String mobilePhone,
  required String password,
  required String username,
  required int userRoleId,
}) async {
  String url = baseUrl + "/user/register-user";
  final prefs = await SharedPreferences.getInstance();

  //get token
  var result = await getToken();

  print("result:: $result");

  if (result["error"] == false) {
    String accessToken = prefs.getString('token').toString();

    var body = {
      "companyName": companyName,
      "firstName": firstName,
      "lastName": lastName,
      "mobilePhone": mobilePhone,
      "password": password,
      "userRoleId": userRoleId,
      "username": username
    };

    var response = await post(Uri.parse(url),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $accessToken",
        },
        body: json.encode(body));

    print("Registration response:: ${response.body}");
    if (response.statusCode == 200 &&
        json.decode(response.body)['responseMessage'] == "Successful") {
      var result = {
        "error": false,
        "message": json.decode(response.body)['responseMessage'],
      };
      return result;
    } else {
      print("Registration error ++++++++++");
      var result = {
        "error": true,
        "message": json.decode(response.body)['responseMessage'],
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

//Login
Future login({
  required String username,
  required String password,
}) async {
  String url = baseUrl + "/user/login";
  final prefs = await SharedPreferences.getInstance();

  //get token
  var result = await getToken();

  if (result['error'] == false) {
    String accessToken = prefs.getString('token').toString();

    var body = {
      "username": username,
      "password": password,
    };

    var response = await post(Uri.parse(url),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $accessToken",
        },
        body: json.encode(body));

    print("Login response:: ${response.body}");
    if (response.statusCode == 200 &&
        json.decode(response.body)['responseMessage'] ==
            "User Authentication was successful") {
      var data = json.decode(response.body)['data'];
      var result = {
        "error": false,
        "message": json.decode(response.body)['responseMessage'],
        "data": data,
      };

      return result;
    } else {
      print("Registration error ++++++++++");
      var result = {
        "error": true,
        "message": json.decode(response.body)['error_description'],
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

//EDIT USER PROFILE
Future editProfile({
  required String address,
  required String bio,
  required String city,
  required String companyName,
  required String country,
  required String email,
  required String firstName,
  required String lastName,
  required String phoneNumber,
  required String routes,
  required String state,
  required String termsOfService,
  required String userId,
  required String userProfileUrl,
  required String whatsappNumber,
}) async {
  String url = baseUrl + "/user/edit-user-profile";
  final prefs = await SharedPreferences.getInstance();

  //get token
  var result = await getToken();

  if (result['error'] != false) {
    String accessToken = prefs.getString('token').toString();

    var body = {
      "address": address,
      "bio": bio,
      "city": city,
      "companyName": companyName,
      "country": country,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "routes": routes,
      "state": state,
      "termsOfService": termsOfService,
      "userId": userId,
      "userProfileUrl": userProfileUrl,
      "whatsappNumber": whatsappNumber,
    };

    var response = await post(Uri.parse(url),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $accessToken",
        },
        body: json.encode(body));

    print("Registration response:: ${response.body}");
    if (response.statusCode == 200 &&
        json.decode(response.body)['responseMessage'] == "Successful") {
      var result = {
        "error": false,
        "message": json.decode(response.body)['responseMessage'],
      };
      return result;
    } else {
      print("Registration error ++++++++++");
      var result = {
        "error": true,
        "message": json.decode(response.body)['error_description'],
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

//GET PHONE AUTHENTICATION TOKEN
Future getAuthenticationTokenForPhone({required username}) async {
  String url = baseUrl + "/twilio/get-twilio-token/$username";
  final prefs = await SharedPreferences.getInstance();

  //get token
  var result = await getToken();

  if (result['error'] != false) {
    String accessToken = prefs.getString('token').toString();

    var response = await get(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $accessToken",
      },
    );

    print("Registration response:: ${response.body}");
    if (response.statusCode == 200 &&
        json.decode(response.body)['responseMessage'] == "Successful") {
      var result = {
        "error": false,
        "message": json.decode(response.body)['responseMessage'],
      };
      return result;
    } else {
      print("Registration error ++++++++++");
      var result = {
        "error": true,
        "message": json.decode(response.body)['error_description'],
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

//GET TRUCK PER USER
Future getTrucksPerUser({
  required String userId,
}) async {
  String url = baseUrl + "/truck/get-truck-by-userId/$userId";
  final prefs = await SharedPreferences.getInstance();

  //get token
  var result = await getToken();

  if (result['error'] != false) {
    String accessToken = prefs.getString('token').toString();

    var response = await get(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $accessToken",
      },
    );

    print("Registration response:: ${response.body}");
    if (response.statusCode == 200 &&
        json.decode(response.body)['responseMessage'] == "Successful") {
      var result = {
        "error": false,
        "message": json.decode(response.body)['responseMessage'],
        "data": json.decode(response.body)['data'],
      };
      return result;
    } else {
      print("Registration error ++++++++++");
      var result = {
        "error": true,
        "message": json.decode(response.body)['error_description'],
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

//GET TRUCK FOR GUEST
Future getTrucks() async {
  String url = baseUrl + "/truck/get-trucks";
  final prefs = await SharedPreferences.getInstance();

  //get token
  var result = await getToken();

  if (result['error'] != false) {
    String accessToken = prefs.getString('token').toString();

    var response = await get(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $accessToken",
      },
    );

    print("Registration response:: ${response.body}");
    if (response.statusCode == 200 &&
        json.decode(response.body)['responseMessage'] == "Successful") {
      var result = {
        "error": false,
        "message": json.decode(response.body)['responseMessage'],
        "data": json.decode(response.body)['data'],
      };
      return result;
    } else {
      print("Registration error ++++++++++");
      var result = {
        "error": true,
        "message": json.decode(response.body)['error_description'],
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
