// ignore_for_file: non_constant_identifier_names

class BottomPropertyModel {
  String pro_id;
  String pro_name;
  String pro_coverd_area;
  String pro_location;
  String pro_bathroom;
  String pro_bedroom;
  String pro_floor;
  String pro_type;
  String pro_price;
  String pro_for;
  String pro_image;

  BottomPropertyModel(
      {required this.pro_id,
      required this.pro_name,
      required this.pro_coverd_area,
      required this.pro_location,
      required this.pro_bathroom,
      required this.pro_bedroom,
      required this.pro_floor,
      required this.pro_type,
      required this.pro_price,
      required this.pro_for,
      required this.pro_image});
  BottomPropertyModel.fromMap(Map<String, dynamic> map)
      : pro_id = map['pro_id'].toString(),
        pro_name = map['pro_name'].toString(),
        pro_coverd_area = map['pro_coverd_area'].toString(),
        pro_location = map['pro_location'].toString(),
        pro_bathroom = map['pro_bathroom'].toString(),
        pro_bedroom = map['pro_bedroom'].toString(),
        pro_floor = map['pro_floor'].toString(),
        pro_type = map['pro_type'].toString(),
        pro_price = map['pro_price'].toString(),
        pro_for = map['pro_for'].toString(),
        pro_image = map['pro_image'].toString();
}
