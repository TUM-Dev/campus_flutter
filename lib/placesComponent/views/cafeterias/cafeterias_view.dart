import 'package:campus_flutter/placesComponent/views/cafeterias/cafeteria_row_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CafeteriasScaffold extends StatelessWidget {
  const CafeteriasScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Cafeterias"),
      ),
      body: const CafeteriasView(),
    );
  }
}

class CafeteriasView extends ConsumerWidget {
  const CafeteriasView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cafeterias = ref.read(cafeteriasViewModel).cafeterias;
    return SingleChildScrollView(
        child: Column(
      children: [
        for (var cafeteria in cafeterias)
          CafeteriaCardView(cafeteria: cafeteria)
      ],
    ));
  }
}
