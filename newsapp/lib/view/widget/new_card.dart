import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.publishedAt,
  }) : super(key: key);
  final String title;
  final String imageUrl;
  final String publishedAt;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 3),
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl == "null"
                        ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMD3C103GhHst7Hxl6acZ7NUL91h8NdawxjA&usqp=CAU"
                        : imageUrl,
                    fit: BoxFit.cover,
                    height: 150,
                    width: 140,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            publishedAt,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 11),
                          ),
                          Icon(
                            Icons.more_horiz,
                            color: Colors.white.withOpacity(0.8),
                          )
                        ],
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(title,
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w300)),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
