import 'package:departments/models/reports/get_single_report.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/widgets/custom_item_table.dart';
import 'package:flutter/material.dart';

class CustomInvoiceDetails extends StatelessWidget {
  const CustomInvoiceDetails(
      {Key? key,
      required this.status,
      required this.total,
      required this.dataOfInvTable})
      : super(key: key);
  final int status;
  final int total;
  final List<InvoiceTable> dataOfInvTable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 34 / 375,
        right: size.width * 35 / 375,
        top: size.height * 22 / 812,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Invoice Details',
            style: Fonts.fBold(size: 13),
          ),
          SizedBox(
            height: size.height * 19 / 812,
          ),
          Row(
            children: [
              Text(
                'Payment Status :',
                style: Fonts.fBold(size: 13),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 4 / 375),
                child: Icon(
                  Icons.square,
                  color: status == 1 ? red : green,
                  size: size.height * 20 / 812,
                ),
              ),
              Text(
                status == 1 ? 'Paid' : 'Un paid',
                style: Fonts.fRegular(size: size.height * 14 / 812),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 18.5 / 812,
          ),
          ItemsTable(
            itemsOfTable: dataOfInvTable,
            nameOfColumn: [
              'No.'
                  'Title',
              'Price',
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Sub total :',
                  style: Fonts.fBold(size: 13),
                ),
                SizedBox(
                  width: size.width * 16 / 375,
                ),
                Text(
                  '$total',
                  style: Fonts.fRegular(size: 14),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Discount :',
                  style: Fonts.fBold(size: 13),
                ),
                SizedBox(
                  width: size.width * 18 / 375,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Total price :',
                  style: Fonts.fBold(size: 13),
                ),
                SizedBox(
                  width: size.width * 8 / 375,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
