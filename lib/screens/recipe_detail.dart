import 'package:flutter/material.dart';

class RecipeDetail extends StatelessWidget {
  RecipeDetail({required this.title, required this.ingredients, super.key});

  final String title;
  final List<String> ingredients;

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Recipe App",
          ),
        ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              title,
              style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
            
            ),
          ),
          ...[for (int i = 0; i<ingredients.length; i++)
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 0, 0),
                child: Text(ingredients[i],
                    style: TextStyle(
                      fontSize: 20,
                    )
                ),
              ),
            ],
          )
          ]
        ],
      ),
    );
  }
}