import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                Hero(
                    tag: pets[0].id!,
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
                              image: AssetImage(pets[0].imageUrl!),
                              fit: BoxFit.cover)),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
