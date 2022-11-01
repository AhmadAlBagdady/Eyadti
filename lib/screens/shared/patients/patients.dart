import 'package:departments/models/doctor/get_my_patients.dart';
import 'package:departments/screens/shared/patients/cubit/cubit.dart';
import 'package:departments/screens/shared/patients/cubit/state.dart';
import 'package:departments/screens/shared/single%20patient/single_patient.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/widgets/custom_app_bar.dart';
import 'package:departments/shared/widgets/patient_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Patients extends StatelessWidget {
  Patients({Key? key}) : super(key: key);

  GetMyPatients? getMyPatients;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PatientsCubit()..getMyPatients(),
      child: BlocConsumer<PatientsCubit, PatientsState>(
          listener: (context, state) {
        if (state is PatientsGetMyPatientsSuccessState) {
          getMyPatients = state.getMyPatients;
        } else if (state is PatientsGetMyPatientsErrorState) {
          showToast(msg: state.errorModel.message!, color: red);
        }
      }, builder: (context, state) {
        return Scaffold(
          backgroundColor: white,
          appBar: CustomAppBar(title: LocaleKeys.myPatients.tr()),
          body: Container(
            height: size.height,
            width: size.width,
            child: getMyPatients == null
                ? const Center(child: CircularProgressIndicator())
                : getMyPatients!.patients == null
                    ? Center(
                        child: Text(
                          getMyPatients!.message!,
                          style: Fonts.fBold(
                              size: size.height * 20 / 812, color: grey),
                        ),
                      )
                    : ListView.separated(
                        separatorBuilder: (context, index) => Container(
                              color: veryLightBlue.withOpacity(0.2),
                              height: size.height / 81.2,
                            ),
                        itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SinglePatient(
                                        patientId:
                                            getMyPatients!.patients![index].id!,
                                      )));
                            },
                            child: PatientCard(
                              name: getMyPatients!.patients![index].name ??
                                  'no name',
                              age: getMyPatients!.patients![index].age ?? 0,
                              numOfAppointments: getMyPatients!
                                      .patients![index].appointmentsCount ??
                                  0,
                            )),
                        itemCount: 10),
          ),
        );
      }),
    );
  }
}
