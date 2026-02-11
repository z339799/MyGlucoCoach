import 'package:flutter/material.dart';
import 'package:pfeproject/core/helper/customBox.dart';

class DiseaseSelector extends StatelessWidget {
  const DiseaseSelector(
      {super.key,
      required this.title,
      this.onTap,
      required this.isSelected,
      this.isIcon = false,
      this.icon = ''});
  final String title;
  final Function()? onTap;
  final bool isSelected;
  final bool isIcon;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.surface,
            border: Border.all(
                color: Theme.of(context).colorScheme.secondary, width: 2),
            borderRadius: BorderRadius.circular(32)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            isIcon
                ? Image.asset(
                    icon,
                    height: 32,
                    width: 32,
                    color: isSelected
                        ? Theme.of(context).colorScheme.surface
                        : Theme.of(context).colorScheme.secondary,
                    fit: BoxFit.contain,
                  )
                : const SizedBox(
                    width: 1,
                  ),
            horizontalBox(12),
            Text(
              title,
              style: (Theme.of(context).textTheme.titleMedium ?? const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)).copyWith(
                    color: isSelected
                        ? Theme.of(context).colorScheme.surface
                        : Theme.of(context).colorScheme.primary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
