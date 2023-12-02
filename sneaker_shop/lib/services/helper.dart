import 'package:flutter/services.dart' as the_bundle;
import 'package:sneaker_shop/models/sneakers_model.dart';

class Helper {
  Future<List<Sneakers>> getMaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/men_shoes.json');
    final maleSneakerList = sneakersFromJson(data);
    return maleSneakerList;
  }

  Future<List<Sneakers>> getFemaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/women_shoes.json');
    final femaleSneakerList = sneakersFromJson(data);
    return femaleSneakerList;
  }

  Future<List<Sneakers>> getKidsSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/kids_shoes.json');
    final kidsSneakerList = sneakersFromJson(data);
    return kidsSneakerList;
  }
  //single male sneaker
   Future<Sneakers> getMaleSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/men_shoes.json');
    final singleMaleSneaker = sneakersFromJson(data).firstWhere((element) => element.id==id);
    return singleMaleSneaker;
  }

  //single female sneaker
   Future<Sneakers> getFemaleSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/women_shoes.json');
    final singleFemaleSneaker = sneakersFromJson(data).firstWhere((element) => element.id==id);
    return singleFemaleSneaker;
  }

//single kids sneaker
   Future<Sneakers> getKidsSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/kids_shoes.json');
    final singleKidSneaker = sneakersFromJson(data).firstWhere((element) => element.id==id);
    return singleKidSneaker;
  }


}
