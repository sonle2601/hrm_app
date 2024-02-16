class Province {
  final String name;
  final String fullName;
  final int id;

  Province({
    required this.name,
    required this.fullName,
    required this.id,
  });

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
      name: json['name_en'],
      fullName: json['full_name'],
      id: json['id'],
    );
  }
}

class District {
  final String name;
  final String fullName;
  final int id;

  District({
    required this.name,
    required this.fullName,
    required this.id,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      name: json['name_en'],
      fullName: json['full_name'],
      id: json['id'],
    );
  }
}

class Ward {
  final String name;
  final String fullName;
  final int id;

  Ward({
    required this.name,
    required this.fullName,
    required this.id,
  });

  factory Ward.fromJson(Map<String, dynamic> json) {
    return Ward(
      name: json['name_en'],
      fullName: json['full_name'],
      id: json['id'],
    );
  }
}
