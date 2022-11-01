class GetCertificatesById {
  GetCertificatesById({
    this.message,
    this.certificates,
  });

  String? message;
  List<Certificates>? certificates;

  GetCertificatesById.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    certificates = (json['data'] as List?)
        ?.map((dynamic e) => Certificates.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

class Certificates {
  Certificates({
    this.certificateName,
    this.certificateSource,
    this.country,
    this.certificateDate,
    this.certificateRating,
  });
  String? certificateName;
  String? certificateSource;
  String? country;
  String? certificateDate;
  String? certificateRating;

  Certificates.fromJson(Map<String, dynamic> json) {
    certificateName = json['certificate_name'];
    certificateSource = json['certificate_source'];
    country = json['country'];
    certificateDate = json['certificate_date'];
    certificateRating = json['certificate_rating'];
  }
}
