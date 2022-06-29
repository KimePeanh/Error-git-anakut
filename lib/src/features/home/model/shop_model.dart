class ShopModel {
  final int? id;
  final String? points;
  final String? name;
  final String? cover_url;
  final String? image_url;
  final String? percentage;
  final String? lat;
  final String? lng;
  final String? address_description;
  final String? distance;
  final String deeplink_url;
  factory ShopModel.fromjson(Map<String, dynamic> json) {
    return ShopModel(
      id: json["id"],
      points: json["points"],
      name: json["name"],
      cover_url: json["cover_url"],
      image_url: json["image_url"],
      percentage: json["promotion"]["percentage"],
      lat: json["address"]['lat'],
      lng: json["address"]["lng"],
      address_description: json["address"]["address_description"],
      distance: json["address"]["distance"],
      deeplink_url : json["deeplink_url"],
    );
  }
  ShopModel(
      {required this.id,
      required this.points,
      required this.name,
      required this.cover_url,
      required this.image_url,
      required this.percentage,
      required this.lat,
      required this.lng,
      required this.address_description,
      required this.distance, 
      required this.deeplink_url
      });
}
