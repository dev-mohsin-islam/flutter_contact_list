import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {

  const DetailsPage({super.key});
  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
      ),
      body: const Center(
        child: Text('Details Page'),
      ),
    );
  }
}
