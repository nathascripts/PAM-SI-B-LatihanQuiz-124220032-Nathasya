import 'package:flutter/material.dart';
import 'dummy_menu.dart';

class HomePage extends StatelessWidget {
  final String username;
  final String? nickname;

  HomePage({Key? key, required this.username, this.nickname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Menu"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Selamat Datang, ${nickname ?? username}!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: foodMenuList.length,
              itemBuilder: (context, index) {
                final food = foodMenuList[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.asset(
                      food.imageAsset,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(food.name),
                    subtitle: Text('${food.category} - ${food.price}'),
                    trailing: IconButton(
                      icon: Icon(Icons.info_outline),
                      onPressed: () {
                        _showFoodDetails(context, food);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Log Out'),
            ),
          ),
        ],
      ),
    );
  }

  void _showFoodDetails(BuildContext context, FoodMenu food) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(food.name),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Category: ${food.category}'),
              Text('Description: ${food.description}'),
              Text('Ingredients: ${food.ingredients}'),
              Text('Cooking Time: ${food.cookingTime}'),
              Text('Price: ${food.price}'),
              SizedBox(height: 10),
              Image.asset(food.imageAsset, fit: BoxFit.cover),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
