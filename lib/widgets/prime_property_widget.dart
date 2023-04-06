// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:manadarthi/models/home/prime_property_model.dart';

Widget primePropertyWidget(
    BuildContext context, List<PrimePropertyModel> primePropertyList) {
  return Container(
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Exclusive For",
        style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: Colors.grey,
            letterSpacing: 1),
      ),
      SizedBox(
        height: 10,
      ),
      // ignore: prefer_const_literals_to_create_immutables
      Row(children: [
        Text(
          "Prime Members",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
              letterSpacing: 1),
        ),
        Spacer(),
        GestureDetector(
          child: Text(
            "View All",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
                letterSpacing: 1),
          ),
        )
      ]),
      SizedBox(
        height: 310.0,
        child: GridView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              childAspectRatio: 1,
              crossAxisSpacing: 0,
              mainAxisSpacing: 20),
          scrollDirection: Axis.horizontal,
          itemCount: primePropertyList.length,
          itemBuilder: (context, index) {
            return Container(
              width: 100,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 150,
                        child: Image(
                          fit: BoxFit.cover,
                          image:
                              NetworkImage(primePropertyList[index].pro_image),
                        ),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "₹${primePropertyList[index].pro_price} | ${primePropertyList[index].pro_coverd_area}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    primePropertyList[index].pro_location,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.grey,
                        letterSpacing: 1),
                  ),
                  Text(
                    "Get Pack and Move",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.grey,
                        letterSpacing: 1),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 20, 54, 112),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      minimumSize: Size(double.infinity, 40),
                    ),
                    child: Text(
                      "VIEW WITH PRIME",
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ]),
  );
}
