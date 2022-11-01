import 'package:departments/models/appointments/get_events_by_date.dart';
import 'package:departments/screens/shared/home/homeCubit/cubit.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:departments/shared/constant/translations/local_keys.dart';
import 'package:departments/shared/widgets/custom%20events%20dialog/cubit/cubit.dart';
import 'package:departments/shared/widgets/custom%20events%20dialog/cubit/state.dart';
import 'package:departments/shared/widgets/event_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


class EventsDialog extends StatelessWidget {
   EventsDialog({Key? key, required this.date}) : super(key: key);
  final String date;
GetEventsByDate ?getEventsByDate;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>EventsCubit()..getEvents(date),
      child: BlocConsumer<EventsCubit,EventsState>(
        listener: (context,state){
          if(state is EventsGetEventsSuccessState){
            getEventsByDate = state.eventsByDate;
          }
        },
        builder: (context,state){
          return AlertDialog(
            elevation: 0,
            contentPadding: EdgeInsets.all(0),
            content:

            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      lightBlue.withOpacity(0.9),
                      darkBlue.withOpacity(0.9)
                    ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
                width: 200,
                height: 300,
                child: Padding(
                  padding: EdgeInsets.all(size.height * 16 / 812),
                  child:
                  getEventsByDate == null?
                  const Center(child: CircularProgressIndicator()):
                  getEventsByDate!.data == null?
                  Center(
                    child: Padding(
                      padding:
                      const EdgeInsets.all(12.0),
                      child: Text(
                        LocaleKeys.noEvents.tr(),
                        style: Fonts.fBold(
                            size: size.height *
                                20 /
                                812,
                            color: white),
                      ),
                    ),
                  ):
                  ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: size.height * 15 / 812,
                      ),
                      itemCount: getEventsByDate!.data!.length,
                      itemBuilder: (context, index) => EventCard(
                        time: getEventsByDate!.data![index].time!,
                          title: role=='Patient'?'Dr.'+getEventsByDate!.data![index].name!:getEventsByDate!.data![index].name!,
                          status: getEventsByDate!.data![index].statue!,
                          date: getEventsByDate!.data![index].date!)),
                )),
            actionsAlignment: MainAxisAlignment.center,
            buttonPadding: EdgeInsets.all(0),
            actions: [
              MaterialButton(
                elevation: 0,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: darkBlue,
                child: Text(
                  LocaleKeys.back.tr(),
                  style: Fonts.fBold(size: 16, color: white),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
