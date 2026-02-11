import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfeproject/core/index.dart';
import 'package:pfeproject/features/doctor/Home/PatientDiabetes.dart';
import 'package:pfeproject/features/patient/diabeteMsure/presentation/view/widgets/CustomDateWidget.dart';

import '../../onboarding/presentation/view/widgets/customButton.dart';

class Patientmealsdetails extends StatefulWidget {
  const Patientmealsdetails({super.key});

  @override
  State<Patientmealsdetails> createState() => _PatientmealsdetailsState();
}

class _PatientmealsdetailsState extends State<Patientmealsdetails> {
  String date = '';
  String time = '';
  DataRow createDataRows(
    String meal,
  ) {
    return DataRow(cells: [
      DataCell(Text(
        TimeOfDay.now().format(context),
        style: Theme.of(context).textTheme.titleLarge,
      )),
      DataCell(Row(
        children: [
          Row(
            children: [
              Container(
                width: 15,
                height: 15,
                color: Colors.red,
              ),
              Container(
                width: 15,
                height: 15,
                color: Colors.green,
              ),
              Container(
                width: 15,
                height: 15,
                color: Colors.orange,
              ),
            ],
          ),
          Text(
            meal,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      )),
    ]);
  }

  List<String> meals = [];
  List<DataRow> creatDataList(List<dynamic> meals) {
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
              'الوجبة',
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
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                    width: context.screenWidth,
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('meals')
                            .snapshots(),
                        builder: (context, snapshot) {
                          List<String> allMeals = [];
                          print(snapshot.data);
                          if (snapshot.hasError) {
                            return DataTable(
                                dividerThickness: 0,
                                border: TableBorder.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                columns: [
                                  DataColumn(
                                      label: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'الساعة',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                    ),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    'الوجبة',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  )),
                                ],
                                rows: [
                                  DataRow(cells: [
                                    DataCell(Text(
                                      '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    )),
                                    DataCell(Row(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 24,
                                              height: 24,
                                              color: Colors.red,
                                            ),
                                            Container(
                                              width: 24,
                                              height: 24,
                                              color: Colors.green,
                                            ),
                                            Container(
                                              width: 24,
                                              height: 24,
                                              color: Colors.orange,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                      ],
                                    )),
                                  ])
                                ]);
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                                child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.secondary,
                            ));
                          }
                          for (var i = 0; i < snapshot.data!.docs.length; i++) {
                            allMeals.add(snapshot.data!.docs[i]['الفطور']);
                          }
                          return DataTable(
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                              )),
                              DataColumn(
                                  label: Text(
                                'الوجبة',
                                textAlign: TextAlign.center,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              )),
                            ],
                            rows: creatDataList(allMeals),
                            /* snapshot.data!.docs.map((DocumentSnapshot doc) {
                              Map<String, dynamic> data =
                                  doc.data()! as Map<String, dynamic>;
                              return List.generate(data.length, (index) {
                                return DataRow(cells: [
                                  DataCell(Text(
                                    '1',
                                    style: Theme.of(context).textTheme.titleLarge,
                                  )),
                                  DataCell(Text(
                                    data['الفطور'][index],
                                    style: Theme.of(context).textTheme.titleLarge,
                                  )),
                                ]);
                              });
                            }) as List<DataRow>*/
                          );
                        })),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 250.w,
              child: CustomButton(
                title: 'قياس السكري',
                onTap: () {
                  context.pushReplacement(
                      FadeSlidePageTransition(page: const Patientdiabetes()));
                },
              ),
            ),
          ],
        ),
      )),
    ));
  }
}
