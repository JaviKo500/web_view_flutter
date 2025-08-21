// To parse this JSON data, do
//
//     final payPal = payPalFromJson(jsonString);

import 'dart:convert';

class Response {
    bool? ok;
    String? status;
    String? message;
    String? successMessage;
    String? errorMessage;
    String? url;

    Response({
        this.ok,
        this.status,
        this.message,
        this.successMessage,
        this.errorMessage,
        this.url,
    });

    factory Response.fromRawJson(dynamic str) => Response.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        ok: json["ok"],
        status: json["status"],
        message: json["message"],
        successMessage: json["successMessage"],
        errorMessage: json["errorMessage"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "status": status,
        "message": message,
        "successMessage": successMessage,
        "errorMessage": errorMessage,
        "url": url,
    };
}
