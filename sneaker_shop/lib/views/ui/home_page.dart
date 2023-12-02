import 'package:flutter/material.dart';
import 'package:sneaker_shop/models/sneakers_model.dart';
import 'package:sneaker_shop/views/shared/appstyle.dart';
import 'package:sneaker_shop/views/shared/home_widget.dart';
import 'package:sneaker_shop/services/helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 3, vsync: this);
  late Future<List<Sneakers>> _maleSneakers;
  late Future<List<Sneakers>> _femaleSneakers;
  late Future<List<Sneakers>> _kidsSneakers;

  void getMaleSneaker() {
    _maleSneakers = Helper().getMaleSneakers();
  }

  void getFemaleSneaker() {
    _femaleSneakers = Helper().getFemaleSneakers();
  }

  void getkidsSneaker() {
    _kidsSneakers = Helper().getKidsSneakers();
  }

  @override
  void initState() {
    super.initState();
    getMaleSneaker();
    getFemaleSneaker();
    getkidsSneaker();
  }

  @override
  Widget build(BuildContext context) {
    @override
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: height,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: height * 0.4,
              decoration: const BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/top_image.png',
                  ),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 8, right: 15),
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Adidas Original Collection of shoes',
                      style: appstyle(
                        32,
                        Colors.white,
                        FontWeight.bold,
                      ),
                    ),
                    TabBar(
                        indicatorPadding: EdgeInsets.zero,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.transparent,
                        controller: tabController,
                        isScrollable: true,
                        labelColor: Colors.white,
                        labelStyle: appstyle(20, Colors.white, FontWeight.bold),
                        unselectedLabelColor: Colors.grey.withOpacity(0.3),
                        tabs: const [
                          Text('Mens shoes'),
                          Text('Women shoes'),
                          Text('Kids shoes')
                        ]),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.265),
              child: Container(
                padding: const EdgeInsets.only(left: 18),
                child: TabBarView(controller: tabController, children: [
                  HomeWidget(
                      height: height,
                      maleSneakers: _maleSneakers,
                      width: width),
                  HomeWidget(
                    height: height,
                    maleSneakers: _femaleSneakers,
                    width: width,
                  ),
                  HomeWidget(
                    height: height,
                    maleSneakers: _kidsSneakers,
                    width: width,
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
