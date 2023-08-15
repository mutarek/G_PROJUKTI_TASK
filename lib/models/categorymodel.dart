class CategoryModel {
  String? name;
  String? slug;
  List<Categories>? categories;

  CategoryModel(this.name, this.slug, this.categories);

  CategoryModel.fromJson(dynamic json) {
    name = json['name'];
    slug = json['slug'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
  }
}

class Categories {
  String? name;
  String? logo;
  String? slug;

  Categories(this.name, this.logo);

  Categories.fromJson(dynamic json) {
    name = json['name'];
    logo = json['logo'];
    logo = json['slug'];
  }
}
