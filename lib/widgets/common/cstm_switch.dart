import 'package:flutter/material.dart';
import 'package:mwani/res/color.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final bool toggleColor;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    Key? key,
    this.value = true,
    this.toggleColor = true,
    required this.onChanged})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
        begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
        end: widget.value ? Alignment.centerLeft :Alignment.centerRight).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 45.0,
            height: 28.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: widget.toggleColor ? _circleAnimation.value ==
                  Alignment.centerLeft
                  ? Colors.grey
                  : AppColor.of(context).primary : AppColor.of(context).primary,),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
              child:  Container(
                alignment: widget.value
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}