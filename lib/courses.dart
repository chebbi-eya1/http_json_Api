import 'package:flutter/cupertino.dart';

class courses {
  int id;
  String title;
  String description;
  Image image;
  String last_update;
  String instructors;
  String language;
  int price;
  courses({
    required this.id,required this.title,required this.description, required this.image, required this.last_update,required  this.instructors,required this.language,required this.price
  });


  factory courses.fromJson(Map<String , dynamic> json){
    return courses(id:json['id'], title:json['title'], description:json['description'], image:json['image'], last_update:json['last_update'], instructors:json['instructors'], language:json['language'], price:json['price']);
  }
}