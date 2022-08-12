


class HomeModel{
  late bool status;
  late ProductData data;

  HomeModel.fromJson(Map<String,dynamic> json){
    status=json['status'];
    data=ProductData.fromJson(json['data']);
  }
}

class ProductData{
    List<BannerModel>  banners=[];
    List<ProductModel> products=[];

  ProductData.fromJson(Map<String,dynamic> json){
    json['banners'].forEach((element){
      banners.add(BannerModel.fromJson(element));
    });
    json['products'].forEach((element){
      products.add(ProductModel.fromJson(element));
    });

  }
}

class BannerModel{
   late int id;
   late String image;

   BannerModel.fromJson(Map<String,dynamic> json){
    id=json['id'];
    image=json['image'];
  }
}

class ProductModel{
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late dynamic discount;
  late String image;
  late String name;
  late bool inFavorite;
  late bool inCart;

  ProductModel.fromJson(Map<String,dynamic> json){
    id=json['id'];
    price=json['price'];
    oldPrice=json['old_price'];
    discount=json['discount'];
    image=json['image'];
    name=json['name'];
    inFavorite=json['in_favorites'];
    inCart=json['in_cart'];
  }

  ProductModel(
      this.id,
      this.price,
      this.oldPrice,
      this.discount,
      this.image,
      this.name,
      this.inFavorite,
      this.inCart);

  Map<String,dynamic> toMap()
  {
    return
      {

        'id':id,
        'price':price,
        'oldPrice':oldPrice,
        'discount':discount,
        'image':image,
        'name':name,
        'inFavorite':inFavorite,
        'inCart':inCart,

      };

  }

}