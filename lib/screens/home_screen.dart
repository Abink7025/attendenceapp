import 'package:attendenceapp/screens/addbatch_screen.dart';
import 'package:attendenceapp/screens/batch_details.dart';
import 'package:attendenceapp/widgets/batch_widget.dart';
import 'package:attendenceapp/widgets/bottom_cornner.dart';
import 'package:attendenceapp/widgets/search_widget.dart';
import 'package:attendenceapp/widgets/top_cornner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              CornnerImage(),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 340),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert_rounded,
                      size: 40,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 100, left: 149),
                child: Container(
                  width: 312,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color.fromRGBO(217, 217, 217, 0.42)),
                  child: Center(
                    child: TextFormField(
                        decoration:
                            InputDecoration(hintText: 'Enter your email')),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: FutureBuilder(
              future: FirebaseFirestore.instance.collection('batch').get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // <3> Retrieve `List<DocumentSnapshot>` from snapshot
                  final List<DocumentSnapshot> documents = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) => BatchWidget(
                        text: documents[index]['Batchname'].toString()),
                  );
                } else if (snapshot.hasError) {
                  return Text('Its Error!');
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 66,
                  height: 66,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromRGBO(27, 182, 182, 1)),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddbatchScreen(),
                        ));
                        print('object');
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 46,
                      )),
                ),
              ),
              Positioned(
                  right: 19,
                  bottom: 10,
                  child:
                      Container(width: 80, height: 84, child: BottomCornner()))
            ],
          ),
        ],
      ),
    );
  }
}
