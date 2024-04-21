import 'package:flutter/material.dart';

import 'components/home_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        name: 'John Doe',
        notification: false,
      ),
      body: Column(
        children: const [
          Text('Home Page'),
        ],
      ),
    );
  }
}
