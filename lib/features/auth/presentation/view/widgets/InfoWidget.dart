


import '../../../../../core/index.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget(
      {super.key, required this.title, required this.path, this.onTap});
  final String title;
  final String path;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            height: 130.h,
            width: 130.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                  color: Theme.of(context).colorScheme.secondary, width: 2),
            ),
            child: Image.asset(
              path,
              fit: BoxFit.cover,
              height: 70,
              width: 70,
            ),
          ),
          verticalBox(12),
          SizedBox(
            width: 120.w,
            height: 40.h,
            child: Text(
              title,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
