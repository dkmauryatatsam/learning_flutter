import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDF0F6),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Instagram",
                style: TextStyle(fontSize: 32, fontFamily: 'Billabong'),
              ),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.live_tv)),
                  const SizedBox(
                    width: 16,
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.send))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
