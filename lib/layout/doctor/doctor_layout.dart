import 'package:departments/layout/shared/cubit/cubit.dart';
import 'package:departments/screens/shared/drawer/drawer.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/methods.dart';
import '../../shared/constant/color.dart';
import '../../shared/constant/constant.dart';
import 'doctorCubit/cubit.dart';
import 'doctorCubit/state.dart';

class DoctorLayout extends StatelessWidget {
  DoctorLayout({Key? key}) : super(key: key);

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
        create: (BuildContext context) => DoctorCubit(),
        child: BlocConsumer<DoctorCubit, DoctorStates>(
          listener: (context, state) {},
          builder: (context, state) {
            MainCubit mainCubit = MainCubit.get(context);
            return Scaffold(
              resizeToAvoidBottomInset: false,
              key: mainCubit.layoutKey,
              backgroundColor: white,
              drawer: CustomDrawer(

              ),
              body: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  mainCubit.doctorBottomNavScreen[mainCubit.currentIndex],
                  BottomNavBar(screens:mainCubit.doctorBottomNavScreen,cubit: mainCubit,icons: const[
                    [MyIcons.home__1_,MyIcons.home],
                    [MyIcons.calendar__1_,MyIcons.calendar],
                    [Icons.people,Icons.people_outline],
                    [MyIcons.document__1_,MyIcons.document],
                    [MyIcons.doctor__1_,MyIcons.doctor],
                  ],),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
