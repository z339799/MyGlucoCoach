import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfeproject/core/index.dart';
import 'PatientRecords.dart';
import 'widgets/patient_card_widget.dart';

class Newpatients extends StatelessWidget {
  const Newpatients({super.key});

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
                    'المرضى الجدد',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: Theme.of(context).colorScheme.secondary),
                  ),
                  verticalBox(16),
                  StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance.collection('patients').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return const Center(child: Text('لا يوجد مرضى'));
                      }
                      final docs = snapshot.data!.docs;
                      return ResponsiveGridList(
                        rowMainAxisAlignment: MainAxisAlignment.center,
                        minSpacing: 12,
                        shrinkWrap: true,
                        desiredItemWidth: 160.w,
                        children: List.generate(
                          docs.length,
                          (index) {
                            final doc = docs[index];
                            final name = (doc.data()['fullname'] ?? 'مريض').toString();
                            final uid = doc.id;
                            return PatientCardWidget(
                              name: name,
                              onTap: () {
                                context.push(
                                  FadeSlidePageTransition(
                                    page: PatientRecordsScreen(patientUid: uid, patientName: name),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
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
