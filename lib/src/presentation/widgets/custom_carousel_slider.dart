import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_civix/src/core/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCarouselSlider extends StatefulWidget {
  final List<ItemCarouselSlider> items;
  const CustomCarouselSlider({required this.items});

  @override
  _CustomCarouselSliderState createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int _currentIndex = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            items: widget.items,
            options: CarouselOptions(
                viewportFraction: 1,
                height: 160,
                autoPlay: true,
                autoPlayCurve: Curves.easeInOut,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                })),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(widget.items, (index, url) {
              return Container(
                width: 6.0,
                height: 6.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? Colors.blue : Colors.grey),
              );
            }))
      ],
    );
  }
}

class ItemCarouselSlider extends StatelessWidget {
  final String? text;
  final String image;
  ItemCarouselSlider({this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Row(
          children: [
            SizedBox(width: 20),
            _buildImage(),
            SizedBox(width: 30),
            if (text != null)
              Expanded(
                  child: Text(
                text!,
                style: TextStyle(
                  fontSize: Constants.nomalTextSize,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              )),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }

  _buildImage() {
    if (image.endsWith('svg')) {
      return SvgPicture.asset(
        image,
        height: 90,
      );
    } else {
      return Image.asset(
        image,
        height: 90,
      );
    }
  }
}
