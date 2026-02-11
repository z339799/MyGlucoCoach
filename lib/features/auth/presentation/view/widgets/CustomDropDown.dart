

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pfeproject/core/helper/enums.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<Gender>(
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(
              vertical: 8, horizontal: 8),
          constraints: BoxConstraints(
            minHeight: 32.h,
            maxHeight: 32.h,
          ),
          outlineBorder: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 2,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color:
                  Theme.of(context).colorScheme.secondary,
              width: 2,
            ),
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.surface,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(
              color: Colors.blueAccent,
              width: 2,
            ),
          ),
        ),
        hintText: 'Gender',
        width: 120.w,
        textStyle: Theme.of(context).textTheme.titleSmall!,
        menuStyle: MenuStyle(
          shape: const WidgetStatePropertyAll(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(12),
                bottom: Radius.circular(12)),
          )),
          side: WidgetStatePropertyAll(BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 2,
          )),
        ),
        dropdownMenuEntries: Gender.values
            .map<DropdownMenuEntry<Gender>>(
                (Gender gender) {
          return DropdownMenuEntry<Gender>(
              style: MenuItemButton.styleFrom(
                foregroundColor:
                    Theme.of(context).colorScheme.secondary,
                alignment: Alignment.centerRight,
              ),
              value: gender,
              label: gender.value);
        }).toList());
  }
}