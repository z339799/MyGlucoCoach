import 'package:pfeproject/core/index.dart';
import 'package:pfeproject/features/doctor/Home/CurrentPatientDatails.dart';

import '../../auth/presentation/view/widgets/indexA.dart';
import '../../onboarding/presentation/view/widgets/customButton.dart';

class Patientdetails extends StatelessWidget {
  const Patientdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Custombg(
      widget: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [
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
                    value: 'محمد',
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
            verticalBox(24),
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InfoWidget(title: 'التحاليل', path: Assets.analysis),
                  InfoWidget(
                      title: 'بطاقة التعريف الوطنية', path: Assets.idCard2),
                ]),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DetailsContainer(
                  content: 'الوزن: 70 كغ',
                ),
                DetailsContainer(
                  content: 'الطول: 170 سم',
                )
              ],
            ),
            verticalBox(24),
            SizedBox(
                width: context.screenWidth * 0.7,
                child: const DetailsContainer(content: ':الأمراض الأخرى')),
            verticalBox(16),
            SizedBox(
                width: context.screenWidth * 0.7,
                child: const DetailsContainer(content: ': الدواء المتعاطى')),
            verticalBox(16),
            CustomButton(
              title: 'ملاحظات الاستشارة',
              onTap: () {},
            ),
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
    ));
  }
}

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({
    super.key,
    required this.content,
  });
  final String content;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12)),
        child: Text(content, style: Theme.of(context).textTheme.headlineSmall));
  }
}
