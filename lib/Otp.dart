import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_6/Homepage.dart';
import 'package:pinput/pinput.dart';

import 'check.dart';
class otp extends StatefulWidget {
  otp({Key? key}) : super(key: key);
  @override
  State<otp> createState() => _otpState();
}
class _otpState extends State<otp> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    var code = '';
    return Scaffold(
      backgroundColor: Color.fromARGB(188, 23, 26, 42),
      body: Container(
        margin: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              child: Text(
                'Enter OTP',
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
              'To keep connected with us please login with',
              style: TextStyle(color: Colors.white.withOpacity(0.2)),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              'your personal info',
              style: TextStyle(color: Colors.white.withOpacity(0.2)),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'OTP',
              style: TextStyle(color: Colors.white.withOpacity(0.3)),
            ),
            SizedBox(
              height: 10,
            ),
            Pinput(
              length: 6,
              // defaultPinTheme: defaultPinTheme,
              // focusedPinTheme: focusedPinTheme,
              // submittedPinTheme: submittedPinTheme,
              showCursor: true,
              onChanged: (value) {
                code = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text('Resend OTP in',
            style: TextStyle(
            color: Color.fromARGB(255, 50, 111, 52).withOpacity(0.7))),
            SizedBox(
              height: 60,
            ),
            RaisedButton(
              color: Colors.pink,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.all(0.0),
              onPressed: () async {
                try {
                  var signin;
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: signin.verify, smsCode: code);
                  // Sign the user in (or link) with the credential
                  await auth.signInWithCredential(credential);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => check()));
                } catch (e) {
                  print('Wrong OTP');
                }
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
                      "Let's Begin",
                      style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}
