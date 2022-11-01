import 'package:departments/models/complaints/get_my_malfunctions.dart';
import 'package:departments/screens/doctor/complaints/cubit/cubit.dart';
import 'package:departments/screens/doctor/complaints/cubit/state.dart';
import 'package:departments/screens/shared/search/search.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/widgets/complaint_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Complaints extends StatelessWidget {
  Complaints({Key? key}) : super(key: key);

  GetMyMalfunctions? getMyMalfunctions;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ComplaintsCubit()..getMyMalfunctions(),
      child: BlocConsumer<ComplaintsCubit, ComplaintsState>(
          listener: (context, state) {
        if (state is ComplaintsGetMyMalfunctionsSuccessState) {
          getMyMalfunctions = state.getMyMalfunctions;
        } else if (state is ComplaintsGetMyMalfunctionsErrorState) {
          showToast(msg: state.errorModel.message!, color: red);
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              elevation: 0,
              title: Text(
                LocaleKeys.complaints.tr(),
                style:
                    Fonts.semiBold(size: size.height * 20 / 812, color: white),
              ),
              backgroundColor: lightBlue,
              leading: Padding(
                padding: EdgeInsets.only(left: size.width / 14),
                child: appBarButton(
                    onPressed: () {
                      Navigator.of(context).pop(context);
                    },
                    size: size,
                    icon: MyIcons.angle_left),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                    right: size.width * 28 / 375,
                  ),
                  child: appBarButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Search(
                                  searchType: 'complaints',
                                )));
                      },
                      size: size,
                      icon: MyIcons.search),
                ),
              ]),
          body: state is ComplaintsGetMyMalfunctionsLoadingState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : getMyMalfunctions!.data == null
                  ? Center(
                      child: Text(
                        getMyMalfunctions!.message!,
                        style: Fonts.fBold(
                            size: size.height * 20 / 812, color: grey),
                      ),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) => Container(
                            color: veryLightBlue.withOpacity(0.2),
                            height: size.height / 81.2,
                          ),
                      itemBuilder: (context, index) => ComplaintCard(
                            title: getMyMalfunctions!.data![index].title!,
                            content: getMyMalfunctions!.data![index].content!,
                            status: getMyMalfunctions!.data![index].statues!,
                            time: getMyMalfunctions!.data![index].hoursAgo!,
                          ),
                      itemCount: getMyMalfunctions!.data!.length),
        );
      }),
    );
  }
}
