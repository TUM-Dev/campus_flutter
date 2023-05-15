import 'package:campus_flutter/profileComponent/viewModel/profileViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TuitionView extends StatelessWidget {
  const TuitionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextButton(
          onPressed: () {},
          style: FilledButton.styleFrom(
            textStyle: Theme
                .of(context)
                .textTheme
                .bodyMedium,
            foregroundColor: Theme
                .of(context)
                .textTheme
                .bodyMedium
                ?.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(children: [
            const Padding(
              padding: EdgeInsets.all(7.0),
              child: Icon(Icons.euro),
            ),
            const Text("Tuition fees"),
            const Spacer(),
            tuitionStatus(context)
          ])
      ),
    );
  }

  Widget tuitionStatus(BuildContext context) {
    return StreamBuilder(
        stream: Provider
            .of<ProfileViewModel>(context)
            .tuition
            .stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Icon(snapshot.data?.amount == 0.0
                ? Icons.check
                : Icons.telegram_sharp);
          } else {
            return const Text("n/a", style: TextStyle(color: Colors.red));
          }
        });
  }
}
