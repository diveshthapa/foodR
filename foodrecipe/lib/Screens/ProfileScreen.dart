import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Authenticate/LoginScree.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    print(currentUser);
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,elevation: 0,
        title: const Text('User Details' , style: TextStyle(color:Colors.black),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                //  padding:const  EdgeInsets.all(60),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      //   width: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: const CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/images/profile.png",
                        ),
                        radius: 80,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Name',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.blue),
                        ),
                        Text(
                          "${currentUser?.displayName}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Email Address',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.blue,
                            )),
                        Text(
                          "${currentUser?.email}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                   const Divider(
                      thickness: 2,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                  ],
                ),
              ),
            ]),
      )),
    );
  }
}
