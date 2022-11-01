import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingDialog extends StatelessWidget {
  RatingDialog(
      {Key? key,
      required this.onRatingChanged,
      required this.onPressedContinue,
      required this.complement,
      required this.doctorName})
      : super(key: key);

  ValueChanged<double> onRatingChanged;
  Function() onPressedContinue;
  String complement;
  String doctorName;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.thankYou.tr(),
                  style: Fonts.fBold(size: 20, color: blue),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  LocaleKeys.feedBack.tr(),
                  style: Fonts.semiBold(size: 13, color: lightGrey),
                ),
                SizedBox(
                  height: 6,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                RatingBar.builder(
                    initialRating: 3,
                    minRating: 0,
                    maxRating: 10,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                        ),
                    onRatingUpdate: onRatingChanged),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Dr. $doctorName $complement',
                  style: Fonts.fRegular(size: 18, color: lightGrey),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: onPressedContinue,
                  child: Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45), color: green),
                    child: Center(
                      child: Text(
                        LocaleKeys.continueA.tr(),
                        style: Fonts.fRegular(size: 16, color: white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
