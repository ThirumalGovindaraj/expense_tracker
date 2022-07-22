import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

// Menu
class Menu {
  Menu(
      {this.index = 0,
      required this.icon,
      required this.name,
      this.description = "",
      this.tag = ""});

  // index
  // @description Menu Index
  final int index;

  // icon
  // @description Menu Name
  final String icon;

  /// name
  /// @description Menu Name
  final String name;

  /// description
  /// @description Menu Additional Label or Description
  final String description;

  /// tag
  /// @description Menu Tag
  final String tag;

  /// page
  /// @description Widget Menu Page
// final Widget page;
}
