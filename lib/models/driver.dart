// To parse this JSON data, do
//
//     final driver = driverFromJson(jsonString);

import 'dart:convert';

Driver driverFromJson(String str) => Driver.fromJson(json.decode(str));

String driverToJson(Driver data) => json.encode(data.toJson());

class Driver {
  Driver({
    this.status,
    this.data,
    this.message,
  });

  String status;
  Data data;
  String message;

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    this.accountHolderName,
    this.accountNumber,
    this.ifscCode,
    this.id,
    this.phone,
    this.countryCode,
    this.firstName,
    this.lastName,
    this.email,
    this.dob,
    this.gender,
    this.bankId,
    this.otpVerified,
    this.isProfileUpdated,
    this.vehicalNo,
    this.isActive,
    this.isVerified,
    this.referralCode,
    this.referredBy,
    this.rating,
    this.vehicleModel,
    this.driverStatus,
    this.cancellationCount,
    this.totalCancellations,
    this.rideTypeId,
    this.lat,
    this.long,
    this.heading,
    this.socketId,
    this.locationUpdatedAt,
    this.districtId,
    this.stateId,
    this.approvedBy,
    this.rejected,
    this.rejectedBy,
    this.rejectedReason,
    this.blocked,
    this.blockedBy,
    this.blockedReason,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.rideType,
  });

  String accountHolderName;
  String accountNumber;
  String ifscCode;
  int id;
  String phone;
  String countryCode;
  String firstName;
  String lastName;
  String email;
  DateTime dob;
  int gender;
  int bankId;
  int otpVerified;
  int isProfileUpdated;
  dynamic vehicalNo;
  int isActive;
  int isVerified;
  String referralCode;
  dynamic referredBy;
  double rating;
  dynamic vehicleModel;
  String driverStatus;
  int cancellationCount;
  int totalCancellations;
  int rideTypeId;
  double lat;
  double long;
  double heading;
  String socketId;
  DateTime locationUpdatedAt;
  int districtId;
  int stateId;
  int approvedBy;
  int rejected;
  dynamic rejectedBy;
  dynamic rejectedReason;
  int blocked;
  dynamic blockedBy;
  dynamic blockedReason;
  int isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  RideType rideType;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accountHolderName: json["account_holder_name"],
        accountNumber: json["account_number"],
        ifscCode: json["ifsc_code"],
        id: json["id"],
        phone: json["phone"],
        countryCode: json["country_code"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        dob: DateTime.parse(json["DOB"]),
        gender: json["gender"],
        bankId: json["bank_id"],
        otpVerified: json["otp_verified"],
        isProfileUpdated: json["isProfileUpdated"],
        vehicalNo: json["vehical_no"],
        isActive: json["is_active"],
        isVerified: json["is_verified"],
        referralCode: json["referral_code"],
        referredBy: json["referred_by"],
        rating: json["rating"].toDouble(),
        vehicleModel: json["vehicle_model"],
        driverStatus: json["driver_status"],
        cancellationCount: json["cancellation_count"],
        totalCancellations: json["total_cancellations"],
        rideTypeId: json["ride_type_id"],
        lat: json["lat"].toDouble(),
        long: json["long"].toDouble(),
        heading: json["heading"].toDouble(),
        socketId: json["socket_id"],
        locationUpdatedAt: DateTime.parse(json["location_updatedAt"]),
        districtId: json["district_id"],
        stateId: json["state_id"],
        approvedBy: json["approved_by"],
        rejected: json["rejected"],
        rejectedBy: json["rejected_by"],
        rejectedReason: json["rejected_reason"],
        blocked: json["blocked"],
        blockedBy: json["blocked_by"],
        blockedReason: json["blocked_reason"],
        isDeleted: json["is_deleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        rideType: RideType.fromJson(json["ride_type"]),
      );

  Map<String, dynamic> toJson() => {
        "account_holder_name": accountHolderName,
        "account_number": accountNumber,
        "ifsc_code": ifscCode,
        "id": id,
        "phone": phone,
        "country_code": countryCode,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "DOB": dob.toIso8601String(),
        "gender": gender,
        "bank_id": bankId,
        "otp_verified": otpVerified,
        "isProfileUpdated": isProfileUpdated,
        "vehical_no": vehicalNo,
        "is_active": isActive,
        "is_verified": isVerified,
        "referral_code": referralCode,
        "referred_by": referredBy,
        "rating": rating,
        "vehicle_model": vehicleModel,
        "driver_status": driverStatus,
        "cancellation_count": cancellationCount,
        "total_cancellations": totalCancellations,
        "ride_type_id": rideTypeId,
        "lat": lat,
        "long": long,
        "heading": heading,
        "socket_id": socketId,
        "location_updatedAt": locationUpdatedAt.toIso8601String(),
        "district_id": districtId,
        "state_id": stateId,
        "approved_by": approvedBy,
        "rejected": rejected,
        "rejected_by": rejectedBy,
        "rejected_reason": rejectedReason,
        "blocked": blocked,
        "blocked_by": blockedBy,
        "blocked_reason": blockedReason,
        "is_deleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "ride_type": rideType.toJson(),
      };
}

class RideType {
  RideType({
    this.id,
    this.name,
    this.passengerCount,
    this.isGroup,
    this.count,
    this.iconUrl,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  int passengerCount;
  int isGroup;
  int count;
  String iconUrl;
  int isDeleted;
  DateTime createdAt;
  DateTime updatedAt;

  factory RideType.fromJson(Map<String, dynamic> json) => RideType(
        id: json["id"],
        name: json["name"],
        passengerCount: json["passenger_count"],
        isGroup: json["isGroup"],
        count: json["count"],
        iconUrl: json["icon_url"],
        isDeleted: json["is_deleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "passenger_count": passengerCount,
        "isGroup": isGroup,
        "count": count,
        "icon_url": iconUrl,
        "is_deleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
