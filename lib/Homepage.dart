import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Otp.dart';

class signin extends StatefulWidget {
  signin({Key? key}) : super(key: key);

  static String verify = '';
  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  TextEditingController countrycode = TextEditingController();
  var Phone = '';
  @override
  void initState() {
    // TODO: implement initState
    countrycode.text = '+91';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(188, 23, 26, 42),
      body: Container(
        margin: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255).withOpacity(1),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Enter your personal details and start',
                style: TextStyle(color: Colors.white.withOpacity(0.2)),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'journey with us',
                style: TextStyle(color: Colors.white.withOpacity(0.2)),
              ),
              SizedBox(
                height: 28,
              ),
              Text(
                'Phone',
                style: TextStyle(
                  color: Color.fromARGB(123, 123, 148, 155).withOpacity(0.4),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    color: Color.fromARGB(163, 33, 38, 65),
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(width: 1, color: Colors.black)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countrycode,
                        style: TextStyle(color: Colors.white.withOpacity(0.5)),
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      '|',
                      style: TextStyle(
                        fontSize: 33,
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                      keyboardType: TextInputType.phone,
                      onChanged: ((value) {
                        Phone = value;
                      }),
                      style: TextStyle(color: Colors.white.withOpacity(0.5)),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Phone',
                          hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.5))),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('By continuing,you agree to the ',
                      style: TextStyle(color: Colors.white.withOpacity(0.5))),
                  Text('terms &',
                      style: TextStyle(
                          color: Color.fromARGB(255, 50, 111, 52)
                              .withOpacity(0.7))),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  Text('conditions ',
                      style: TextStyle(
                          color: Color.fromARGB(255, 50, 111, 52)
                              .withOpacity(0.7))),
                  Text('by logging in.',
                      style: TextStyle(color: Colors.white.withOpacity(0.5)))
                ],
              ),
              SizedBox(
                height: 370,
              ),
              RaisedButton(
                color: Colors.pink,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.all(0.0),
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '${countrycode.text + Phone}',
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {
                      signin.verify = verificationId;
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => otp()));
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                },
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(204, 225, 55, 69),
                        Color.fromARGB(187, 182, 18, 100)
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        width: 0.5, color: Color.fromARGB(183, 255, 255, 255)),
                  ),
                  child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 400,
                        minHeight: 50,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Verify Phone Number",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
