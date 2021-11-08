class DataSource {
  DataSource({
    this.id = 0,
    this.apiCode = "",
    this.apiName = "",
    this.apiAddr = "",
    this.apiKey = "",
  });

  int id;
  String apiCode;
  String apiName;
  String apiAddr;
  String apiKey;

  factory DataSource.fromJson(Map<String, dynamic> json) => DataSource(
        id: json["id"],
        apiCode: json["api_code"],
        apiName: json["api_name"],
        apiAddr: json["api_addr"],
        apiKey: json["api_key"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "api_code": apiCode,
        "api_name": apiName,
        "api_addr": apiAddr,
        "api_key": apiKey,
      };
}
