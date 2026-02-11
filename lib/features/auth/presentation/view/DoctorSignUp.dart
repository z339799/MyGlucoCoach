import 'package:pfeproject/core/index.dart';
import 'package:pfeproject/features/patient/InsulineMesure/presentation/view/widgets/CustomAppBar.dart';
import 'package:pfeproject/features/auth/presentation/view/LoginScreen.dart';
import 'package:pfeproject/features/onboarding/presentation/view/widgets/customButton.dart';

import '../viewmodel/AuthCubit/AuthCubit.dart';

class DoctorSignUp extends StatefulWidget {
  const DoctorSignUp({super.key});

  @override
  State<DoctorSignUp> createState() => _DoctorSignUpState();
}

class _DoctorSignUpState extends State<DoctorSignUp> {
  bool _isRememberMe = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obsecureText = true;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Custombg(
        widget: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomAppBar(),
                  verticalBox(24),
                  Text(
                    'مرحبا بكم في واجهة الأطباء',
                    style: (Theme.of(context).textTheme.headlineLarge ?? const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)).copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  verticalBox(12),
                  Text(
                    'الرجاء ادخال المعلومات المناسبة',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  verticalBox(32),
                  const CustomInputTitle(
                    title: 'اسم و لقب ',
                    obsecureText: false,
                    keyboardType: TextInputType.name,
                  ),
                  verticalBox(16),
                  CustomInputTitle(
                    title: 'البريد الالكتروني',
                    obsecureText: false,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                  verticalBox(16),
                  const CustomInputTitle(
                    title: 'رقم الهاتف',
                    obsecureText: false,
                    keyboardType: TextInputType.phone,
                  ),
                  verticalBox(16),
                  CustomInputTitle(
                    title: 'كلمة المرور',
                    obsecureText: obsecureText,
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: Icons.visibility,
                    controller: passwordController,
                    onPressed: () {
                      setState(() {
                        obsecureText = !obsecureText;
                      });
                    },
                  ),
                  verticalBox(16),
                  SwitchListTile(
                    contentPadding: const EdgeInsets.only(right: 0),
                    activeColor: Colors.blueAccent,
                    inactiveThumbColor: Theme.of(context).colorScheme.tertiary,
                    value: _isRememberMe,
                    onChanged: (value) {
                      setState(() {
                        _isRememberMe = value;
                      });
                    },
                    title: Text('أتعهد أن المعلومات صحيحة',
                        maxLines: 2,
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.titleSmall),
                  ),
                  SizedBox(
                    width: context.screenWidth,
                    child: BlocBuilder<AuthCubit, Authstate>(
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Colors.blueAccent,
                          ));
                        } else if (state is AuthFailed) {
                          return Center(
                              child: Text(
                            state.message,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ));
                        }
                        return CustomButton(
                          title: 'الصفحة التالية',
                          onTap: () {
                            context
                                .read<AuthCubit>()
                                .signUpDoctor(emailController.text, passwordController.text);
                            context.pushReplacementNamed(
                                Routes.onboarindDocotrtwo);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
