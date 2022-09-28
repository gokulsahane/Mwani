import 'package:flutter/material.dart';
import 'package:mwani/res/index.dart';
import 'package:mwani/widgets/common/card.dart';

class RequestNameCard extends StatelessWidget {
  final String title;
  final String image;
  final Function()? onTap;
  const RequestNameCard({
    Key? key,
    required this.title,
    required this.image,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: onTap,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.of(context).beach6),
                child: Image.asset(
                  image,
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                title,
                textAlign: TextAlign.center,
                style: AppText.of(context).bodyStyle2(
                    color: AppColor.of(context).secondaryGrey, size: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}