import 'package:flutter/material.dart';
import 'package:shypclone/common_widgets/loader.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Loader(),
          Center(
            child: Text("HomePage"),
          ),
        ],
      ),
    );
  }
}
