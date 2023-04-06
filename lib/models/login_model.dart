// ignore_for_file: non_constant_identifier_names

class LoginModel {
  String customer_id;
  String customer_name;
  String customer_email;
  String customer_mobile;
  String customer_location;
  String customer_password;
  String is_mobile_verified;
  String is_email_verified;
  String is_subscribed;
  String customer_status;
  String is_deleted;
  String created_dt;
  String updated_dt;

  LoginModel(
      {required this.customer_id,
      required this.customer_name,
      required this.customer_email,
      required this.customer_mobile,
      required this.customer_location,
      required this.customer_password,
      required this.is_mobile_verified,
      required this.is_email_verified,
      required this.is_subscribed,
      required this.customer_status,
      required this.is_deleted,
      required this.created_dt,
      required this.updated_dt});

  LoginModel.fromMap(Map<String, dynamic> map)
      : customer_id = map['customer_id'].toString(),
        customer_name = map['customer_name'].toString(),
        customer_email = map['customer_email'].toString(),
        customer_mobile = map['customer_mobile'].toString(),
        customer_location = map['customer_location'].toString(),
        customer_password = map['customer_password'].toString(),
        is_mobile_verified = map['is_mobile_verified'].toString(),
        is_subscribed = map['is_subscribed'].toString(),
        is_email_verified = map['is_email_verified'].toString(),
        customer_status = map['customer_status'].toString(),
        is_deleted = map['is_deleted'].toString(),
        created_dt = map['created_dt'].toString(),
        updated_dt = map['updated_dt'].toString();
}
