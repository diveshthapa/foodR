import 'package:chat_app/Screens/NavDrawer.dart';
import 'package:chat_app/Screens/ProfileScreen.dart';
import 'package:chat_app/Screens/VideoMain.dart';
import 'package:chat_app/Screens/report.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MhomeScreen extends StatefulWidget {
  const MhomeScreen({Key? key}) : super(key: key);

  @override
  State<MhomeScreen> createState() => _MhomeScreenState();
}

class _MhomeScreenState extends State<MhomeScreen> with WidgetsBindingObserver {
  Map<String, dynamic>? userMap;
  bool isLoading = false;
  //final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void dispose() {
    super.dispose();
  }

  void setStatus(String status) async {
    await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .update({"status": status});
  }

  int selectedPage = 0;
  final _pageOptions = [
    VideoMain(),
    ProfileView(),
    FeedBackScreen(),
    
  ];

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text("FoodRecipe"),
      ),
      body: _pageOptions[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.video_camera_back_outlined),
            label: 'Video',
          ),
                  
          BottomNavigationBarItem(
            icon: Icon(Icons.man_sharp),
            label: 'Profile',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.border_color),
            label: 'Report',
            ),
          
        ],
        currentIndex: selectedPage,
        selectedItemColor: Colors.green[800],
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
  }
}
