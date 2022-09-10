import 'package:carousel_slider/carousel_slider.dart';
import 'package:chat_app/Videos/Nepali%20BhansaGhar_screen.dart';
import 'package:chat_app/Videos/AuthenticNepaliKitchen_screen.dart';
import 'package:chat_app/Videos/YummyNepaliKitchen_screen.dart';
import 'package:flutter/material.dart';

class VideoMain extends StatefulWidget {
  @override
  State<VideoMain> createState() => _VideoMainState();
}

class _VideoMainState extends State<VideoMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text("Available Videos",
                style: TextStyle(
                  fontSize: 20.0,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CarouselSlider(
              items: [
                //1st Image of Slider
                GestureDetector(
                  onTap: () {
                    // Within the `FirstRoute` widget

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HistoryVhomeScreen()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/yummly.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                //2nd Image of Slider
                GestureDetector(
                  onTap: () {
                    // Within the `FirstRoute` widget

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => YummyNepaliKitchen_screen()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/AuthenticNepaliKitchen.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                
                //4th Image of Slider
                GestureDetector(
                  onTap: () {
                    // Within the `FirstRoute` widget

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScienceVhomeScreen()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/dhido.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],

              //Slider Container properties
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          ),

          //This is for the section below carousel

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Other Courses",
                style: TextStyle(
                  fontSize: 20.0,
                )),
          ),
          Column(
            children: [
              //This is below card
              Card(
                child: Container(
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Expanded(
                            child: Image.asset("assets/images/yummly.jpg"),
                            flex: 2,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              const Expanded(
                                flex: 5,
                                child: ListTile(
                                  title: Text("Yummly Nepali Kitchen"),
                                  
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      child: const Text("PLAY"),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  YummyNepaliKitchen_screen()),
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        flex: 8,
                      ),
                    ],
                  ),
                ),
                elevation: 8,
                margin: const EdgeInsets.all(10),
              ),
              Card(
                child: Container(
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Expanded(
                            child: Image.asset("assets/images/AuthenticNepaliKitchen.png"),
                            flex: 2,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              const Expanded(
                                flex: 5,
                                child: ListTile(
                                  title: Text("AuthenticNepaliKitchen"),
                                  
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      child: const Text("PLAY"),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HistoryVhomeScreen()),
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        flex: 8,
                      ),
                    ],
                  ),
                ),
                elevation: 8,
                margin: const EdgeInsets.all(10),
              ),
              Card(
                child: Container(
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Expanded(
                            child: Image.asset("assets/images/chulo.png"),
                            flex: 2,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              const Expanded(
                                flex: 5,
                                child: ListTile(
                                  title: Text("Nepali BhansaGhar"),
                                 
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      child: const Text("PLAY"),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ScienceVhomeScreen()),
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        flex: 8,
                      ),
                    ],
                  ),
                ),
                elevation: 8,
                margin: const EdgeInsets.all(10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
