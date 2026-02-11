import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pfeproject/core/helper/customBox.dart';

class CustomInfoInput extends StatelessWidget {
  const CustomInfoInput({
    super.key,
    required this.label,
    required this.width,
  });
  final String label;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            label,
            maxLines: 4,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          verticalBox(4),
          CustomTextField(width: width),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.width, this.controller, this.onSubmitted});

  final double width;
  final Function(String)? onSubmitted;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: 32.h,
      child: TextField(
        onSubmitted: onSubmitted,
        controller: controller,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 4),
          filled: true,
          fillColor: Theme.of(context).colorScheme.surface,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(
              color: Colors.blueAccent,
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
