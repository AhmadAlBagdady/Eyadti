import 'package:departments/models/profile/get_doctor_profile.dart';
import 'package:departments/models/profile/get_general_profile.dart';
import 'package:departments/models/profile/get_patient_profile.dart';
import 'package:departments/screens/shared/profile/cubit/cubit.dart';
import 'package:departments/screens/shared/profile/cubit/state.dart';
import 'package:departments/screens/shared/edit%20profile/edit_profile.dart';
import 'package:departments/shared/components/buttons.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/my_icons.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/widgets/doctor_info.dart';
import 'package:departments/shared/widgets/patient_info.dart';
import 'package:departments/shared/widgets/person_info.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  GetGeneralProfile? getGeneralProfile;
  GetPatientProfile? getPatientProfile;
  GetDoctorProfile? getDoctorProfile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..profile(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileGetGeneralProfileSuccessState) {
            getGeneralProfile = state.getGeneralProfile;
          } else if (state is ProfileGetGeneralProfileErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }

          if (state is ProfileGetPatientProfileSuccessState) {
            getPatientProfile = state.getPatientProfile;
          } else if (state is ProfileGetPatientProfileErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }

          if (state is ProfileGetDoctorProfileSuccessState) {
            getDoctorProfile = state.getDoctorProfile;
          } else if (state is ProfileGetDoctorProfileErrorState) {
            showToast(msg: state.errorModel.message!, color: red);
          }
        },
        builder: (context, state) {
          ProfileCubit profileCubit = ProfileCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: Padding(
                padding: EdgeInsets.only(left: size.width / 14),
                child: appBarButton(
                    onPressed: () {
                      Navigator.of(context).pop(context);
                    },
                    size: size,
                    icon: MyIcons.angle_left),
              ),
              title: Text(
                LocaleKeys.myProfile.tr(),
                style:
                    Fonts.semiBold(size: size.height * 20 / 812, color: white),
              ),
              backgroundColor: lightBlue,
            ),
            body: getGeneralProfile == null ||
                    ((getPatientProfile == null && role == 'Patient') ||
                        (getDoctorProfile == null && role == 'Doctor'))
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        PersonInfo(
                          isItEdit: false,
                          gender: getGeneralProfile!.data!.gender ?? 3,
                          cubit: profileCubit,
                          first: getGeneralProfile!.data!.firstName ??
                              LocaleKeys.notExist.tr(),
                          father: getGeneralProfile!.data!.fatherName ??
                              LocaleKeys.notExist.tr(),
                          last: getGeneralProfile!.data!.lastName ??
                              LocaleKeys.notExist.tr(),
                          birth: getGeneralProfile!.data!.birthDate ??
                              LocaleKeys.notExist.tr(),
                          email: getGeneralProfile!.data!.email ??
                              LocaleKeys.notExist.tr(),
                          contactNumbers: listOfPhoneNumber(
                              getGeneralProfile!.data!.phones ?? []),
                        ),
                        role == 'Patient'
                            ? PatientInfo(
                                cubit: profileCubit,
                                weight: getPatientProfile!.data!.weight!,
                                height: getPatientProfile!.data!.height!,
                                allergies: getPatientProfile!.data!.allergies ??
                                    [LocaleKeys.notExist.tr()],
                                bloodGroup:
                                    getPatientProfile!.data!.bloodGroup ??
                                        LocaleKeys.notExist.tr(),
                                diseases: getPatientProfile!.data!.diseases ??
                                    [LocaleKeys.notExist.tr()],
                              )
                            : Container(),
                        role == 'Doctor'
                            ? DoctorInfo(
                                clinicName: getDoctorProfile!.data!.clinicName!,
                                yearsExp: getDoctorProfile!
                                        .data!.previousExperience ??
                                    0,
                                slotTime: getDoctorProfile!
                                    .data!.sessionDuration
                                    .toString(),
                                salary:
                                    getDoctorProfile!.data!.salary.toString(),
                                rate: getDoctorProfile!.data!.salaryRate
                                    .toString())
                            : Container()
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
