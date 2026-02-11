import 'package:pfeproject/core/index.dart';
import 'package:pfeproject/features/doctor/Home/NewPatients.dart';
import 'package:pfeproject/features/auth/presentation/view/widgets/indexA.dart';

import 'CurrentPatients.dart';

class Doctorhome extends StatelessWidget {
  const Doctorhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.profile);
            },
          ),
        ],
      ),
      body: Custombg(
          widget: SafeArea(
              child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [
            Image.asset(
              Assets.logo2,
              width: 120.w,
              fit: BoxFit.cover,
            ),
            verticalBox(24),
            verticalBox(8),
            Text(
              'مرحبا بكم في واجهة الأطباء',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
            verticalBox(32),
             InfoWidget(
                title: ' المرضى الذين تتابعهم', path: Assets.newConsulting,
                onTap: () {
                  context.push(FadeSlidePageTransition(
                      page: const Currentpatients()));
                
                },),
             InfoWidget(
                title: 'الاستشارات الجديدة', path: Assets.patients,
                onTap: () {
                  context.push(FadeSlidePageTransition(
                      page: const Newpatients()));
                },

                ),
          ],
        ),
      ))),
    );
  }
}
