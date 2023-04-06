// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:manadarthi/screens/home_screen.dart';
import 'package:manadarthi/services/login_service.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormBuilderState>();

  bool showPass = true;
  String? username;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 18, 45),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
            ),
            Text("ManaDarthi",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 44,
                    fontWeight: FontWeight.bold)),
            Text("INDIA'S NO 1 PROPERTY SALE",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 150,
            ),
            Container(
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Login",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 20, 54, 112),
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    FormBuilder(
                        key: formKey,
                        child: Column(
                          children: [
                            FormBuilderTextField(
                              name: 'Mobile or Email',
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: "Mobile or Email",
                                hintText: "Enter Mobile or Email",
                              ),
                              validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required()]),
                              onChanged: (newValue) {
                                username = newValue;
                              },
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            FormBuilderTextField(
                              name: 'Password',
                              keyboardType: TextInputType.text,
                              obscureText: showPass,
                              validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required()]),
                              onChanged: (newValue) {
                                password = newValue;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelText: "Password",
                                  hintText: "Enter Password",
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        showPass = !showPass;
                                      });
                                    },
                                    child: Column(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "show",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 20, 54, 112),
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "Forget Password ?",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 20, 54, 112),
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                formKey.currentState!.save();
                                if (formKey.currentState!.validate()) {
                                  username = formKey
                                      .currentState!.fields["Mobile or Email"]
                                      .toString();
                                  password = formKey
                                      .currentState!.fields["Password"]
                                      .toString();
                                  loadApi(context, username!, password!);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 20, 54, 112),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                minimumSize: Size(double.infinity, 60),
                              ),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 1,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            RichText(
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              softWrap: true,
                              maxLines: 1,
                              textScaleFactor: 1,
                              text: TextSpan(
                                text: "Don't have an amount ? ",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: 'Register',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 20, 54, 112),
                                          letterSpacing: 1)),
                                ],
                              ),
                            )
                          ],
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void loadApi(
    context,
    String user,
    String pass,
  ) async {
    var response = await getLoginApi();
    var response1 = await getHomeApi();
    print(response1);
    // if (
    //     // response != null &&
    //     response1 != null) {

    homeScreen(context, user, pass);
    // }
  }

  void homeScreen(
    BuildContext context,
    user,
    pass,
  ) {
    Navigator.push(
        (context),
        MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen(
                  user: username!,
                  pass: password!,
                )));
    // (Route<dynamic> route) => false);
  }
}
