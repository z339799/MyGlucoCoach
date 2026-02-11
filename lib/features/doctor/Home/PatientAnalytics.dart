import 'package:pfeproject/core/index.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../onboarding/presentation/view/widgets/customButton.dart';

class Patientanalytics extends StatefulWidget {
  const Patientanalytics({super.key, required this.title, required this.widget});
  final String title;
  final Widget widget;

  @override
  State<Patientanalytics> createState() => _PatientanalyticsState();
}

class _PatientanalyticsState extends State<Patientanalytics> {
  DateTime seletedDay = DateTime.now();
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
              widget.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 10),
              lastDay: DateTime.utc(2030, 10, 10),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  seletedDay = selectedDay;
                });
              },
              focusedDay: seletedDay,
              selectedDayPredicate: (day) {
                return isSameDay(seletedDay, day);
              },
              weekendDays: const [DateTime.friday, DateTime.saturday],
              calendarStyle: CalendarStyle(
                markerDecoration: const BoxDecoration(
                    color: Colors.blueAccent, shape: BoxShape.circle),
                rangeHighlightColor: Colors.blueAccent,
                todayDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blueAccent)),
                todayTextStyle: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.blueAccent),
                selectedDecoration: const BoxDecoration(
                    color: Colors.blueAccent, shape: BoxShape.circle),
                defaultTextStyle: (Theme.of(context).textTheme.titleMedium ?? const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              ),
            ),
            const Spacer(),
            SizedBox(
                width: 250.w,
                child: CustomButton(
                  title: 'الصفحة التالية',
                  onTap: () {
                    context.pushReplacement(
                        FadeSlidePageTransition(page:widget.widget));
                  },
                ))
          ],
        ),
      )),
    ));
  }
}
