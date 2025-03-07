// To parse this JSON data, do
//
//     final profilePageDataModel = profilePageDataModelFromJson(jsonString);

import 'dart:convert';

ProfilePageDataModel profilePageDataModelFromJson(String str) =>
    ProfilePageDataModel.fromJson(json.decode(str));

String profilePageDataModelToJson(ProfilePageDataModel data) =>
    json.encode(data.toJson());

class ProfilePageDataModel {
  final Response response;
  final Data data;

  ProfilePageDataModel({
    required this.response,
    required this.data,
  });

  factory ProfilePageDataModel.fromJson(Map<String, dynamic> json) =>
      ProfilePageDataModel(
        response: Response.fromJson(json["response"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  final String id;
  final String dataId;
  final String name;
  final String email;
  final String photoUrl;
  final String token;

  Data({
    required this.id,
    required this.dataId,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        dataId: json["id"],
        name: json["name"],
        email: json["email"],
        photoUrl: json["photoUrl"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "id": dataId,
        "name": name,
        "email": email,
        "photoUrl": photoUrl,
        "token": token,
      };
}

class Response {
  final int code;
  final String message;

  Response({
    required this.code,
    required this.message,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
