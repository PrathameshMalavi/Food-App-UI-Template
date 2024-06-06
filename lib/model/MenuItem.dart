class MenuItem {
  String? title;
  String? subtitle;
  int? calories;
  double? price;
  String? image;
  int resultCount = -1;

  MenuItem({
    required this.title,
    required this.subtitle,
    required this.calories,
    required this.price,
    required this.image,
  });

  MenuItem.Result({required this.resultCount});

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      calories: json['calories'] ?? '',
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['calories'] = this.calories;
    data['price'] = this.price.toString();
    data['image'] = this.image;
    return data;
  }
}
