import 'dart:async';
import 'package:departments/layout/doctor/doctor_layout.dart';
import 'package:departments/layout/patient/patient_layout.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 1), () {

      if(token.isEmpty){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      }
      else if(role == 'Patient'){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => PatientLayout()));
      }
      else if (role == 'Doctor'){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => DoctorLayout()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [lightBlue, darkBlue],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 55),
            child: Column(
              children: [
                Row(
                    children: List.generate(
                  6,
                  (index) => Padding(
                    padding: const EdgeInsets.all(4),
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.5),
                      radius: 4.5,
                    ),
                  ),
                )),
                const SizedBox(
                  height: 2.5,
                ),
                Row(
                    children: List.generate(
                  6,
                  (index) => Padding(
                    padding: const EdgeInsets.all(4),
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.5),
                      radius: 4.5,
                    ),
                  ),
                )),
              ],
            ),
          ),
          const Spacer(),
          Center(
            child: SizedBox(
              width: size.width / 1.5,
              height: size.height / 1.5,
              child: SvgPicture.asset(
                'assets/Logo.svg',
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: List.generate(
                    6,
                    (index) => Padding(
                      padding: const EdgeInsets.all(4),
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.5),
                        radius: 4.5,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: List.generate(
                    6,
                    (index) => Padding(
                      padding: const EdgeInsets.all(4),
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.5),
                        radius: 4.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
