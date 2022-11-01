import 'package:departments/models/reports/get_single_report.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/widgets/custom_item_table.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomPrescriptionDetails extends StatelessWidget {
  const CustomPrescriptionDetails(
      {Key? key,
      required this.title,
      required this.description,
      required this.dataOfMedTable,
      required this.dataOfMedicalTable})
      : super(key: key);

  final String title;
  final String description;
  final List dataOfMedTable;
  final List dataOfMedicalTable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: size.height * 22 / 812,
          left: size.width * 34 / 375,
          right: size.width * 35 / 375),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LocaleKeys.prescriptionDetails.tr(),
              style: Fonts.fBold(size: size.height * 14 / 812)),
          SizedBox(
            height: size.height * 19 / 812,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.title.tr(),
                style: Fonts.fBold(size: size.height * 13 / 812),
              ),
              SizedBox(
                width: size.width * 12 / 375,
              ),
              SizedBox(
                width: size.width / 1.8,
                child: Wrap(
                  children: [
                    Text(
                      title,
                      maxLines: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * 19 / 812,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.description.tr(),
                style: Fonts.fBold(size: size.height * 13 / 812),
              ),
              SizedBox(
                width: size.width * 12 / 375,
              ),
              SizedBox(
                width: size.width / 1.8,
                child: Wrap(
                  children: [
                    Text(
                      description,
                      maxLines: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * 19 / 812,
          ),
          Text(
            LocaleKeys.medications.tr(),
            style: Fonts.fBold(size: 13),
          ),
          SizedBox(
            height: size.height * 18.5 / 812,
          ),
          ItemsTable(nameOfColumn: [
            LocaleKeys.name.tr(),
            LocaleKeys.numberOfCans.tr(),
            LocaleKeys.numberOfDoses.tr(),
            LocaleKeys.description.tr(),
          ], itemsOfTable: dataOfMedTable),
          SizedBox(
            height: size.height * 18.5 / 812,
          ),
          Text(
            LocaleKeys.testReports.tr(),
            style: Fonts.fBold(size: 13),
          ),
          SizedBox(
            height: size.height * 18.5 / 812,
          ),
          ItemsTable(nameOfColumn: [
            LocaleKeys.name.tr(),
            LocaleKeys.description.tr(),
          ], itemsOfTable: dataOfMedicalTable),
          SizedBox(
            height: size.height * 50.5 / 812,
          ),
        ],
      ),
    );
  }
}
