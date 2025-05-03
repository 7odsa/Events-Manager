import 'package:events_manager/utils.dart';
import 'package:flutter/material.dart';

class ProfileAndSettingScreen extends StatefulWidget {
  const ProfileAndSettingScreen({super.key});

  @override
  State<ProfileAndSettingScreen> createState() =>
      _ProfileAndSettingScreenState();
}

class _ProfileAndSettingScreenState extends State<ProfileAndSettingScreen> {
  String languageDDValue = 'Arabic';
  String themeDDValue = 'Light';

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
          Spacer(),
          GestureDetector(
            onTap: () {
              // TODO
              print("TestDelete");
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 34),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.logout, size: 32, color: Colors.white),
                  Text("Logout", style: white20),
                ],
              ),
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: seedColor, width: 2),
      ),
      child: DropdownButton<String>(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        style: blue20Bold,
        isExpanded: true,
        value: languageDDValue,
        borderRadius: BorderRadius.circular(16),
        items: [
          DropdownMenuItem(value: 'Arabic', child: Text('Arabic')),
          DropdownMenuItem(value: 'English', child: Text('English')),
        ],
        underline: SizedBox(),
        onChanged: (value) {
          languageDDValue = value!;
          // TODO set it using provider
          setState(() {});
        },
      ),
    );
    // return Row();
  }

  Widget themeLayer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: seedColor, width: 2),
      ),
      child: DropdownButton<String>(
        borderRadius: BorderRadius.circular(16),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        style: blue20Bold,
        elevation: 16,
        isExpanded: true,
        value: themeDDValue,
        items: [
          DropdownMenuItem(value: "Light", child: Text('Light')),
          DropdownMenuItem(value: "Dark", child: Text('Dark')),
        ],
        underline: SizedBox(),
        onChanged: (value) {
          themeDDValue = value!;
          // TODO set it using provider
          setState(() {});
        },
      ),
    );
  }
}
