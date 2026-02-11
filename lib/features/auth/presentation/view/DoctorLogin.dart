import 'package:pfeproject/core/index.dart';
import 'package:pfeproject/features/doctor/Home/DoctorHome.dart';
import 'package:pfeproject/features/auth/presentation/viewmodel/AuthCubit/AuthCubit.dart';

import 'package:pfeproject/features/onboarding/presentation/view/widgets/customButton.dart';
import '../../../patient/InsulineMesure/presentation/view/widgets/CustomAppBar.dart';
import 'LoginScreen.dart';

class Doctorlogin extends StatefulWidget {
  const Doctorlogin({super.key});

  @override
  State<Doctorlogin> createState() => _DoctorloginState();
}

class _DoctorloginState extends State<Doctorlogin> {
  bool obsecureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Custombg(
          widget: SafeArea(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Column(children: [
                    const CustomAppBar(),
                    verticalBox(24),
                    Text(
                      'مرحبا بكم في واجهة الأطباء',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    verticalBox(16),
                    Text(
                      'الرجاء ادخال معلوماتك',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    verticalBox(48),
                    Text(
                      'اسم الطبيب',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    verticalBox(12),
                    CustomInputTitle(
                      title: 'البريد الالكتروني',
                      obsecureText: false,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                    ),
                    verticalBox(24),
                    CustomInputTitle(
                      title: 'كلمة المرور',
                      obsecureText: obsecureText,
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      suffixIcon: Icons.visibility,
                      onPressed: () {
                        setState(() {
                          obsecureText = !obsecureText;
                        });
                      },
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 250.w,
                      child: BlocBuilder<AuthCubit, Authstate>(
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.blueAccent,
                              ),
                            );
                          } else if (state is AuthFailed) {
                            return Center(
                              child: Text(state.message),
                            );
                          }                          
                          return CustomButton(
                            title: 'تسجيل الدخول',
                            onTap: () {
                              context.read<AuthCubit>().login(
                                   emailController.text,
                                  passwordController.text);
                              context.pushReplacement(FadeSlidePageTransition(
                                  page: const Doctorhome()));
                            },
                          );
                        },
                      ),
                    )
                  ])))),
    ));
  }
}
