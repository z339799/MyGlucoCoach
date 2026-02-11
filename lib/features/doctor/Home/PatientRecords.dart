import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/index.dart';

class PatientRecordsScreen extends StatelessWidget {
  const PatientRecordsScreen({super.key, required this.patientUid, required this.patientName});
  final String patientUid;
  final String patientName;

  DataRow _glucoseRow(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final v = (doc.data()['value'] ?? 0).toDouble();
    final time = (doc.data()['localTime'] ?? '').toString();
    String status;
    if (v < 70) status = 'منخفض';
    else if (v <= 180) status = 'طبيعي';
    else status = 'مرتفع';
    return DataRow(cells: [
      DataCell(Text(time)),
      DataCell(Text(v.toStringAsFixed(0))),
      DataCell(Text(status)),
    ]);
  }

  DataRow _insulinRow(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final dose = (doc.data()['dose'] ?? 0).toDouble();
    final type = (doc.data()['insulinType'] ?? '').toString();
    final time = (doc.data()['localTime'] ?? '').toString();
    return DataRow(cells: [
      DataCell(Text(time)),
      DataCell(Text(dose.toStringAsFixed(0))),
      DataCell(Text(type)),
    ]);
  }

  DataRow _mealRow(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final time = (doc.data()['localTime'] ?? '').toString();
    final title = (doc.data()['title'] ?? '').toString();
    final desc = (doc.data()['description'] ?? '').toString();
    return DataRow(cells: [
      DataCell(Text(time)),
      DataCell(Text(title)),
      DataCell(SizedBox(width: 220, child: Text(desc, overflow: TextOverflow.ellipsis))),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final glucoseStream = FirestoreHelpers.glucoseLogs(patientUid)
        .orderBy('createdAt', descending: true)
        .limit(50)
        .snapshots();
    final insulinStream = FirestoreHelpers.insulinLogs(patientUid)
        .orderBy('createdAt', descending: true)
        .limit(50)
        .snapshots();
    final mealsStream = FirestoreHelpers.mealLogs(patientUid)
        .orderBy('createdAt', descending: true)
        .limit(50)
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        title: Text('سجلات $patientName'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            Text('نتائج قياسات السكر', style: Theme.of(context).textTheme.titleLarge),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: glucoseStream,
              builder: (context, snap) {
                if (!snap.hasData) return const Padding(padding: EdgeInsets.all(12), child: Center(child: CircularProgressIndicator()));
                final docs = snap.data!.docs;
                if (docs.isEmpty) return const Padding(padding: EdgeInsets.all(8), child: Text('لا يوجد بيانات'));
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('الوقت')),
                      DataColumn(label: Text('القياس')),
                      DataColumn(label: Text('الحالة')),
                    ],
                    rows: docs.map(_glucoseRow).toList(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Text('سجل جرعات الأنسولين', style: Theme.of(context).textTheme.titleLarge),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: insulinStream,
              builder: (context, snap) {
                if (!snap.hasData) return const Padding(padding: EdgeInsets.all(12), child: Center(child: CircularProgressIndicator()));
                final docs = snap.data!.docs;
                if (docs.isEmpty) return const Padding(padding: EdgeInsets.all(8), child: Text('لا يوجد بيانات'));
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('الوقت')),
                      DataColumn(label: Text('الجرعة')),
                      DataColumn(label: Text('النوع')),
                    ],
                    rows: docs.map(_insulinRow).toList(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Text('سجل الوجبات', style: Theme.of(context).textTheme.titleLarge),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: mealsStream,
              builder: (context, snap) {
                if (!snap.hasData) return const Padding(padding: EdgeInsets.all(12), child: Center(child: CircularProgressIndicator()));
                final docs = snap.data!.docs;
                if (docs.isEmpty) return const Padding(padding: EdgeInsets.all(8), child: Text('لا يوجد بيانات'));
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('الوقت')),
                      DataColumn(label: Text('الوجبة')),
                      DataColumn(label: Text('التفاصيل')),
                    ],
                    rows: docs.map(_mealRow).toList(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
