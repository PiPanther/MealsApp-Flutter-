// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummydata.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/widgets/categorygriditem.dart';
import 'package:mealsapp/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Meal> availableMeals;
  final void Function(Meal meal) onTogglefavorite;
  const CategoriesScreen(
      {super.key,
      required this.onTogglefavorite,
      required this.availableMeals});

  void _selectCategries(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return MealsScreen(
        title: category.title,
        meals: filteredMeals,
        onTogglefavorite: onTogglefavorite,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          // availableCategories.map((category) => CategoryGridItem(category : category))
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onselectCategory: () {
                _selectCategries(context, category);
              },
            ),
        ],
      ),
    );
  }
}
