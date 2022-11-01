class IsBlogActive {
  String? message;
  bool? data;

  IsBlogActive({
    this.message,
    this.data,
  });

  IsBlogActive.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    data = json['data'] as bool?;
  }
}