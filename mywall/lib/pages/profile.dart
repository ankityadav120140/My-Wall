import 'package:flutter/material.dart';

var name;

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
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
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              "assets/bg.png",
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: double.infinity,
            ),
            Column(
              children: [
                Container(
                  child: Text(
                    'Create your profile',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(),
                  padding: EdgeInsets.all(40),
                  child: CircleAvatar(
                    radius: 100,
                    child: InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.person,
                        size: 100,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: TextField(
                    onChanged: (value) => name = value,
                    decoration: InputDecoration(
                      labelText: 'Enter Your Name',
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(),
                      hintText: 'Your Full Name',
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
                onTap: () {
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
