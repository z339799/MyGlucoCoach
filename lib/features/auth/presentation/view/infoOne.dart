import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:pfeproject/features/auth/presentation/view/infoTwo.dart';
import 'package:pfeproject/features/onboarding/presentation/view/widgets/customButton.dart';

import '../../../../core/index.dart';
import 'widgets/indexA.dart';

class InfoOneScreen extends StatefulWidget {
  const InfoOneScreen({super.key, required this.type});
  final String type;
  @override
  State<InfoOneScreen> createState() => _InfoOneScreenState();
}

class _InfoOneScreenState extends State<InfoOneScreen> {
  bool isSeleted1 = false;
  bool isSeleted2 = false;
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
                Image.asset(
                  Assets.logo2,
                  width: 90.w,
                  fit: BoxFit.cover,
                ),
                Text(
                  ' مرحبا بكم في واجهة مرضى السكري نوع ${widget.type}',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                ),
                verticalBox(12),
                Text(
                  'الرجاء رفع الوثائق التالية',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                verticalBox(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InfoWidget(
                      title: 'بطاقة التعريف الوطنية للمريض',
                      path: Assets.idCard,
                      onTap: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();

                        if (result != null) {
                          File file = File(result.files.single.path!);
                        } else {
                          // User canceled the picker
                        }
                      },
                    ),
                    InfoWidget(
                      title: 'التقرير الطبي',
                      path: Assets.medicalReport,
                      onTap: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();

                        if (result != null) {
                          File file = File(result.files.single.path!);
                        } else {
                          // User canceled the picker
                        }
                      },
                    ),
                  ],
                ),
                Text(
                  'الرجاء ملئ معلومات المريض',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                verticalBox(24),
                Row(
                  children: [
                    const CustomInfoInput(
                      width: 90,
                      label: 'الطول',
                    ),
                    verticalBox(16),
                    const CustomInfoInput(
                      width: 90,
                      label: '  الوزن',
                    ),
                    Column(
                      children: [
                        Text(
                          'الجنس',
                          maxLines: 4,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const CustomDropDown(),
                      ],
                    ),
                  ],
                ),
                verticalBox(16),
                verticalBox(8),
                Text(
                  'نوع الدواء المتعاطى',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                verticalBox(8),
                Wrap(
                  alignment: WrapAlignment.end,
                  children: [
                    DiseaseSelector(
                      title: 'الأنسولين البطيئة',
                      isSelected: isSeleted1,
                      onTap: () {
                        setState(() {
                          isSeleted2 = false;
                          isSeleted1 = !isSeleted1;
                        });
                      },
                    ),
                    DiseaseSelector(
                      title: 'الأنسولين السريعة',
                      isSelected: isSeleted2,
                      onTap: () {
                        setState(() {
                          isSeleted1 = false;
                          isSeleted2 = !isSeleted2;
                        });
                      },
                    ),
                    CustomInfoInput(label: 'ادوية اخرى', width: 120)
                  ],
                ),
                verticalBox(8),
                CustomButton(
                  title: 'الصفحة التالية',
                  onTap: () {
                    context.push(
                        FadeSlidePageTransition(page: const InfoTwoScreen()));
                  },
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
