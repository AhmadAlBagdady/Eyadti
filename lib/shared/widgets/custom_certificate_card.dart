import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:flutter/material.dart';

class CertificateCard extends StatelessWidget {
  const CertificateCard(
      {Key? key,
      required this.certificateName,
      required this.certificateSource,
      required this.country,
      required this.certificateDate,
      required this.certificateRating})
      : super(key: key);

  final String certificateName;
  final String certificateSource;
  final String country;
  final String certificateDate;
  final String certificateRating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: size.height * 30 / 812, horizontal: size.width * 34 / 375),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 20 / 375,
                vertical: size.height * 5 / 812),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  certificateName,
                  style: Fonts.fBold(
                      size: size.height * 14 / 812, color: darkBlue),
                ),
                Text(
                  '$certificateSource - $country',
                  style: Fonts.fBold(
                      size: size.height * 13 / 812, color: lightGrey),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: size.height * 14 / 812),
                  child: Row(
                    children: [
                      Text(
                        certificateDate,
                        style: Fonts.fBold(size: 13, color: grey),
                      ),
                      SizedBox(
                        width: size.width * 12 / 375,
                      ),
                      Text(
                        certificateRating,
                        style: Fonts.fBold(size: 13, color: green),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
