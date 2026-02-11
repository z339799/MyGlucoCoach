import 'package:flutter/material.dart';
import 'package:pfeproject/features/auth/presentation/view/infoFour.dart';
import 'package:pfeproject/features/auth/presentation/view/widgets/CustomInfoInput.dart';

import '../../../../core/index.dart';
import '../../../onboarding/presentation/view/widgets/customButton.dart';

class InfoThreeScreen extends StatelessWidget {
  const InfoThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Custombg(
        widget: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            children: [
              Image.asset(
                Assets.logo2,
                width: 90.w,
                fit: BoxFit.cover,
              ),
              verticalBox(24),
              Text(
                'مرحبا بكم في واجهة المرضى',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              verticalBox(32),
              const CustomInfoInput(
                label: 'يرجى تحديد المرض',
                width: 170,
              ),
              verticalBox(24),
              Text(
                'يرجى تحديد الدواء المتعاطى',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              verticalBox(16),
              const CustomTextField(
                width: 250,
              ),
              verticalBox(24),
              Text(
                'يرجى تحديد الجرعة المأخوذة',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              verticalBox(16),
              const CustomTextField(width: 250),
              const Spacer(),
              SizedBox(
                width: 180.w,
                child: CustomButton(
                  title: 'الصفحة التالية',
                  onTap: () {
                     context.push(
                        FadeSlidePageTransition(page: const InfoFourScreen()));
                  },
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
