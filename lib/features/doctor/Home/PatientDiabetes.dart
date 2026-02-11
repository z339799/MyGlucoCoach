import 'package:pfeproject/core/index.dart';
import 'package:pfeproject/features/patient/diabeteMsure/presentation/view/widgets/CustomDateWidget.dart';

import '../../onboarding/presentation/view/widgets/customButton.dart';
import 'PatientInsuline.dart';

class Patientdiabetes extends StatefulWidget {
  const Patientdiabetes({super.key});

  @override
  State<Patientdiabetes> createState() => _PatientdiabetesState();
}

class _PatientdiabetesState extends State<Patientdiabetes> {
  String date = '';
  String time = '';
  DataRow createDataRows(String meal) {
    return DataRow(cells: [
      DataCell(Text(
        '1',
        style: Theme.of(context).textTheme.titleLarge,
      )),
      DataCell(Text(
        meal,
        style: Theme.of(context).textTheme.titleLarge,
      )),
    ]);
  }

  List<String> meals = [];
  List<DataRow> creatDataList(List<String> meals) {
    List<DataRow> dataRows = [];
    for (var i = 0; i < meals.length; i++) {
      dataRows.add(createDataRows(meals[i]));
    }
    return dataRows;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Custombg(
      widget: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [
            Text(
              ' قياسات السكر ',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
            verticalBox(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomDateWidget(
                  label: 'التاريخ',
                  date: date,
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            colorScheme: ColorScheme.light(
                              primary: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          child: child!,
                        );
                      },
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2025),
                    );
                    if (picked != null) {
                      setState(() {
                        date = picked.toString().substring(0, 10);
                      });
                    }
                  },
                ),
                CustomDateWidget(
                  label: 'الساعة',
                  date: time,
                  onTap: () async {
                    final TimeOfDay? timePicked = await showTimePicker(
                      context: context,
                      onEntryModeChanged: (value) {},
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            colorScheme: ColorScheme.light(
                              primary: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          child: child!,
                        );
                      },
                      initialTime: TimeOfDay.now(),
                    );
                    if (timePicked != null) {
                      setState(() {
                        time = timePicked.format(context);
                      });
                    }
                  },
                ),
              ],
            ),
            verticalBox(24),
            SizedBox(
              width: context.screenWidth,
              child: DataTable(
                  dividerThickness: 0,
                  border: TableBorder.all(
                      color: Theme.of(context).colorScheme.secondary),
                  columns: [
                    DataColumn(
                        label: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'الساعة',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    )),
                    DataColumn(
                        label: Text(
                      'نسبة السكر في الدم',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    )),
                  ],
                  rows: creatDataList(meals)),
            ),
            const Spacer(),
            SizedBox(
              width: 250.w,
              child: CustomButton(
                title: 'جرعات الأنسولين',
                onTap: () {
                  context.pushReplacement(
                      FadeSlidePageTransition(page: const Patientinsuline()));
                },
              ),
            ),
          ],
        ),
      )),
    ));
  }
}
