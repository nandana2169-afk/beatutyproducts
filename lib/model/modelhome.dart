import 'package:flutter/material.dart';

class CategoryModel {
  final String circleImage;
  final String gridImage;
  final String name;
  final String gridName;
  final String offer;
  final Widget destination;

  CategoryModel({
    required this.circleImage,
    required this.gridImage,
    required this.name,
    required this.gridName,
    required this.offer,
    required this.destination,
  });
}