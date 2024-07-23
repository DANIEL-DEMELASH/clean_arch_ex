import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PostEntity extends Equatable {
  int? userId;
  int? id;
  String? title;
  String? body;
  
  PostEntity({
    this.userId,
    this.id,
    this.title,
    this.body
  });
  
  @override
  List<Object?> get props {
    return [
      userId,
      id,
      title,
      body
    ];
  }
}