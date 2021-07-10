import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mywall/pages/verify.dart';

var num;

class logIn extends StatefulWidget {
  const logIn({Key? key}) : super(key: key);

  @override
  _logInState createState() => _logInState();
}

class _logInState extends State<logIn> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  late String verificationId;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
        child: showLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: 80, left: 80, right: 80, bottom: 40),
                        child: Image(
                          image: AssetImage(
                            "assets/logo.jpeg",
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Enter your mobile number',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: TextField(
                          onChanged: (value) => num = value,
                          autofocus: true,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Contact number',
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
                        setState(() {
                          showLoading = true;
                        });

                        await _auth.verifyPhoneNumber(
                          phoneNumber: num,
                          verificationCompleted: (phoneAuthCredential) async {
                            setState(() {
                              showLoading = false;
                            });
                          },
                          verificationFailed: (verificationFailed) async {
                            setState(() {
                              showLoading = false;
                            });
                            _scaffoldKey.currentState!.showSnackBar(SnackBar(
                                content: Text(verificationFailed.code)));
                          },
                          codeSent: (verificationId, resendingToken) async {
                            setState(() {
                              showLoading = false;
                            });
                            this.verificationId = verificationId;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => verify()),
                            );
                          },
                          codeAutoRetrievalTimeout: (verificationId) async {},
                        );
                      },
                      child: Text(
                        "Get OTP",
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
