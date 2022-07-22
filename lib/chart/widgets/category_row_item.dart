import 'package:flutter/material.dart';

class CategoryRowItem extends StatelessWidget {
  final String categoryName;
  final String categoryAmount;

  const CategoryRowItem(
      {Key? key, required this.categoryName, required this.categoryAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Text(
            categoryName.toUpperCase(),
            style: const TextStyle(fontSize: 13.0, color: Colors.grey),
          ),
        ],
      ),
      const SizedBox(
        height: 4,
      ),
      Row(
        children: [
          Text(
            "\$$categoryAmount spent",
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      )
    ]);
  }
}
