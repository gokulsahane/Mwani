import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class SwiperCard extends StatelessWidget {
  final String image;
  const SwiperCard({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Swiper(
        itemBuilder: (context, index) {
          return Image.asset(image);
        },
        viewportFraction: 0.9,
        indicatorLayout: PageIndicatorLayout.COLOR,
        autoplay: true,
        loop: false,
        itemCount: 5,
        control: const SwiperControl(
            color: Colors.transparent, disableColor: Colors.transparent),
      ),
    );
  }
}
