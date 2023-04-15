import 'package:flutter/cupertino.dart';

class Player {
  String id, name, position, imageUrl;
  DateTime createdAt;

  //* Constructor
  Player(
      {required this.position,
      required this.id,
      required this.imageUrl,
      required this.name,
      required this.createdAt});
}
