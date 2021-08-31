import 'package:flutter/material.dart';
import 'package:gram_samruddhi/Screens/OtpVerificationScreen/components/body.dart';

class VerifyOtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: OtpVerificationBody(size: size),
    );
  }
}
