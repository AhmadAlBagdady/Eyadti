import 'package:departments/screens/shared/profile/cubit/cubit.dart';
import 'package:departments/shared/components/drop_down_list.dart';
import 'package:departments/shared/components/text.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:flutter/material.dart';

class PatientInfo extends StatelessWidget {
  const PatientInfo(
      {Key? key,
      required this.weight,
      required this.height,
      required this.cubit,
      required this.bloodGroup,
      required this.allergies,
      required this.diseases})
      : super(key: key);
  final int weight;
  final int height;
  final ProfileCubit cubit;
  final String bloodGroup;
  final List<String>? allergies;
  final List<String>? diseases;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 35 / 375),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Height',
                    style: Fonts.fBold(size: size.height * 13 / 812),
                  ),
                  SizedBox(
                    height: size.width * 10 / 375,
                  ),
                  Container(
                    width: size.width / 3,
                    height: size.height * 48 / 812,
                    decoration: BoxDecoration(
                      color: lightGrey.withOpacity(.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        '$height',
                        style: Fonts.fBold(
                            size: size.height * 14 / 812, color: grey),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Weight',
                    style: Fonts.fBold(size: size.height * 13 / 812),
                  ),
                  SizedBox(
                    height: size.width * 10 / 375,
                  ),
                  Container(
                    width: size.width / 3,
                    height: size.height * 48 / 812,
                    decoration: BoxDecoration(
                      color: lightGrey.withOpacity(.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        '$weight',
                        style: Fonts.fBold(
                            size: size.height * 14 / 812, color: grey),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: size.height * 28 / 812,
          ),
          Text(
            'Blood Group',
            style: Fonts.fBold(size: size.height * 13 / 812),
          ),
          SizedBox(
            height: size.height * 14 / 812,
          ),
          Container(
            width: size.width / 3,
            height: size.height * 48 / 812,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: lightGrey.withOpacity(0.3)),
            child: Center(
                child: Text(
              bloodGroup,
              style: Fonts.fBold(size: size.height * 14 / 812, color: grey),
            )),
          ),
          SizedBox(
            height: size.height * 28 / 812,
          ),
          Text(
            'Allergy :',
            style: Fonts.fBold(size: size.height * 13 / 812),
          ),
          SizedBox(
            height: size.height * 14 / 812,
          ),
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: size.width / 1.25,
                child: allergies == null
                    ? Container(
                        width: size.width / 1.25,
                        height: size.height * 70 / 812,
                        color: lightGrey.withOpacity(.3),
                        child: Center(
                          child: Text(
                            'None',
                            style: Fonts.fBold(
                                size: size.height * 24 / 812, color: grey),
                          ),
                        ))
                    : DataTable(
                        dataRowHeight: size.height * 35 / 812,
                        dividerThickness: 1,
                        headingRowColor:
                            MaterialStateProperty.all(dividerColor),
                        columnSpacing: 70,
                        columns: [
                          DataColumn(
                            label: Text(
                              'No',
                              style: Fonts.fBold(size: size.height * 13 / 812),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Name',
                              style: Fonts.fBold(size: size.height * 13 / 812),
                            ),
                          ),
                        ],
                        rows: List.generate(
                          allergies!.length,
                          (index) => DataRow(cells: [
                            DataCell(
                              Text(
                                '${index + 1}',
                                style: Fonts.fRegular(
                                  size: size.height * 14 / 812,
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                allergies![index],
                                style: Fonts.fRegular(
                                  size: size.height * 14 / 812,
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 28 / 812,
          ),
          Text(
            'Chronic Diseases :',
            style: Fonts.fBold(size: size.height * 13 / 812),
          ),
          SizedBox(
            height: size.height * 14 / 812,
          ),
          Center(
            child: SingleChildScrollView(
              child: SizedBox(
                width: size.width / 1.25,
                child: diseases == null
                    ? Container(
                        width: size.width / 1.25,
                        height: size.height * 70 / 812,
                        color: lightGrey.withOpacity(.3),
                        child: Center(
                          child: Text(
                            'None',
                            style: Fonts.fBold(
                                size: size.height * 24 / 812, color: grey),
                          ),
                        ))
                    : DataTable(
                        dataRowHeight: size.height * 35 / 812,
                        dividerThickness: 1,
                        headingRowColor:
                            MaterialStateProperty.all(dividerColor),
                        columnSpacing: 70,
                        columns: [
                          DataColumn(
                            label: Text(
                              'No',
                              style: Fonts.fBold(size: size.height * 13 / 812),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Name',
                              style: Fonts.fBold(size: size.height * 13 / 812),
                            ),
                          ),
                        ],
                        rows: List.generate(
                          diseases!.length,
                          (index) => DataRow(
                            cells: [
                              DataCell(
                                Text(
                                  '${index + 1}',
                                  style: Fonts.fRegular(
                                    size: size.height * 14 / 812,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text(
                                  diseases![index],
                                  style: Fonts.fRegular(
                                    size: size.height * 14 / 812,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 31 / 812,
          ),
        ],
      ),
    );
  }
}
