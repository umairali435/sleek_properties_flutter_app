class PropertyModel {
  int? id;
  String? title;
  String? address;
  String? description;
  String? price;
  int? bedrooms;
  int? bathrooms;
  int? sqft;
  String? propertyType;
  String? status;
  String? image;
  String? createdAt;
  String? updatedAt;

  PropertyModel(
      {this.id,
      this.title,
      this.address,
      this.description,
      this.price,
      this.bedrooms,
      this.bathrooms,
      this.sqft,
      this.propertyType,
      this.status,
      this.image,
      this.createdAt,
      this.updatedAt});

  PropertyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    address = json['address'];
    description = json['description'];
    price = json['price'];
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    sqft = json['sqft'];
    propertyType = json['property_type'];
    status = json['status'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['address'] = address;
    data['description'] = description;
    data['price'] = price;
    data['bedrooms'] = bedrooms;
    data['bathrooms'] = bathrooms;
    data['sqft'] = sqft;
    data['property_type'] = propertyType;
    data['status'] = status;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
