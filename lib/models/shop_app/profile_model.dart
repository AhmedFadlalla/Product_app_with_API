class ProfileModel{

  late bool status;
  late DataModel data;

  ProfileModel.fromJson(Map<String,dynamic>json){
    status=json['status'];
    data=DataModel.fromJson(json['data']);


  }

}

class DataModel{

  late String name;
  late String email;
  late String phone;

  DataModel.fromJson(Map<String,dynamic>json){
    name=json['name'];
    email=json['email'];
    phone=json['phone'];

  }

}