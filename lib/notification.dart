import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:firebase_messaging/firebase_messaging.dart';


class NotificationsHelper extends StatelessWidget {
  const NotificationsHelper({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(onPressed: (){
          // FirebaseMessaging.instance.subscribeToTopic("amr");
          getAccessToken();
        },
        child: Text("clickkk"),
        ),
      ),

    );

  }
}

  Future<String?> getAccessToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "phonic-arcana-438515-d0",
      "private_key_id": "7c084058e014d8f5a282d5a17f49bca4de9ab163",
      "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDM2LfX2WyNeV4n\n8ABHc+SbC5s6RVer3l++a1v3ZYzoavrekcx/760jYUZftQUzruMAlJYDTyTh4Kvm\nxTws7dXR54kj25WKeXH50CgaHdxaZwjqQLxO6aSYBbGBNnM4n3drcn8pAz87OSbV\nHvbBrIqwLYimWWtL5+c152fBo1BaH9omAoXYlfOxw+XyFnGSw2GugpAcekGxQpD/\n4d36MItdvo3M/9mJKNNiavFDj8n/gFhSwKhIz++53zcFu13NwWl436gjMzNELvKU\nIFGTyXjEduJVd2gx1erzcW3AMLgui7vNL4/ZgYl5phn7gode+5OAPQLk0HS+FPtu\nT3gqHaCBAgMBAAECggEAB3XnqTL8IQFv+FKlgfSyuWJgdIx4u1PZpxbkJjQiwAbA\nbQmAmhK9uq2E6YCvaDDZB+kBdyyjXl4nSJv7m3PMjyzoed+6GC1g5S0rfrsCbuD0\nikqSCSo5gkdnzfnQk7n8GJPWlYTuoT6tP0MVz9szwGOiJ9PXJHA1Y6lSRjNHXobc\nhb2B7nt39T3uR61ZdNH4OYQA02eAD/Mcis+JOgtzaLQtHmn3jUBRZc1ni2lCZiOA\nFWM/bE0lbScvXP2zRHypu8Oa0V0ftP+SlXptaeHdOedAIji3cNna4vK9p8jJh/cx\nDfJ9Kuui99+iOqPg1aR+5RoF817vbaAVvoB/CtV5CQKBgQDnWyn1hxG4doyowPVR\nAe6kJun5c4ieZjYuW6uRqqkwcbXTPTDLFjwQAbv13Y+wW5H8achRBC/y03qOCStZ\nTdjBi+iTBzKARYp3M5orgEDt1oR9O7BrucGEcr3zgHAcTcPH8iowIM5KAqhS+afT\nCUr4Zd5QXsXzw23HnB7YGGtteQKBgQDiqqqxzzASIXk5ZlAoJiz29yDbeQilssU5\nQ3KqCpKbugE2lyV+KBN6ojkZsMAF+Gde1M+omdf2ijlT+6F1bjuelsqJaluCHUYF\n9MYHlUsaDpg0VI4BAbUbdcLRKWIBKj0xCsHmOgqvQwQl3sHx76E84k/kC7REWQVp\nW59fdDFxSQKBgDMZXJQhSBWxAXJIZCaHQbk56xWwoe0ycCcfEi7zPbk4dEt6yWsh\ntxRl/ajZTeJK51yT1K2oOhrtALWcatmnqwdcqnrG7S2Nrn6ThCq1giHF7q9mXpn8\nhjSFz1SX+qsVtfdUkmLc7BNGsPzarWmcNNXWUhr4Q8qKUJX08o8SHbApAoGBAL1Z\nKqzM0nBi7ByKHq3bbjaErTsKObIJy/2RHYl0uZJDaN4Ml3Jy0grg12hhoZebMecj\nSbGjiqhWQZupmfA6PK23c8wlP/pKsAMrvf35tjo3NOiKNfIbVgpxbmRB+K/WdDWy\nsdW8aM6N4josgsGzl3L/7xMmv9lUsFOaCWG489CZAoGAdva5qyQD7pZuyYw367b3\nUN+2VcHCQegFjPgERGnNpwmpg/l2+UqnQAoUftdwN9a75hmafxeXdM39i+nZcvEl\nGG9ngwYVVJhfU8EJzKqZzYMdpc6pIfl4MK4dCJKUQDAznysCNBt7VYnTX5eCy0DS\nfDQd3/J6VIxJIe5i8NGJP3c=\n-----END PRIVATE KEY-----\n",
      "client_email": "firebase-adminsdk-jbe1e@phonic-arcana-438515-d0.iam.gserviceaccount.com",
      "client_id": "117772001279040366796",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-jbe1e%40phonic-arcana-438515-d0.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
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
          client);

      client.close();
      print(
          "Access Token: ${credentials.accessToken.data}"); // Print Access Token
      return credentials.accessToken.data;
    } catch (e) {
      print("Error getting access token: $e");
      return null;
    }
  }

  // Map<String, dynamic> getBody({
  //   required String fcmToken,
  //   required String title,
  //   required String body,
  //   required String userId,
  //   String? type,
  // }) {
  //   return {
  //     "message": {
  //       "token": fcmToken,
  //       "notification": {"title": title, "body": body},
  //       "android": {
  //         "notification": {
  //           "notification_priority": "PRIORITY_MAX",
  //           "sound": "default"
  //         }
  //       },
  //       "apns": {
  //         "payload": {
  //           "aps": {"content_available": true}
  //         }
  //       },
  //       "data": {
  //         "type": type,
  //         "id": userId,
  //         "click_action": "FLUTTER_NOTIFICATION_CLICK"
  //       }
  //     }
  //   };
  // }

  // Future<void> sendNotifications({
  //   required String fcmToken,
  //   required String title,
  //   required String body,
  //   required String userId,
  //   String? type,
  // }) async {
  //   try {
  //     var serverKeyAuthorization = await getAccessToken();
  //
  //     // change your project id
  //     const String urlEndPoint =
  //         "https://fcm.googleapis.com/v1/projects/(YourProjectId)/messages:send";
  //
  //     Dio dio = Dio();
  //     dio.options.headers['Content-Type'] = 'application/json';
  //     dio.options.headers['Authorization'] = 'Bearer $serverKeyAuthorization';
  //
  //     var response = await dio.post(
  //       urlEndPoint,
  //       data: getBody(
  //         userId: userId,
  //         fcmToken: fcmToken,
  //         title: title,
  //         body: body,
  //         type: type ?? "message",
  //       ),
  //     );
  //
  //     // Print response status code and body for debugging
  //     print('Response Status Code: ${response.statusCode}');
  //     print('Response Data: ${response.data}');
  //   } catch (e) {
  //     print("Error sending notification: $e");
  //   }
  // }
