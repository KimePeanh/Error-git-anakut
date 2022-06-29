

class PointModel {
  final int id;
  final String point;
  final String name;
  final String? image_url;
  

  factory PointModel.fromjson(Map<String, dynamic> json) {
    return PointModel(
      id: json['id'],
      point: json['points'],
      name: json['name'],
      image_url: json['image_url'] == null? null : json['image_url'],
      
    );
  }

  PointModel(
      {required this.id,
      required this.point,
      required this.name,
      required this.image_url,
     
      });
}
