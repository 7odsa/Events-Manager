import 'package:events_manager/utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          upperWidget(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Text("data"),
              itemCount: 50,
            ),
          ),
        ],
      ),
    );
  }

  Widget upperWidget() {
    return Container(
      decoration: BoxDecoration(
        color: seedColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Welcome Back", style: white20),
                    Text("John Safwat", style: white20),
                  ],
                ),
                Text("En", style: white20),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Text("data"),
                itemCount: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
