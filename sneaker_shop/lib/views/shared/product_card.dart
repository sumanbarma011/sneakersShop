import 'package:flutter/material.dart';
import 'package:sneaker_shop/views/shared/appstyle.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {super.key,
      required this.image,
      required this.name,
      required this.category,
      required this.id,
      required this.price});
  final String image;
  final String name;
  final String category;
  final String id;
  final String price;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = true;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 20, 0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: height,
            width: width * 0.6,
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 1,
                blurRadius: 0.6,
                offset: Offset(1, 1),
              ),
            ]),
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    height: height * 0.23,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.image),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: null,
                      child: const Icon(Icons.favorite_outline),
                    ),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: appstylewithht(
                            26, Colors.black, FontWeight.bold, 1.1),
                      ),
                      Text(
                        widget.category,
                        style: appstylewithht(
                            18, Colors.grey, FontWeight.bold, 1.5),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.price.toString(),
                      style: appstyle(24, Colors.black, FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          'Colors',
                          style: appstyle(16, Colors.grey, FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ChoiceChip(
                          label: const Text(" "),
                          selected: isSelected,
                          selectedColor: Colors.orangeAccent,
                          // onSelected: ,
                          visualDensity: VisualDensity.compact,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
