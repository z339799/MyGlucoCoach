import 'package:pfeproject/features/auth/presentation/view/infoThree.dart';
import 'package:pfeproject/features/auth/presentation/view/widgets/DiseaseSelecotr.dart';
import 'package:pfeproject/features/onboarding/presentation/view/widgets/customButton.dart';

import '../../../../core/index.dart';

class InfoTwoScreen extends StatefulWidget {
  const InfoTwoScreen({super.key});

  @override
  State<InfoTwoScreen> createState() => _InfoTwoScreenState();
}

class _InfoTwoScreenState extends State<InfoTwoScreen> {
  bool isSelected1 = false;
  bool isSelected2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Custombg(
        widget: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset(
                    Assets.logo2,
                    width: 90.w,
                    fit: BoxFit.cover,
                  ),
                  verticalBox(24),
                  Text(
                    'مرحبا بكم في واجهة المرضى',
                    style: (Theme.of(context).textTheme.headlineLarge ?? const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)).copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'هل تعاني من أي أمراض اخرى؟',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  verticalBox(32),
                  DiseaseSelector(
                    title: 'نعم',
                    isSelected: isSelected1,
                    isIcon: true,
                    icon: Assets.yesIcon,
                    onTap: () {
                      setState(() {
                        isSelected2 = false;
                        isSelected1 = !isSelected1;
                      });
                    },
                  ),
                  verticalBox(12),
                  DiseaseSelector(
                    title: 'لا',
                    isSelected: isSelected2,
                    isIcon: true,
                    icon: Assets.noIcon,
                    onTap: () {
                      setState(() {
                        isSelected1 = false;
                        isSelected2 = !isSelected2;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                width: 180.w,
                child: CustomButton(
                  title: 'الصفحة التالية',
                  onTap: () {
                    context.push(
                        FadeSlidePageTransition(page: const InfoThreeScreen()));
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
