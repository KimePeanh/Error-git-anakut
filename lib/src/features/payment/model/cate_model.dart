class CompanyCateModel {
  final int category_id;
  final String category_name;

  factory CompanyCateModel.fromjson(Map<String, dynamic> json) {
    return CompanyCateModel(
      category_id: json['category_id'],
      category_name: json['category_name'],
    );
  }

  CompanyCateModel({required this.category_id, required this.category_name});
}

class CateDetail {
  final int company_id;
  final String company_name;
  final String company_logo;
  final String company_code;
  final String company_code_khr;

  factory CateDetail.fromjson(Map<String, dynamic> json) {
    return CateDetail(
      company_id: json['company_id'],
      company_name: json['company_name'],
      company_logo: json['company_logo'],
      company_code: json['company_code'],
      company_code_khr: json['company_code_khr'],
    );
  }

  CateDetail(
      {required this.company_id,
      required this.company_name,
      required this.company_logo,
      required this.company_code,
      required this.company_code_khr});
}
