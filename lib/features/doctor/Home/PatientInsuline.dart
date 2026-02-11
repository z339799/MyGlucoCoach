import 'package:pfeproject/core/index.dart';
import 'package:pfeproject/features/patient/diabeteMsure/presentation/view/widgets/CustomDateWidget.dart';

import '../../auth/presentation/view/widgets/indexA.dart';
import '../../onboarding/presentation/view/widgets/customButton.dart';

class Patientinsuline extends StatefulWidget {
  const Patientinsuline({super.key});

  @override
  State<Patientinsuline> createState() => _PatientinsulineState();
}

class _PatientinsulineState extends State<Patientinsuline> {
  String date = '';
  String time = '';
  bool isSeleted1 = false;
  bool isSeleted2 = false;
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
              ' جرعات الأنسولين ',
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
                      'الجرعة المأخوذة',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    )),
                  ],
                  rows: creatDataList(meals)),
            ),
            const Spacer(),
            Row(
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
                const Spacer(),
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
              ],
            ),
            verticalBox(24),
            SizedBox(
              width: 250.w,
              child: CustomButton(
                title: 'الصفحة الرئيسية',
                onTap: () {
                  context.pop();
                },
              ),
            ),
          ],
        ),
      )),
    ));
  }
}
