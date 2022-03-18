import 'package:flutter/cupertino.dart';
import 'package:training_app/models/category.dart';

class CategoriesProvider extends ChangeNotifier {
  final List<Category> _categories = [
    Category(title: 'All', isPressed: true),
    Category(title: 'Arms'),
    Category(title: 'Abs'),
    Category(title: 'Chest'),
    Category(title: 'Legs'),
    Category(title: 'Back'),
    Category(title: 'Shoulders'),
  ];

  String _activeCategory = 'All';
  late String selectedCategory = ' ';

  String get activeCategory => _activeCategory;
  List<Category> get categories => _categories;

  void Function()? toggle(index) {
    for (int i = 0; i < _categories.length; i++) {
      i == index ? _categories[i].active() : _categories[i].inActive();
    }
    _activeCategory = _categories[index].title;
    notifyListeners();
    return null;
  }
}
