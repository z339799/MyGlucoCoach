import 'package:flutter/material.dart';
import 'package:pfeproject/features/patient/Home/presentation/view/PatientHome.dart';
import 'package:pfeproject/features/auth/presentation/view/infoOne.dart';
import 'package:pfeproject/features/auth/presentation/view/widgets/indexA.dart';

import '../../../../core/index.dart';
import '../../../onboarding/presentation/view/widgets/customButton.dart';

class DiabetesType extends StatelessWidget {
  const DiabetesType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Custombg(
          widget: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  Assets.logo2,
                  width: 90.w,
                  fit: BoxFit.cover,
                ),
                InfoWidget(title: '', path: Assets.type1,
                onTap: () {
                  context.pushReplacement(
                          FadeSlidePageTransition(page: const InfoOneScreen(type: '1',)));
                },
                ),
                InfoWidget(title: '', path: Assets.type2,
                 onTap: () {
                  context.pushReplacement(
                          FadeSlidePageTransition(page: const InfoOneScreen(type: '2',)));
                },
                ),
                const Spacer(),
                SizedBox(
                  width: 180.w,
                  child: CustomButton(
                    title: 'الصفحة التالية',
                    onTap: () {
                      context.pushReplacement(
                          FadeSlidePageTransition(page: const PatientHome()));
                    },
                  ),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
