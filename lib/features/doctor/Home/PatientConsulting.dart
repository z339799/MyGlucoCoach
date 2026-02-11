import 'package:pfeproject/features/auth/presentation/view/LoginScreen.dart';

import '../../../core/index.dart';

class Patientconsulting extends StatelessWidget {
  const Patientconsulting({super.key});

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
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 2),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('العمر : 22 سنة',
                            style: Theme.of(context).textTheme.headlineSmall),
                        const Spacer(),
                        Text('بن دراجي زكرياء',
                            style: Theme.of(context).textTheme.headlineSmall),
                        horizontalBox(4),
                        const CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.blue,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '0794613685',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const Icon(
                          Icons.call,
                          color: Colors.green,
                        )
                      ],
                    )
                  ],
                ),
              ),
              verticalBox(16),
              Text('مواعيد الاستشارة',
                  style: Theme.of(context).textTheme.headlineSmall),
              verticalBox(12),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 2),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Text('الطلبات',
                        style: Theme.of(context).textTheme.headlineSmall),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              ' من الساعة الى غاية',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    width: 65.w,
                                    height: 30.h,
                                    child: const CustomTextField(
                                obsecureText: false,
                                keyboardType: TextInputType.text,
                                    )),
                                Container(
                                    padding: const EdgeInsets.only(left: 4),
                                    width: 65.w,
                                    height: 30.h,
                                    child: const CustomTextField(
                                obsecureText: false,
                                keyboardType: TextInputType.text,                                      
                                    )),
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Text('المريض متوفر يوم',
                                style: Theme.of(context).textTheme.titleLarge),
                            SizedBox(
                              width: 130.w,
                              height: 30.h,
                              child: const CustomTextField(
                                obsecureText: false,
                                keyboardType: TextInputType.text,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              verticalBox(12),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 2),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Text('الموعد المقترح',
                        style: Theme.of(context).textTheme.headlineSmall),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              ' الساعة',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 4),
                                width: 65.w,
                                height: 30.h,
                                child: const CustomTextField(
                               obsecureText: false,
                                keyboardType: TextInputType.text,
                                ))
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Text('التاريح',
                                style: Theme.of(context).textTheme.titleLarge),
                            SizedBox(
                              width: 130.w,
                              height: 30.h,
                              child: const CustomTextField(
                               obsecureText: false,
                                keyboardType: TextInputType.text,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              verticalBox(12),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 2),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Text('الموعد المتفق عليه',
                        style: Theme.of(context).textTheme.headlineSmall),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              ' الساعة',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 4),
                                width: 65.w,
                                height: 30.h,
                                child: const CustomTextField(
                               obsecureText: false,
                                keyboardType: TextInputType.text,
                                ))
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Text('التاريح',
                                style: Theme.of(context).textTheme.titleLarge),
                            SizedBox(
                              width: 130.w,
                              height: 30.h,
                              child: const CustomTextField(
                               obsecureText: false,
                                keyboardType: TextInputType.text,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ))),
      ),
    );
  }
}
