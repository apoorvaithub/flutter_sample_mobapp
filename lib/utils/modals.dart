import 'package:flutter/material.dart';
import 'package:test_app/utils/enums.dart';

class ListData {
  String title;
  Icon icon;
  MenuItem menuItem;
  ListData(this.title, this.icon, this.menuItem);
}

class HomeData {
  String title;
  Icon icon;
  ListItem type;

  HomeData(this.title, this.icon, this.type);
}
