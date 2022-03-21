import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../models/provider/category_provider.dart';

class BuildCategoryItems extends StatefulWidget {
  const BuildCategoryItems({Key? key}) : super(key: key);

  @override
  State<BuildCategoryItems> createState() => _BuildCategoryItemsState();
}

Object? selected;
late String category;
final items = ['Arms', 'Abs', 'Chest', 'Legs', 'Back', 'Shoulders'];

class _BuildCategoryItemsState extends State<BuildCategoryItems> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Container(
      height: 35,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.white),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 2)
          ]),
      child: Row(
        children: [
          const Expanded(
            child: Text('Category:',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white)),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Center(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: selected,
                    icon: const FaIcon(
                      FontAwesomeIcons.angleDown,
                      color: kMainColor,
                    ),
                    items: items.map(buildMenuItem).toList(),
                    onChanged: (value) => setState(() {
                      selected = value;
                      Provider.of<CategoriesProvider>(context, listen: false)
                          .selectedCategory = value.toString();
                    }),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            color: kMainColor,
          ),
        ),
      );
}
