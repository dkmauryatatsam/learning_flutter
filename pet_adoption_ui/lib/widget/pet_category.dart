import 'package:flutter/material.dart';

class PetCategory extends StatelessWidget {
  const PetCategory({
    Key? key,
  }) : super(key: key);

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
          const categoryCard(isSelected: false, categoryName: "Cats"),
          const categoryCard(isSelected: true, categoryName: "Dogs"),
          const categoryCard(isSelected: false, categoryName: "Birds"),
          const categoryCard(isSelected: false, categoryName: "Others"),
        ],
      ),
    );
  }
}

class categoryCard extends StatelessWidget {
  const categoryCard({
    Key? key,
    required this.isSelected,
    required this.categoryName,
  }) : super(key: key);

  final bool isSelected;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("$categoryName");
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        width: 80,
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).primaryColor
              : const Color(0xFFF8F2F7),
          borderRadius: BorderRadius.circular(20),
          border: isSelected
              ? Border.all(width: 8, color: const Color(0xFFFED8D3))
              : null,
        ),
        child: Center(
          child: Text(
            categoryName,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
