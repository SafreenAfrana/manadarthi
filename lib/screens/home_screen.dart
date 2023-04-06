// ignore_for_file: prefer_const_constructors

import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:manadarthi/models/home/bottom_property_model.dart';
import 'package:manadarthi/models/home/home_property_model.dart';
import 'package:manadarthi/models/home/prime_property_model.dart';
import 'package:manadarthi/models/home/slider_model.dart';
import 'package:manadarthi/providers/home/bottom_property_provider.dart';
import 'package:manadarthi/providers/home/home_property_provider.dart';
import 'package:manadarthi/providers/home/prime_property_provider.dart';
import 'package:manadarthi/providers/home/slider_provider.dart';
import 'package:manadarthi/widgets/bottom_property_widget.dart';
import 'package:manadarthi/widgets/home_property_widget.dart';
import 'package:manadarthi/widgets/prime_property_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  String user;
  String pass;
  HomeScreen({super.key, required this.user, required this.pass});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<HomePropertyModel> homePropertyList = [];
  List<BottomPropertyModel> bottomPropertyList = [];
  List<PrimePropertyModel> primePropertyList = [];
  List<SliderModel> sliderList = [];
  final formKey = GlobalKey<FormBuilderState>();
  String? searchtext;
  @override
  Widget build(BuildContext context) {
    context.read<HomePropertyProvider>().loadData();
    context.read<BottomPropertyProvider>().loadData();
    context.read<PrimePropertyProvider>().loadData();
    context.read<SliderProvider>().loadData();

    homePropertyList = context.watch<HomePropertyProvider>().list;
    bottomPropertyList = context.watch<BottomPropertyProvider>().list;
    primePropertyList = context.watch<PrimePropertyProvider>().list;
    sliderList = context.watch<SliderProvider>().list;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 18, 45),
        title: Column(
          children: [
            Text("ManaDarthi",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1)),
            Text("INDIA'S NO 1 PROPERTY SALE",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1)),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications, size: 30, color: Colors.white))
        ],
        centerTitle: true,
      ),
      drawer: Drawer(),
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(0),
                color: Color.fromARGB(255, 2, 18, 45),
              ),
              child: Container(
                color: Colors.white,
                child: FormBuilder(
                  key: formKey,
                  child: FormBuilderTextField(
                    name: 'Search',
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //     // borderRadius: BorderRadius.circular(10),
                        //     ),
                        labelText: "Search By Location",
                        prefixIcon: IconButton(
                          icon: Icon(
                            Icons.location_on,
                            color: Color.fromARGB(255, 2, 18, 45),
                          ),
                          onPressed: () {},
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.search_rounded,
                            color: Color.fromARGB(255, 2, 18, 45),
                          ),
                          onPressed: () {},
                        )),
                    validator: FormBuilderValidators.compose([
                      // FormBuilderValidators.required(),
                    ]),
                    onChanged: (newValue) {
                      searchtext = newValue;
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FanCarouselImageSlider(
              imagesLink:
                  sliderList.map((e) => e.slider_img.toString()).toList(),
              isAssets: true,
              autoPlay: true,
              sliderHeight: 200,
              sliderWidth: double.infinity,
            ),
            homePropertyWidget(context, homePropertyList),
            SizedBox(
              height: 10,
            ),
            primePropertyWidget(context, primePropertyList),
            SizedBox(
              height: 10,
            ),
            bottomPropertyWidget(context, bottomPropertyList),
          ],
        ),
      ),
    );
  }
}
