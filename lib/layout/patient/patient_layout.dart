import 'package:departments/layout/patient/patientCubit/state.dart';
import 'package:departments/layout/shared/cubit/cubit.dart';
import 'package:departments/screens/patient/add%20appointment/add_appointment.dart';
import 'package:departments/screens/shared/drawer/drawer.dart';
import 'package:departments/screens/shared/home/homeCubit/cubit.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/components/drawer_list_tile.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'patientCubit/cubit.dart';

class PatientLayout extends StatelessWidget {
  PatientLayout({Key? key}) : super(key: key);

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        final pop = await showWarning(context);
        return pop ?? false;
      },
      child: BlocProvider(
        create: (BuildContext context) => PatientCubit(),
        child: BlocConsumer<PatientCubit, PatientStates>(
          listener: (context, state) {},
          builder: (context, state) {
            MainCubit mainCubit = MainCubit.get(context);
            return Scaffold(
              resizeToAvoidBottomInset: false,
              key: mainCubit.layoutKey,
              backgroundColor: white,
              drawer: CustomDrawer(),
              body: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  mainCubit.patientBottomNavScreen[mainCubit.currentIndex],
                  BottomNavBar(
                    screens: mainCubit.patientBottomNavScreen,
                    cubit: mainCubit,
                    icons: const [
                      [MyIcons.home__1_, MyIcons.home],
                      [MyIcons.calendar__1_, MyIcons.calendar],
                      [MyIcons.document__1_, MyIcons.document],
                      [MyIcons.doctor__1_, MyIcons.doctor],
                    ],
                  ),
                ],
              ),
              floatingActionButton: mainButton(
                  onPressed: () {
                    print(mainCubit.currentIndex);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddAppointment()));
                  },
                  context: context),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            );
          },
        ),
      ),
    );
  }
}
