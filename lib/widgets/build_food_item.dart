import 'package:flutter/material.dart';
import 'package:food_app/models/food.dart';
import 'package:food_app/screens/restaurants_screen.dart';


class BuildFoodItem extends StatelessWidget {
  const BuildFoodItem({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final RestaurantsScreen widget;


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;

    return Expanded(
      child: GridView.count(
        physics: BouncingScrollPhysics(),
        crossAxisCount: 2,
        children: List.generate(widget.restaurant.menu.length, (index) {
          Food food = widget.restaurant.menu[index];
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 0.45*width,
                width: 0.45*width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    image: AssetImage(food.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 0.45*width,
                width: 0.45*width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [ 0.1, 0.4, 0.6, 0.9 ],
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black87.withOpacity(0.3),
                      Colors.black54.withOpacity(0.3),
                      Colors.black45.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
              Text(
                '${food.name}\n \$${food.price}',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              Positioned(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: (){},
                  ),
                ),
                bottom: 0.05*width,
                right: 0.05*width,
              ),
            ],
          );
        }),
      ),
    );
  }
}