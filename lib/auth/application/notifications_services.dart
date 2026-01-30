import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications_services.g.dart';

@riverpod
NotificationsServices notificationsService(Ref ref) => NotificationsServices();

class NotificationsServices {
  NotificationsServices();

  /// creat instance of fbm ----------------------------------------------------
  final _firebaseMessaging = FirebaseMessaging.instance;
  // ---------------------------------------------------------------------------

  // initialize notifications for this app or device
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
  }
  // ---------------------------------------------------------------------------

  Future<String?> getAccessToken() async {
    // TODO: Move service account credentials to environment variables
    // For now, they should be loaded from a secure configuration file or environment
    // Do NOT hardcode credentials in source code
    final serviceAccountJson = {
      // "type": "service_account",
      // "project_id": "your-project-id",
      // "private_key_id": "your-private-key-id",
      // "private_key": "your-private-key",
      // "client_email": "your-client-email",
      // ... other fields ...
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];

    try {
      http.Client client = await auth.clientViaServiceAccount(
          auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);

      auth.AccessCredentials credentials =
          await auth.obtainAccessCredentialsViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
        scopes,
        client,
      );

      client.close();
      return credentials.accessToken.data;
    } catch (e) {
      return null;
    }
  }

  Map<String, dynamic> getBody({
    required String fcmToken,
    required String title,
    required String body,
    required String userId,
    String? type,
  }) {
    return {
      "message": {
        "token": fcmToken,
        "notification": {"title": title, "body": body},
        "android": {
          "notification": {
            "notification_priority": "PRIORITY_MAX",
            "sound": "default",
            "image":
                "https://img.freepik.com/free-vector/blue-notification-bell-with-one-notification_78370-6899.jpg",
            "color": "#FF0000",
          }
        },
        "apns": {
          "payload": {
            "aps": {"content_available": true}
          }
        },
        "data": {
          "type": type,
          "id": userId,
          "click_action": "FLUTTER_NOTIFICATION_CLICK"
        }
      }
    };
  }

  // Send ----------------------------------------------------------------------
  Future<void> sendNotifications({
    required String fcmToken,
    required String title,
    required String body,
    required String userId,
    String? type,
  }) async {
    try {
      var serverKeyAuthorization = await getAccessToken();

      // change your project id
      const String urlEndPoint =
          "https://fcm.googleapis.com/v1/projects/midad-test1/messages:send";

      Dio dio = Dio();
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $serverKeyAuthorization';

      var response = await dio.post(
        urlEndPoint,
        data: getBody(
          userId: userId,
          fcmToken: fcmToken,
          title: title,
          body: body,
          type: type ?? "message",
        ),
      );

      // Print response status code and body for debugging
      debugPrint('Response Status Code: ${response.statusCode}');
      debugPrint('Response Data: ${response.data}');
    } catch (e) {
      debugPrint("Error sending notification: $e");
    }
  }
  // ---------------------------------------------------------------------------
}
