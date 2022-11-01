import 'package:departments/layout/shared/cubit/cubit.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {Key? key,
      required this.screens,
      required this.cubit,
      required this.icons})
      : super(key: key);
  final List<Widget> screens;
  final List<List<dynamic>> icons;
  final MainCubit cubit;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          color: lightBlue,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      height: size.height / 15.3,
      width: size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 16 / 375),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(screens.length, (index) {
              return Padding(
                padding: EdgeInsets.only(

                 left: screens.length ==4 ?(index==1 ?0:index==screens.length-1?0:index==2?size.width*45/375:0):0,
                 right: screens.length==4?(index==1 ?size.width * 45 / 375:index==screens.length-1?0:index==2?0:0):0

                ),
                child: IconButton(
                    onPressed: () {
                      cubit.changeBottomNav(index);
                    },
                    icon: cubit.currentIndex == index
                        ? Icon(
                            icons[index][0],
                            color: white,
                          )
                        : Icon(
                            icons[index][1],
                            color: white,
                          )),
              );
            })),
      ),
    );
  }
}
