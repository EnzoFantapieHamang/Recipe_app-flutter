import 'package:flutter/material.dart';
import 'package:recipemanage/model/recipe.dart';
import 'package:recipemanage/screens/recipe_detail.dart';

class RecipeList extends StatefulWidget {
  RecipeList({required this.list, super.key});

  final List<Recipe> list;

  @override
  State<RecipeList> createState() {
    return _RecipeListState();
  }
}

class _RecipeListState extends State<RecipeList> {



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (context, index) {
        return Dismissible(
          background: Container(
            color: Colors.red,
          ),
          key: ValueKey<Recipe>(widget.list[index]),
          onDismissed: (DismissDirection direction) {
            setState(() {
              widget.list.removeAt(index);
            });
          },
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecipeDetail(title: widget.list[index].title, ingredients: widget.list[index].ingredients)),
                    );
                  },
                  child: Card(
                    color: Color.fromARGB(255, 255, 229, 219),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            widget.list[index].title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on),
                              Text(widget.list[index].origin),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
