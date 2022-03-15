import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../models/category.dart';
import '../models/category_provider.dart';
import 'category_button.dart';

class CategoryButtons extends StatelessWidget {
  const CategoryButtons({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
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
