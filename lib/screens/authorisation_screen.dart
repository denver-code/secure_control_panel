import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:secure_control_panel/internal/services/hex2color.dart';

class AuthorisationScreen extends StatelessWidget {
  const AuthorisationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 1.8,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.white,
                    width: 2,
                  )),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 25,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.white, width: 2),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Authorisation",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // ignore: avoid_print
                                  print("BOOOOM!");
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Text(
                                    "X",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "SCP",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                  ),
                                ),
                                Text(
                                  "SecurePanel", //tryzub
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                                "Please enter your User Authentication Code",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17)),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 6,
                                  height: 34,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: TextFormField(
                                    style: const TextStyle(
                                        letterSpacing: 6.0,
                                        color: Colors.white),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(9),
                                    ],
                                    textAlign: TextAlign.center,
                                    cursorColor: Colors.white,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(5),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0)),
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.white),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0)),
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.white),
                                      ),
                                      focusColor: Colors.white,
                                      hintText:
                                          "Unique UAC", // pass the hint text parameter here
                                      hintStyle: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (() {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Row(
                                        children: const [
                                          Text(
                                              "This operation not avaible while you offline."),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          // CircularProgressIndicator(),
                                        ],
                                      )),
                                    );
                                  }),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width / 9,
                                    height: 34,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                    child: const Text(
                                      "OK",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        letterSpacing: 2.0,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            GestureDetector(
                              onTap: (() {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    "/desktop", (route) => false);
                              }),
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width / 6,
                                height: 34,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                child: const Text(
                                  "CONTINUE OFFLINE",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Column(
                              children: [
                                const Text(
                                  "Secure Control Panel",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                Container(
                                  // alignment: Alignment.center,
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                        left: 9.0, right: 9.0, top: 3),
                                    child: Text(
                                      "DENSEC SOLUTION",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
        bottomNavigationBar: Container(
            alignment: Alignment.centerRight,
            height: 27,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: HexColor.fromHex("#414141")),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 27,
                  width: 2.5,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "OFFLINE - HAVE NO SERVER CONNECTION",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            )));
  }
}
