class GetWorkingTimesById {
  String? message;
  Data? data;

  GetWorkingTimesById({this.message, this.data});

  GetWorkingTimesById.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  List<Sunday>? sunday;
  List<Monday>? monday;
  List<Tuesday>? tuesday;
  List<Wednesday>? wednesday;
  List<Thursday>? thursday;
  List<Friday>? friday;
  List<Saturday>? saturday;

  Data(
      {this.sunday,
      this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday,
      this.saturday});

  Data.fromJson(Map<String, dynamic> json) {
    sunday = (json['Sunday'] as List?)
        ?.map((dynamic e) => Sunday.fromJson(e as Map<String, dynamic>))
        .toList();
    monday = (json['Monday'] as List?)
        ?.map((dynamic e) => Monday.fromJson(e as Map<String, dynamic>))
        .toList();
    tuesday = (json['Tuesday'] as List?)
        ?.map((dynamic e) => Tuesday.fromJson(e as Map<String, dynamic>))
        .toList();
    wednesday = (json['Wednesday'] as List?)
        ?.map((dynamic e) => Wednesday.fromJson(e as Map<String, dynamic>))
        .toList();
    thursday = (json['Thursday'] as List?)
        ?.map((dynamic e) => Thursday.fromJson(e as Map<String, dynamic>))
        .toList();
    friday = List.from(json['Friday']).map((e) => Friday.fromJson(e)).toList();
    saturday = (json['Saturday'] as List?)
        ?.map((dynamic e) => Saturday.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

class Sunday {
  String? start;
  String? end;

  Sunday({this.start, this.end});

  Sunday.fromJson(Map<String, dynamic> json) {
    start = json['start'] as String?;
    end = json['end'] as String?;
  }
}

class Monday {
  String? start;
  String? end;

  Monday({this.start, this.end});

  Monday.fromJson(Map<String, dynamic> json) {
    start = json['start'] as String?;
    end = json['end'] as String?;
  }
}

class Tuesday {
  String? start;
  String? end;

  Tuesday({this.start, this.end});

  Tuesday.fromJson(Map<String, dynamic> json) {
    start = json['start'] as String?;
    end = json['end'] as String?;
  }
}

class Wednesday {
  String? start;
  String? end;

  Wednesday({this.start, this.end});

  Wednesday.fromJson(Map<String, dynamic> json) {
    start = json['start'] as String?;
    end = json['end'] as String?;
  }
}

class Thursday {
  String? start;
  String? end;

  Thursday({this.start, this.end});

  Thursday.fromJson(Map<String, dynamic> json) {
    start = json['start'] as String?;
    end = json['end'] as String?;
  }
}

class Friday {
  String? start;
  String? end;

  Friday({this.start, this.end});

  Friday.fromJson(Map<String, dynamic> json) {
    start = json['start'] as String?;
    end = json['end'] as String?;
  }
}

class Saturday {
  String? start;
  String? end;

  Saturday({this.start, this.end});

  Saturday.fromJson(Map<String, dynamic> json) {
    start = json['start'] as String?;
    end = json['end'] as String?;
  }
}
