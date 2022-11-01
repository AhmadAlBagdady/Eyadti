import 'package:bloc/bloc.dart';
import 'package:departments/models/appointments/get_events_by_date.dart';
import 'package:departments/models/error%20model/error_model.dart';
import 'package:departments/models/news/get_blog_departments.dart';
import 'package:departments/models/news/get_posts_by_id.dart';
import 'package:departments/models/news/get_single_post.dart';
import 'package:departments/models/news/put_like.dart';
import 'package:departments/screens/shared/news/cubit/state.dart';
import 'package:departments/screens/shared/single%20post/cubit/state.dart';
import 'package:departments/shared/components/methods.dart';
import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/network/remote/dio_helper.dart';
import 'package:departments/shared/network/remote/end_point.dart';
import 'package:departments/shared/widgets/custom%20events%20dialog/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit() : super(EventsInitialState());

  static EventsCubit get(context) => BlocProvider.of(context);

  void getEvents(String date) {
    emit(EventsGetEventsLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper
        .postData(
            url: role == 'Patient'
                ? getPatientEventsByDateUrl
                : getDoctorEventsByDateUrl,
            data: {'date': date},
            token: token)
        .then((response) {
      if (response.statusCode! < 300) {
        late GetEventsByDate getEvents;
        getEvents = GetEventsByDate.fromJson(response.data);
        emit(EventsGetEventsSuccessState(getEvents));
      } else if (response.statusCode! < 500 && response.statusCode! > 300) {
        late ErrorModel errorModel;
        errorModel = ErrorModel.fromJson(response.data);
        emit(EventsGetEventsErrorState(errorModel));
      } else if (response.statusCode! >= 500) {
        showToast(msg: 'Error on server', color: red);
      }
    });
  }
}
