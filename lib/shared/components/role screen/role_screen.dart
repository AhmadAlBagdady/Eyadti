import 'package:departments/layout/doctor/doctor_layout.dart';
import 'package:departments/layout/patient/patient_layout.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:flutter/material.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      color: darkBlue,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => PatientLayout()));
              },
              minWidth: size.width / 3,
              height: size.height * 48 / 812,
              color: lightBlue,
              child: Text(
                'Patient',
                style: Fonts.fBold(size: size.height * 20 / 812, color: white),
              ),
            ),
            SizedBox(
              height: size.height * 200 / 812,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => DoctorLayout()));
              },
              minWidth: size.width / 3,
              height: size.height * 48 / 812,
              color: lightBlue,
              child: Text(
                'Doctor',
                style: Fonts.fBold(size: size.height * 20 / 812, color: white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
