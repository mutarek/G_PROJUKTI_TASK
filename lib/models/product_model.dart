class ProductModel{
  num? id;
  String? image;
  num? updated_selling_price;
  String? name;

  ProductModel({this.id, this.image, this.updated_selling_price, this.name});


  ProductModel.fromJson(dynamic json){
    id = json['id'];
    image = json['image'];
    updated_selling_price = json['updated_selling_price'];
    name = json['name'];
  }
}