import 'package:flutter/material.dart';
import 'package:pfeproject/core/helper/assets.dart';
import 'package:pfeproject/core/helper/extensions.dart';

class Custombg extends StatelessWidget {
  const Custombg({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: context.screenWidth,
      height: context.screenHeight,
      decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage(Assets.bg), fit: BoxFit.cover)),
      child: widget,
    );
  }
}
