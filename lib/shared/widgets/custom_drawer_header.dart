import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/network/local/cach_helper.dart';
import 'package:flutter/material.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height / 3.35,
      child: DrawerHeader(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [lightBlue, darkBlue],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: Padding(
          padding: EdgeInsets.all(size.width / 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              role == 'Patient'
                  ? CircleAvatar(
                      radius: size.width / 12,
                      backgroundColor: white,
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: size.width / 12,
                          backgroundColor: white,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.monetization_on,
                              color: white,
                            )),
                      ],
                    ),
              SizedBox(
                height: size.height * 5 / 812,
              ),
              Text(
                CacheHelper.getData(key: 'name') ?? '',
                style: Fonts.semiBold(size: size.width / 17, color: white),
              ),
              SizedBox(
                height: size.height * 5 / 812,
              ),
              Text(
                '@${CacheHelper.getData(key: 'username')}',
                style: Fonts.fRegular(size: size.width / 25, color: white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
