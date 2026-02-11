import 'package:pfeproject/core/index.dart';
import 'package:pfeproject/features/doctor/Home/PatientAnalytics.dart';
import 'package:pfeproject/features/doctor/Home/PatientConsulting.dart';
import 'package:pfeproject/features/doctor/Home/PatientDetails.dart';
import 'package:pfeproject/features/doctor/Home/PatientDiabetes.dart';
import 'package:pfeproject/features/auth/presentation/view/widgets/indexA.dart';
import 'package:pfeproject/features/onboarding/presentation/view/widgets/customButton.dart';

import 'PatientMealsDetails.dart';

class CurrentPatientDetails extends StatelessWidget {
  const CurrentPatientDetails({super.key});

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
              Text(
                'المرضى الحاليين',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              verticalBox(16),
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
              ),
              SizedBox(
                width: context.screenWidth,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RowDetails(
                      title: ':الاسم',
                      value: 'زكرياء',
                    ),
                    RowDetails(
                      title: ':العمر ',
                      value: '22',
                    ),
                    RowDetails(
                      title: ':تاريخ الاصابة',
                      value: ' 2006',
                    ),
                  ],
                ),
              ),
              verticalBox(16),
              ResponsiveGridList(
                  shrinkWrap: true,
                  desiredItemWidth: 130.w,
                  children: [
                    InfoWidget(
                        title: 'التحاليل و المعلومات الشخصية',
                        path: Assets.analysis,
                        onTap: () {
                          context.push(FadeSlidePageTransition(
                              page: const Patientdetails()));
                        }),
                    InfoWidget(
                      title: 'مواعيد و طلبات الاستشارة',
                      path: Assets.time,
                      onTap: () {
                        context.push(FadeSlidePageTransition(
                            page: const Patientconsulting()));
                      },
                    ),
                    InfoWidget(
                      title: 'سجل الوجبات',
                      path: Assets.patientsMeals,
                      onTap: () {
                        context.push(FadeSlidePageTransition(
                            page: const Patientanalytics(
                          title: 'سجل وجبات ',
                          widget: Patientmealsdetails(),
                        )));
                      },
                    ),
                    InfoWidget(
                      title: 'سجل القياسات',
                      path: Assets.analytics,
                      onTap: () {
                        context.push(FadeSlidePageTransition(
                            page: const Patientanalytics(
                          title: 'سجل قياسات المريض',
                          widget: Patientdiabetes(),
                        )));
                      },
                    ),
                  ]),
              const Spacer(),
              SizedBox(
                  width: 250.w,
                  child: CustomButton(
                    title: 'الرجوع',
                    onTap: () {
                      context.pop();
                    },
                  ))
            ],
          ),
        )),
      ),
    ));
  }
}

class RowDetails extends StatelessWidget {
  const RowDetails({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(value, style: (Theme.of(context).textTheme.headlineMedium ?? const TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
        Text(title, style: (Theme.of(context).textTheme.headlineMedium ?? const TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
      ],
    );
  }
}
