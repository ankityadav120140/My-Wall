import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mywall/pages/profile.dart';

import 'login.dart';

var otp;

class verify extends StatefulWidget {
  const verify({Key? key}) : super(key: key);

  @override
  _verifyState createState() => _verifyState();
}

class _verifyState extends State<verify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Wall',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              "assets/bg.png",
            ),
          ),
        ),
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(top: 80, left: 80, right: 80, bottom: 40),
                  child: Image(
                    image: AssetImage(
                      "assets/logo.jpeg",
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Enter OTP you received on $num through SMS',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: TextField(
                    onChanged: (value) => otp = value,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'OTP',
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: InkWell(
                enableFeedback: true,
                onTap: () async {
                  //PhoneAuthCredential PhoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otp);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => profile()),
                  );
                },
                child: Text(
                  "Enter",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
