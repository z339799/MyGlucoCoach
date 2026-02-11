import 'package:flutter/material.dart';
import 'package:pfeproject/core/helper/constant.dart';
import 'package:pfeproject/features/patient/Home/presentation/view/PatientHome.dart';

import '../../../../core/index.dart';
import '../../../onboarding/presentation/view/widgets/customButton.dart';

class InfoFourScreen extends StatelessWidget {
  const InfoFourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Custombg(
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
                SizedBox(
                  width: context.screenWidth,
                  child: Text(
                    Constants.patientIntro,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(height: 2),
                    maxLines: 12,
                    textDirection: TextDirection.rtl,
                  ),
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
