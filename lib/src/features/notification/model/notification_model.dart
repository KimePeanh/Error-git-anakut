class NotificationModel {
  final int id;
  final String? message;
  final String? date;
  final String? title;
  final String? image_url;
  factory NotificationModel.fromjson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      message: json['message'],
      date: json['date'],
      title: json['title'],
      image_url: json["image_url"],
    );
  }
  NotificationModel({
    required this.id,
    required this.message,
    required this.date,
    required this.title,
    required this.image_url,
  });
}
