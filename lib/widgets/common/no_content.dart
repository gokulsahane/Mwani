import 'package:flutter/material.dart';
import 'package:mwani/res/image.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/widgets/lottie/custom.dart';

class NoContent extends StatelessWidget {
  final String? lottieAsset;
  final String? imageAsset;
  final String title;
  final String description;
  final Widget? actionButton;
  final bool showHeight;
  const NoContent({
    Key? key,
    this.lottieAsset,
    required this.title,
    required this.description,
    this.actionButton,
    this.imageAsset,
    this.showHeight = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (showHeight)
          SizedBox(
            height: screenSize(context).height * 0.1,
          ),
        imageAsset != null
            ? Image.asset(
          imageAsset!,
          height: screenSize(context).height * 0.25,
        )
            : CustomLottie(
          asset: lottieAsset ?? AppImg.of(context).emptyTable,
          height: screenSize(context).height * 0.25,
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            description,
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.center,
          ),
        ),
        if (actionButton != null) const SizedBox(height: 24),
        if (actionButton != null)
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: actionButton!)
      ],
    );
  }
}
