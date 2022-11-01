class GetSingleReport {
  GetSingleReport({
    this.message,
    this.data,
  });
  String? message;
  Data? data;

  GetSingleReport.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = (json['data'] as Map<String, dynamic>?) != null
        ? Data.fromJson(json['data'] as Map<String, dynamic>)
        : null;
  }
}

class Data {
  Data({
    required this.sessionDetails,
    required this.patientDetails,
    required this.doctorDetails,
    required this.prescriptionDetails,
    required this.medications,
    required this.medicalAnalyses,
    required this.invoiceDetails,
  });
  SessionDetails? sessionDetails;
  PatientDetails? patientDetails;
  DoctorDetails? doctorDetails;
  PrescriptionDetails? prescriptionDetails;
  List<Medications>? medications;
  List<MedicalAnalyses>? medicalAnalyses;
  InvoiceDetails? invoiceDetails;

  Data.fromJson(Map<String, dynamic> json) {
    sessionDetails = (json['session_details'] as Map<String, dynamic>?) != null
        ? SessionDetails.fromJson(
            json['session_details'] as Map<String, dynamic>)
        : null;
    patientDetails = (json['patient_details'] as Map<String, dynamic>?) != null
        ? PatientDetails.fromJson(
            json['patient_details'] as Map<String, dynamic>)
        : null;
    doctorDetails = (json['doctor_details'] as Map<String, dynamic>?) != null
        ? DoctorDetails.fromJson(json['doctor_details'] as Map<String, dynamic>)
        : null;
    prescriptionDetails =
        (json['prescription_details'] as Map<String, dynamic>?) != null
            ? PrescriptionDetails.fromJson(
                json['prescription_details'] as Map<String, dynamic>)
            : null;
    medications = (json['medications'] as List?)
        ?.map((dynamic e) => Medications.fromJson(e as Map<String, dynamic>))
        .toList();
    medicalAnalyses = (json['medical_analyses'] as List?)
        ?.map(
            (dynamic e) => MedicalAnalyses.fromJson(e as Map<String, dynamic>))
        .toList();
    invoiceDetails = (json['invoice_details'] as Map<String, dynamic>?) != null
        ? InvoiceDetails.fromJson(
            json['invoice_details'] as Map<String, dynamic>)
        : null;
  }
}

class SessionDetails {
  SessionDetails({this.id, this.isReview, this.sessionDate});
  int? id;
  int? isReview;
  String? sessionDate;

  SessionDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isReview = json['is_review'];
    sessionDate = json['session_date'];
  }
}

class PatientDetails {
  PatientDetails({this.name, this.phones, this.email});
  String? name;
  String? phones;
  String? email;

  PatientDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phones = json['phones'];
    email = json['email'];
  }
}

class DoctorDetails {
  DoctorDetails({this.name, this.clinicName, this.phones, this.email});
  String? email;
  String? name;
  String? clinicName;
  List<String>? phones;

  DoctorDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    clinicName = json['clinic_name'];
    email = json['email'];
    phones = json['phones'];
  }
}

class PrescriptionDetails {
  PrescriptionDetails({
    this.title,
    this.description,
  });
  String? title;
  String? description;

  PrescriptionDetails.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }
}

class Medications {
  Medications({
    this.name,
    this.numberOfDoses,
    this.doseDescription,
    this.numberOfCans,
  });
  String? name;
  int? numberOfDoses;
  String? doseDescription;
  int? numberOfCans;

  Medications.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    numberOfDoses = json['number_of_doses'];
    doseDescription = json['dose_description'];
    numberOfCans = json['number_of_cans'];
  }
}

class MedicalAnalyses {
  MedicalAnalyses({
    this.name,
    this.description,
  });
  String? name;
  String? description;

  MedicalAnalyses.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
  }
}

class InvoiceDetails {
  InvoiceDetails({
    this.isPaid,
    this.invoiceTable,
    this.totalPrice,
  });
  int? isPaid;
  List<InvoiceTable>? invoiceTable;
  int? totalPrice;

  InvoiceDetails.fromJson(Map<String, dynamic> json) {
    isPaid = json['is_paid'];
    invoiceTable = (json['invoice_table'] as List?)
        ?.map((dynamic e) => InvoiceTable.fromJson(e as Map<String, dynamic>))
        .toList();
    totalPrice = json['total_price'];
  }
}

class InvoiceTable {
  InvoiceTable({
    this.title,
    this.price,
  });
  String? title;
  int? price;

  InvoiceTable.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
  }
}
