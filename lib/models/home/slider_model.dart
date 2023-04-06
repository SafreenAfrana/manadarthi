// ignore_for_file: non_constant_identifier_names

class SliderModel {
  String slider_img;
  String slider_url;

  SliderModel({required this.slider_img, required this.slider_url});

  SliderModel.fromMap(Map<String, dynamic> map)
      : slider_img = map['slider_img'].toString(),
        slider_url = map['slider_url'].toString();
}
