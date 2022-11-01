import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:flutter/material.dart';

class ItemsTable extends StatelessWidget {
  ItemsTable({Key? key, required this.itemsOfTable, required this.nameOfColumn})
      : super(key: key);

  List itemsOfTable;
  List<String> nameOfColumn;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
          border: TableBorder.symmetric(
              outside: BorderSide(color: lightBlue, width: 2)),
          dataRowHeight: size.height * 35 / 812,
          dividerThickness: 1,
          headingRowColor: MaterialStateProperty.all(dividerColor),
          columnSpacing: size.width * 23 / 375,
          columns: List.generate(
            nameOfColumns.length,
            (index) => DataColumn(
              label: Text(
                nameOfColumn[index],
                style: Fonts.fBold(size: size.height * 13 / 812),
              ),
            ),
          ),
          rows: List.generate(
              itemsOfTable.length,
              (index1) => DataRow(
                      cells: List.generate(
                    itemsOfTable.length,
                    (index2) => DataCell(
                      Text(
                        '${itemsOfTable[index1][index2]}',
                        style: Fonts.fRegular(
                          size: size.height * 14 / 812,
                        ),
                      ),
                    ),
                  )))),
    );
  }
}
