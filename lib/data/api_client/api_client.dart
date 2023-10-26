import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:rentworthy/utils/color.dart';

import '../../application/dialog/dialog_service.dart';
import '../../utils/config.dart';

class ApiClient {
  ApiClient();

  void getSessionId(
      {required final Function(String userType) sessionId}) async {
    Directory tempDir = await getTemporaryDirectory();

    final tempPath = tempDir.path;
    final cookieJar = PersistCookieJar(
      storage: FileStorage(tempPath),
      ignoreExpires: false,
    );

    List<Cookie> results =
        await cookieJar.loadForRequest(Uri.parse(ApiConfig.mainUrl));
    log("sfgsgfs ${results[0].toString().split("=")[1].split(";")[0]}");
    sessionId(results[0].toString().split("=")[1].split(";")[0]);
  }

  Map<String, String> createHeaders({
    required String authtoken,
    required String sessionId,
  }) {
    log("SessionId is=-=- $sessionId");

    final headers = <String, String>{
      "Content-Type": "application/json",
    };

    return headers;
  }

  Future<T?> postData<T>({
    required Uri uri,
    required var headers,
    required var body,
    required T Function(dynamic data) builder,
  }) async {
    try {
      log("_postData URL=-=-=-=-::: $uri");
      log("_postData headers=-=-=-=-::: $headers");
      log("_postData body=-=-=-=-::: $body");
      var request = http.Request('POST', uri);
      request.body = json.encode(body);
      log('_postData $uri body ${request.body}');
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final responseString = await response.stream.bytesToString();
      log('response.statusCode is ${response.statusCode}');
      //
      final setCookieHeader = response.headers['set-cookie'];

      if (setCookieHeader != null) {
        final cookies = setCookieHeader.split(';');
        Directory tempDir = await getTemporaryDirectory();

        final tempPath = tempDir.path;
        final cookieJar = PersistCookieJar(
          storage: FileStorage(tempPath),
          ignoreExpires: false,
        );
        List<Cookie> savedCookies = [];
        savedCookies
            .add(Cookie(cookies[0].split("=")[0], cookies[0].split("=")[1]));
        log("savedCookies ${savedCookies[0]}");
        await cookieJar.saveFromResponse(
            Uri.parse(ApiConfig.mainUrl), savedCookies);

        log('Load Cookie ${await cookieJar.loadForRequest(Uri.parse(ApiConfig.mainUrl))}');
      } else {
        log('Set-Cookie header not found in the response.');
      }
      log("response is=-=-$responseString");
      dynamic map = json.decode(responseString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        log("response statusCode is=-=-$responseString");
        return builder(responseString);
      } else {
        DialogServiceV1().showSnackBar(
            content: map["message"] ?? response.reasonPhrase.toString(),
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
        log("response.reasonPhrase=-=- ${response.reasonPhrase} ");
        return null;
      }
    } catch (e) {
      DialogServiceV1().showSnackBar(
          content: e.toString(),
          color: AppColors.red..withOpacity(0.7),
          textclr: AppColors.white);
      throw Exception("Exception is =-=-1 $e");
    }
  }

  Future<T?> putData<T>({
    required Uri uri,
    required var headers,
    required var body,
    required T Function(dynamic data) builder,
  }) async {
    try {
      log("_putData URL=-=-=-=-::: $uri");
      log("_putData headers=-=-=-=-::: $headers");
      log("_putData body=-=-=-=-::: $body");
      var request = http.Request('PUT', uri);
      request.body = json.encode(body);
      log('_putData $uri body ${request.body}');
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final responseString = await response.stream.bytesToString();
      log('response.statusCode is ${response.statusCode}');

      log("response is=-=-$responseString");
      dynamic map = json.decode(responseString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        log("response statusCode is=-=-$responseString");
        return builder(responseString);
      } else {
        DialogServiceV1().showSnackBar(
            content: map["message"] ?? response.reasonPhrase.toString(),
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
        log("response.reasonPhrase=-=- ${response.reasonPhrase} ");
        return null;
      }
    } catch (e) {
      DialogServiceV1().showSnackBar(
          content: e.toString(),
          color: AppColors.red..withOpacity(0.7),
          textclr: AppColors.white);
      throw Exception("Exception is =-=-1 $e");
    }
  }

  Future<T?> deleteData<T>({
    required Uri uri,
    required var headers,
    required T Function(dynamic data) builder,
  }) async {
    try {
      log("deleteData URL=-=-=-=-::: $uri");
      log("deleteData headers=-=-=-=-::: $headers");

      var request = http.Request('DELETE', uri);
      log('_postData $uri body ${request.body}');
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final responseString = await response.stream.bytesToString();
      log('response.statusCode is ${response.statusCode}');

      log("response is=-=-$responseString");
      dynamic map = json.decode(responseString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        log("response statusCode is=-=-$responseString");
        return builder(responseString);
      } else {
        DialogServiceV1().showSnackBar(
            content: map["message"] ?? response.reasonPhrase.toString(),
            color: AppColors.red..withOpacity(0.7),
            textclr: AppColors.white);
        log("response.reasonPhrase=-=- ${response.reasonPhrase} ");
        return null;
      }
    } catch (e) {
      DialogServiceV1().showSnackBar(
          content: e.toString(),
          color: AppColors.red..withOpacity(0.7),
          textclr: AppColors.white);
      throw Exception("Exception is =-=-1 $e");
    }
  }

  Future<T?> getData<T>({
    required Uri uri,
    required var headers,
    required T Function(dynamic data) builder,
  }) async {
    try {
      log("_getData URL=-=-=-=-::: $uri");
      log("_getData headers=-=-=-=-::: $headers");
      var request = http.Request('GET', uri);
      log('_getData $uri body ${request.body}');
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final responseString = await response.stream.bytesToString();
      log('response.statusCode is ${response.statusCode}');

      log("response is=-=-$responseString");
      dynamic map = json.decode(responseString);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return builder(responseString);
      } else {
        DialogServiceV1().showSnackBar(
            content: map["message"] ?? response.reasonPhrase.toString(),
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
        log("response.reasonPhrase=-=- ${response.reasonPhrase} ");
        return null;
      }
    } catch (e) {
      DialogServiceV1().showSnackBar(
          content: e.toString(),
          color: AppColors.red..withOpacity(0.7),
          textclr: AppColors.white);
      throw Exception("Exception is =-=-4 $e");
    }
  }

  Future<T?> multipartData<T>({
    required Uri uri,
    required var headers,
    required var body,
    required T Function(dynamic data) builder,
    required var imageparam,
    required var imagepath,
  }) async {
    try {
      log("_multipartData URL=-=-=-=-::: $uri");
      log("_multipartData headers=-=-=-=-::: $headers");
      log("_multipartData body=-=-=-=-::: $body");
      var request = http.MultipartRequest('POST', uri);
      request.fields.addAll(body);
      log('_multipartData $uri body ${request.fields}');
      request.files
          .add(await http.MultipartFile.fromPath(imageparam, imagepath));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      final responseString = await response.stream.bytesToString();
      log('response.statusCode is ${response.statusCode}');
      log("response is=-=-$responseString");
      dynamic map = json.decode(responseString);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return builder(responseString);
      } else {
        DialogServiceV1().showSnackBar(
            content: map["message"] ?? response.reasonPhrase.toString(),
            color: AppColors.red..withOpacity(0.7),
            textclr: AppColors.white);
        log("response.reasonPhrase=-=- ${response.reasonPhrase} ");
        return null;
      }
    } catch (e) {
      DialogServiceV1().showSnackBar(
          content: e.toString(),
          color: AppColors.red..withOpacity(0.7),
          textclr: AppColors.white);
      throw Exception("Exception is =-=-2 $e");
    }
  }
}
