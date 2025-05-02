import 'package:events_manager/main.dart';
import 'package:events_manager/utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // TODO
                      },
                      icon: Icon(
                        Icons.sunny,
                        color: colorScheme.primaryContainer,
                        size: 28,
                      ),
                    ),
                    SizedBox(width: 8),
                    InkWell(
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "EN",
                          style: blue20.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      onTap: () {
                        // TODO
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: TabBar(tabs: [], isScrollable: true),
            ),
          ],
        ),
      ),
    );
  }
}
