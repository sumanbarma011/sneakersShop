import 'package:flutter/material.dart';
import 'package:sneaker_shop/models/sneakers_model.dart';
import 'package:sneaker_shop/views/shared/appstyle.dart';
import 'package:sneaker_shop/views/shared/new_shoes.dart';
import 'package:sneaker_shop/views/shared/product_card.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.height,
    required Future<List<Sneakers>> maleSneakers,
    required this.width,
  }) : _maleSneakers = maleSneakers;

  final double height;
  final Future<List<Sneakers>> _maleSneakers;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: height * 0.4025,
            child: FutureBuilder<List<Sneakers>>(
              future: _maleSneakers,
              builder: (context, snapshot) {
                if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text('Error is ${snapshot.error}'));
                } else {
                  final sneakers = snapshot.data;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sneakers!.length,
                    itemBuilder: (context, index) {
                      final shoe = snapshot.data![index];
                      return ProductCard(
                          category: shoe.category,
                          id: shoe.id,
                          name: shoe.name,
                          price: shoe.price,
                          image: shoe.imageUrl[0]);
                    },
                  );
                }
              },
            )),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest Shoes',
                style:
                    appstyle(20, Colors.black, FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    'Show All',
                    style: appstyle(
                        16, Colors.black, FontWeight.w500),
                  ),
                  const Icon(Icons.play_arrow)
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
            height: height * 0.15,
            child: FutureBuilder<List<Sneakers>>(
              future: _maleSneakers,
              builder: (context, snapshot) {
                final sneakerList = snapshot.data;
                if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sneakerList!.length,
                    itemBuilder: (context, index) {
                      final sneaker = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: NewShoes(
                          height: height,
                          width: width,
                          imageUrl: sneaker.imageUrl[0],
                        ),
                      );
                    },
                  );
                }
              },
            )),
      ],
    );
  }
}
