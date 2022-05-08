import 'package:flutter/material.dart';
import 'package:housing/pages/details/components/body.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage(
      {Key? key,
        required this.imageHousing,
        required this.title,
        required this.country,
        required this.price,
        required this.housingInfo})
      : super(key: key);

  final String imageHousing;
  final String title;
  final String country;
  final int price;
  final String housingInfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        imageHousing: imageHousing,
          title: title,
          country: country,
          price: price,
          housingInfo: housingInfo),
    );
  }
}
