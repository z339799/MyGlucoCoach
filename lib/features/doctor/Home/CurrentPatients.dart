import 'package:pfeproject/core/index.dart';
import 'package:pfeproject/features/doctor/Home/CurrentPatientDatails.dart';
import 'widgets/patient_card_widget.dart';

class Currentpatients extends StatelessWidget {
  const Currentpatients({super.key});

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
              ResponsiveGridList(
                  rowMainAxisAlignment: MainAxisAlignment.center,
                  minSpacing: 1,
                  shrinkWrap: true,
                  desiredItemWidth: 130.w,
                  children:
                      List.generate(6, (index) => const PatientCardWidget(
                        name: 'زكرياء',
                      )))
            ],
          ),
        ))),
      ),
    );
  }
}

class PatientCardWidget extends StatelessWidget {
  const PatientCardWidget({
    super.key, required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context
            .push(FadeSlidePageTransition(page: const CurrentPatientDetails()));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 32),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 170.h,
              width: 120.w,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: const Color(0xffD7DFFA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  verticalBox(16),
                  Text(
                    'المريض 1',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                  verticalBox(16),
                  Text(
                    'العمر: 25',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                  verticalBox(16),
                  Text(
                    'المرض: السكري',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.only(right: 8),
                    height: 50,
                    width: double.maxFinite,
                    color: const Color(0xff5C77E0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'الاسم $name',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -20,
              right: 16,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
