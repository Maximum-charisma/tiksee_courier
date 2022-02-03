import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:tiksee_courier/services/constants.dart';
import 'package:tiksee_courier/services/models/auth.dart';

enum Method { get, post, put, delete }

class NetHandler {
  static Future<String?> request({
    required BuildContext context,
    required String url,
    required String token,
    required Method method,
    required Map<String, String> params,
  }) async {
    // var appData = Provider.of<AppData>(context, listen: false);
    var headers = {"authorization": "Bearer $token"};
    var uri = Uri.parse(apiUrl + url);

    late Response response;

    switch (method) {
      case Method.get:
        response = await get(uri, headers: headers);
        break;
      case Method.post:
        response = await post(uri, body: params, headers: headers);
        break;
      case Method.put:
        response = await put(uri, body: params, headers: headers);
        break;
      case Method.delete:
        response = await delete(uri, body: params, headers: headers);
        break;
    }

    // switch (response.statusCode) {
    //   case 200:
    //     appData.setWebError(200);
    return response.body;
    //   case 400:
    //     appData.setWebError(400, error: answerErrorFromJson(response.body));
    //     break;
    //   default:
    //     appData.setWebError(600);
    //     break;
    // }
  }

  static Future<Auth?> authCourier(
      BuildContext context, String login, String password) async {
    var data = await request(
      context: context,
      url: 'auth/login/',
      token: authToken,
      method: Method.post,
      params: {'email': login, 'password': password},
    );
    print(data);

    return data != null ? authFromJson(data) : null;
  }
}
