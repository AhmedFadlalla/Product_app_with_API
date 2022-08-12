class CategoriesModel{

  late bool status;
  late CategoriesDataModel data;

  CategoriesModel.fromJson(Map<String,dynamic>json){
    status=json['status'];
    data=CategoriesDataModel.fromJson(json['data']);
  }

}

class CategoriesDataModel{
   late int currentPage;
   List<ListOfCategoriesDataModel> categoriesData=[];
   late String firstPageURL;
   late String lastPageURL;
   late String path;
   late int previousPage;

   CategoriesDataModel.fromJson(Map<String,dynamic>json){
     currentPage=json['current_page'];
     json['data'].forEach((element){
       categoriesData.add(ListOfCategoriesDataModel.fromJson(element));
     });
     firstPageURL=json['first_page_url'];
     lastPageURL=json['last_page_url'];
     path=json['path'];
     previousPage=json['per_page'];
   }


}
class ListOfCategoriesDataModel{
 late int id;
 late String name;
 late String image;

 ListOfCategoriesDataModel.fromJson(Map<String,dynamic>json){
    id=json['id'];
    name=json['name'];
    image=json['image'];
 }

}