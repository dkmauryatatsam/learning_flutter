import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_adoption_ui/Screen/pet_adoption_screen.dart';

import 'package:pet_adoption_ui/model/pet_model.dart';
import 'package:pet_adoption_ui/widget/pet_category.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final TextEditingController locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 40, left: 40),
            child: CircleAvatar(
              child: ClipOval(
                child: Image(
                  height: 40,
                  width: 40,
                  image: AssetImage(owner.imageUrl!),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              style: TextStyle(fontSize: 22),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 30),
                    child: Icon(
                      Icons.add_location,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                  labelText: 'Location',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 20),
                  contentPadding: EdgeInsets.only(bottom: 20)),
            ),
          ),
          const PetCategory(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, bottom: 30),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PetAdoptionPage(
                                  pet: pets[0],
                                  heroTag: pets[0].imageUrl!,
                                )));
                  },
                  child: productCard(
                    image: pets[0].imageUrl!,
                    name: pets[0].name!,
                    description: pets[0].description!,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PetAdoptionPage(
                                  pet: pets[1],
                                  heroTag: pets[1].imageUrl!,
                                )));
                  },
                  child: productCard(
                    image: pets[1].imageUrl!,
                    name: pets[1].name!,
                    description: pets[1].description!,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class productCard extends StatelessWidget {
  const productCard({
    Key? key,
    required this.image,
    required this.name,
    required this.description,
  }) : super(key: key);
  final String image;
  final String name;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: image,
          child: Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
              IconButton(
                  onPressed: () => print("add to fav"),
                  icon: const Icon(
                    Icons.favorite_outline,
                    size: 35,
                    color: Colors.red,
                  ))
            ],
          ),
        ),
        Text(
          description,
          style: const TextStyle(
              color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
