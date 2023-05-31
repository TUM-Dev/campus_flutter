import 'package:campus_flutter/base/helpers/paddedDivider.dart';
import 'package:campus_flutter/homeComponent/eatSlider.dart';
import 'package:campus_flutter/homeComponent/contactComponent/contactView.dart';
import 'package:campus_flutter/profileComponent/viewModel/profileViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
              Provider(
                  create: (context) => ProfileViewModel(),
                  child: const ContactScreen()),
              const PaddedDivider(),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: /*EatSlider()*/Text("Coming Soon!")
              )
            ]));
  }
}