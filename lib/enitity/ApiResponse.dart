class ApiResponse {
  int code;
  String? message;
  dynamic data;

  ApiResponse({
    this.code = 0,
    this.message,
    this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        code: json['code'],
        message: json['message'],
        data: json['data'],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data,
      };
}
