enum Category {entree, dish, dessert}


class Recipe {
  Recipe(this.category, this.ingredients, this.origin, this.title);

  final String title;
  final String origin;
  final List<String> ingredients;
  final Category category;

}