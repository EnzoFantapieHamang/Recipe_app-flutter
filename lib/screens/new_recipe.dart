import 'package:flutter/material.dart';
import 'package:recipemanage/model/recipe.dart';

class NewRecipe extends StatefulWidget {
  NewRecipe({required this.onAddRecipe, super.key});

  final void Function(Recipe recipe) onAddRecipe;

  @override
  State<NewRecipe> createState() {
    return _NewRecipeState();
  }
}

class _NewRecipeState extends State<NewRecipe> {
  final title = TextEditingController();
  final origine = TextEditingController();

  List<TextEditingController> ingredientControllers = [TextEditingController()];
  Category _selectedCategory = Category.entree;

  void addIngredientField() {
    setState(() {
      ingredientControllers.add(TextEditingController());
    });
  }

  void submitData() {
    if (title.text.trim().isEmpty || origine.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Invalid input'),
            content: Text('Title or origin is empty.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
      return;
    }

    List<String> ingredients = ingredientControllers
        .map((controller) => controller.text.trim())
        .where((text) => text.isNotEmpty)
        .toList();

    if (ingredients.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Invalid input'),
            content: Text('At least one ingredient must be added.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
      return;
    }

    widget.onAddRecipe(
      Recipe(
        _selectedCategory,
        ingredients,
        title.text,
        origine.text,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    title.dispose();
    origine.dispose();
    for (var controller in ingredientControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
              controller: title,
              maxLength: 50,
              decoration: InputDecoration(label: Text('Title')),
            ),
            TextField(
              controller: origine,
              maxLength: 50,
              decoration: InputDecoration(label: Text('Origin')),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                for (var controller in ingredientControllers)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TextField(
                      controller: controller,
                      maxLength: 50,
                      decoration: InputDecoration(label: Text('Ingredient')),
                    ),
                  ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: addIngredientField,
                    icon: Icon(Icons.add),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                DropdownButton<Category>(
                  value: _selectedCategory,
                  items: Category.values
                      .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase()),
                          ))
                      .toList(),
                  onChanged: (Category? newCategory) {
                    if (newCategory != null) {
                      setState(() {
                        _selectedCategory = newCategory;
                      });
                    }
                  },
                ),
                Spacer(),
                TextButton(
                  onPressed: submitData,
                  child: Text("Save"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
