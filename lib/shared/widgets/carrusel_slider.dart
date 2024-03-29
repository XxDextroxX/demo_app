import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_app/config/config.dart';

import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key, required this.images});
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        options: CarouselOptions(
          autoPlay: images.length > 1 ? true : false,
          pageSnapping: true,
          enlargeCenterPage: true,
          viewportFraction: 1,
          aspectRatio: 0.9,
          initialPage: 0,
        ),
        itemCount: images.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            SizedBox(
                height: 500,
                width: double.infinity,
                child: FadeInImage(
                  image: NetworkImage(
                    images[itemIndex],
                  ),
                  fit: BoxFit.fitWidth,
                  placeholderFit: BoxFit.fitWidth,
                  placeholder: AssetImage(
                    AssetsName.noImage,
                  ),
                )));
  }
}
