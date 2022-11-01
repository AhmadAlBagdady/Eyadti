import 'package:departments/models/appointments/get_events_by_date.dart';
import 'package:departments/models/error%20model/error_model.dart';
abstract class EventsState{}

class EventsInitialState extends EventsState{}
class EventsGetEventsLoadingState extends EventsState{}
class EventsGetEventsSuccessState extends EventsState{
  final GetEventsByDate eventsByDate;
  EventsGetEventsSuccessState(this.eventsByDate);
}
class EventsGetEventsErrorState extends EventsState{
  final ErrorModel errorModel;
  EventsGetEventsErrorState(this.errorModel);
}
