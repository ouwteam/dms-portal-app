class Users {
  int id;
  String customerCode;
  String name;
  String email;
  String emailVerifiedAt;
  int dataSourceId;
  int? uid;
  String createdAt;
  String updatedAt;
  int teamId;
  int approveBy;
  String approveAt;
  int? approveFlag;
  String? rejectReason;

  Users({
    this.id = 0,
    this.customerCode = "",
    this.name = "",
    this.email = "",
    this.emailVerifiedAt = "",
    this.dataSourceId = 0,
    this.uid = 0,
    this.createdAt = "",
    this.updatedAt = "",
    this.teamId = 0,
    this.approveBy = 0,
    this.approveAt = "",
    this.approveFlag = 0,
    this.rejectReason = "",
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json['id'],
        customerCode: json['customer_code'],
        name: json['name'],
        email: json['email'],
        emailVerifiedAt: json['email_verified_at'],
        dataSourceId: json['data_source_id'],
        uid: json['uid'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        teamId: json['team_id'],
        approveBy: json['approve_by'],
        approveAt: json['approve_at'],
        approveFlag: json['approve_flag'],
        rejectReason: json['reject_reason'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_code": customerCode,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "data_source_id": dataSourceId,
        "uid": uid,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "team_id": teamId,
        "approve_by": approveBy,
        "approve_at": approveAt,
        "approve_flag": approveFlag,
        "reject_reason": rejectReason,
      };
}
