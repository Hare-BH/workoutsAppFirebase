import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../models/category.dart';
import '../models/provider/category_provider.dart';
import 'category_button.dart';

class CategoryButtons extends StatelessWidget {
  const CategoryButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Category> categories =
        Provider.of<CategoriesProvider>(context).categories;
    return SizedBox(
      height: 40,
      child: ListView.builder(
          physics: const ScrollPhysics(
              parent: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics())),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Provider.of<CategoriesProvider>(context, listen: false)
                      .toggle(index);
                },
                child: CategoryButton(category: categories[index]));
          }),
    );
  }
}
