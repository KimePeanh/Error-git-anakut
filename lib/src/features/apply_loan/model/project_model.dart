class ProjectModel {
  final int id;
  final String property_name;

  factory ProjectModel.formjson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      property_name: json["property_name"],
    );
  }

  ProjectModel({required this.id, required this.property_name});
}


class ItemtypeModel{
  final int id;
  final String name;
  final String name_kh;

  factory ItemtypeModel.fromjson(Map<String, dynamic> json){
    return ItemtypeModel(
      id : json['id'],
      name : json['name'],
      name_kh : json['name_kh'],
    );
  }

  ItemtypeModel({
    required this.id,
    required this.name,
    required this.name_kh
  });
}