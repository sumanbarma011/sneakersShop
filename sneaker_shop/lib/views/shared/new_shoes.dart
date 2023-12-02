import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class NewShoes extends StatelessWidget {
  const NewShoes({
    super.key,
    required this.height,
    required this.width,
    required this.imageUrl,

  });

  final double height;
  final double width;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Colors.black38, offset: Offset(0, 1), blurRadius: 0.3)
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      height: height * 0.13,
      width: width * 0.28,
      child: CachedNetworkImage(
          imageUrl:
              imageUrl),
    );
  }
}
