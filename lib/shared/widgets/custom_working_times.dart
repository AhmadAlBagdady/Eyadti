import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/widgets/custom_work_days.dart';
import 'package:departments/shared/widgets/custom_work_hours.dart';
import 'package:flutter/cupertino.dart';

class WorkingTimes extends StatelessWidget {
  WorkingTimes(
      {Key? key, required this.workDays, required this.listOfWorkingTimes})
      : super(key: key);

  List listOfWorkingTimes;
  List<String> workDays;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WorkDays(days: workDays),
        SizedBox(
          height: size.height * 15.65 / 812,
        ),
        ListView.separated(
            itemCount: listOfWorkingTimes.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(
                  height: size.height * 13 / 812,
                ),
            itemBuilder: (context, index) => WorkHours(
                  mapOfWorkingTimes: listOfWorkingTimes[index],
                )),
      ],
    );
  }
}
