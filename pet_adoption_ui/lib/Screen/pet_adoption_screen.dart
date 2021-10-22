// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:pet_adoption_ui/model/pet_model.dart';

class PetAdoptionPage extends StatelessWidget {
  const PetAdoptionPage({
    Key? key,
    required this.pet,
    required this.heroTag,
  }) : super(key: key);
  final Pet pet;
  final String heroTag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: heroTag,
                  child: SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Image.asset(
                      pet.imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 30,
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pet.name!,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                      onPressed: () => print("add to fav"),
                      icon: const Icon(
                        Icons.favorite,
                        size: 35,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                pet.description!,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  petDetail(title: "Age", petInfo: pet.age.toString()),
                  petDetail(title: "Sex", petInfo: pet.sex!),
                  petDetail(title: "Color", petInfo: pet.color!),
                  petDetail(title: "Id", petInfo: pet.id.toString()),
                ],
              ),
            ),
            OwnerDetailCard(
              ownerImage: pet.owner!.imageUrl!,
              ownerName: pet.owner!.name!,
              distance: "1.68 km",
              ownerDetail: pet.owner!.bio!,
            ),
          ],
        ),
        Positioned(
          bottom: 10,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F2F7),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const Icon(
                    Icons.arrow_upward_outlined,
                    size: 35,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                          width: 10, color: const Color(0xFFFED8D3))),
                  child: const Center(
                      child: Text(
                    "ADOPTION",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w700),
                  )),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class petDetail extends StatelessWidget {
  const petDetail({
    Key? key,
    required this.title,
    required this.petInfo,
  }) : super(key: key);
  final String title;
  final String petInfo;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F2F7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.red, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            petInfo,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class OwnerDetailCard extends StatelessWidget {
  const OwnerDetailCard({
    Key? key,
    required this.ownerImage,
    required this.ownerName,
    required this.distance,
    required this.ownerDetail,
  }) : super(key: key);
  final String ownerImage;
  final String ownerName;
  final String distance;
  final String ownerDetail;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 30, left: 40),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: const BoxDecoration(
                color: Color(0xFFF1C685),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Center(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(ownerImage),
                  ),
                  title: Text(
                    ownerName,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                  subtitle: const Text(
                    "Owner",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w800),
                  ),
                  trailing: Text(
                    distance,
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Text(
                ownerDetail,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    letterSpacing: 1,
                    height: 1.4,
                    fontWeight: FontWeight.w500),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ));
  }
}
