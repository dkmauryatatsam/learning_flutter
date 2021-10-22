import 'package:flutter/material.dart';

class PetCategory extends StatefulWidget {
  const PetCategory({
    Key? key,
  }) : super(key: key);

  @override
  State<PetCategory> createState() => _PetCategoryState();
}

class _PetCategoryState extends State<PetCategory> {
  var selectedCard = "Dogs";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(
            width: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () => print("filter"),
                icon: const Icon(
                  Icons.search,
                  size: 35,
                )),
          ),
          categoryCard("Cats"),
          categoryCard("Dogs"),
          categoryCard("Birds"),
          categoryCard("Others"),
        ],
      ),
    );
  }

  Widget categoryCard(String categoryName) {
    return GestureDetector(
      onTap: () {
        selectCard(categoryName);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        width: 80,
        decoration: BoxDecoration(
            color: selectedCard == categoryName
                ? Theme.of(context).primaryColor
                : const Color(0xFFF8F2F7),
            borderRadius: BorderRadius.circular(20),
            border: selectedCard == categoryName
                ? Border.all(width: 8, color: const Color(0xFFFED8D3))
                : null,
            boxShadow: selectedCard == categoryName
                ? [
                    const BoxShadow(
                        color: Color(0xFFFED8D3),
                        blurRadius: 8,
                        spreadRadius: 2)
                  ]
                : null),
        child: Center(
          child: Text(
            categoryName,
            style: TextStyle(
                color:
                    selectedCard == categoryName ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}
