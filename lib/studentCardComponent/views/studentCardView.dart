import 'package:campus_flutter/base/helpers/cardWithPadding.dart';
import 'package:campus_flutter/studentCardComponent/model/studentCard.dart';
import 'package:campus_flutter/studentCardComponent/services/studentCardService.dart';
import 'package:campus_flutter/studentCardComponent/views/barCodeView.dart';
import 'package:campus_flutter/studentCardComponent/views/informationView.dart';
import 'package:campus_flutter/studentCardComponent/views/snappingSlider.dart';
import 'package:flutter/material.dart';

class StudentCardView extends StatefulWidget {
  const StudentCardView({super.key});

  @override
  State<StatefulWidget> createState() => _StudentCardViewState();
}

class _StudentCardViewState extends State<StudentCardView> {
  late Future<StudentCard> studentCard;

  @override
  void initState() {
    studentCard = StudentCardService.fetchStudentCard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: studentCard,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;
            return Column(
              children: [
                _warningCard(),
                InformationView(studentCard: data),
                SnappingSlider(libraryID: data.libraryID)
                //BarCodeView(libraryID: data.libraryID),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _warningCard() {
    return CardWithPadding(
        color: Colors.redAccent.withOpacity(0.2),
        child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.warning, color: Colors.red),
              Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
              Expanded(child:
              Text("Does NOT Replace the Physical StudentCard!",
                  style: TextStyle(color: Colors.red)))
            ]));
  }
}
