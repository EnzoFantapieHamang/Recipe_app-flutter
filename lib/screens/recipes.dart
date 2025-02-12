import 'package:flutter/material.dart';
import 'package:recipemanage/model/recipe.dart';
import 'package:recipemanage/screens/new_recipe.dart';
import 'package:recipemanage/widgets/recipe_list.dart';

class Recipes extends StatefulWidget {
  Recipes({super.key});

  @override
  State<Recipes> createState() {
    return _RecipesState();
  }
}

class _RecipesState extends State<Recipes> {
  final _registeredRecipes = [
    Recipe(
      Category.entree,
      ["salades", "tomates", "mozzarella"],
      "Italien",
      "Salade Italienne",
    ),
    Recipe(
      Category.dish,
      ["Pain à Burger", "steack", "salade", "tomate", "cheddar", "sauce"],
      "Américain",
      "Burger",
    ),
  ];

  void _openAddRecipe() {
    showModalBottomSheet(
      context: context,
      builder: (context) => NewRecipe(onAddRecipe: _addRecipe),
    );
  }

  void _addRecipe(Recipe recipe) {
    setState(() {
      _registeredRecipes.add(recipe);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: _openAddRecipe,
              icon: Icon(Icons.add),
            ),
          ],
          title: Text(
            "Recipe App",
          ),
        ),
        body: RecipeList(list: _registeredRecipes),
      );
  }
}
