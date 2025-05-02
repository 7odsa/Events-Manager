import 'package:events_manager/utils.dart';
import 'package:flutter/material.dart';

class ProfileAndSettingScreen extends StatefulWidget {
  const ProfileAndSettingScreen({super.key});

  @override
  State<ProfileAndSettingScreen> createState() =>
      _ProfileAndSettingScreenState();
}

class _ProfileAndSettingScreenState extends State<ProfileAndSettingScreen> {
  String languageDDValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          upperLayer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text("Language", style: black20bold),
                SizedBox(height: 4),
                languageLayer(),
                SizedBox(height: 16),
                Text("Theme", style: black20bold),
                SizedBox(height: 4),
                themeLayer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget upperLayer() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: seedColor,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
      ),
      padding: EdgeInsets.only(bottom: 24, left: 24, right: 24, top: 40),
      child: Row(
        // TODO: adding user Image here
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Name", style: white20),
              Text("Email", style: white20),
            ],
          ),
        ],
      ),
    );
  }

  Widget languageLayer() {
    // return DropdownButton<String>(
    //   value: languageDDValue,
    //   items: [
    //     DropdownMenuItem(value: 'one', child: Text(languageDDValue)),
    //     DropdownMenuItem(value: 'two', child: Text('two')),
    //     DropdownMenuItem(value: 'three', child: Text('three')),
    //   ],
    //   underline: Container(height: 2, color: Colors.white),
    //   onChanged: (value) {
    //     languageDDValue = value!;
    //   },
    // );
    return Row();
  }

  Widget themeLayer() {
    return Row();
  }
}
