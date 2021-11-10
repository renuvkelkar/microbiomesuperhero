import 'package:aahaarkarnti_chart_app/model/Game/game_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  final snackBar = SnackBar(
    content: "Yay! Correct 🥳".text.center.make(),
    backgroundColor: Colors.green,
  );
  final snackBar1 = SnackBar(
    content: "Opps! Wrong 😥".text.center.make(),
    backgroundColor: Colors.red,
  );

  List<Data>? items = [];
  List<Data>? items2 = [];

  bool? accepting = false;

  get child => null;

  @override
  void initState() {
    super.initState();
    getFruitsData();
    initGame();
  }

   bool gameOver = false;
   int score = 0;

  initGame() {
    bool gameOver = false;
  int score = 0;}

  QuerySnapshot? fruitsSnapshot;

  getFruitsData() async {
    fruitsSnapshot =
    await FirebaseFirestore.instance.collection("Game").get();
    items = fruitsSnapshot!.docs
        .map((element) => Data.fromJson(element.data() as Map<String, dynamic>))
        .toList();
    items2 = fruitsSnapshot!.docs
        .map((element) => Data.fromJson(element.data() as Map<String, dynamic>))
        .toList();
    items?.shuffle();
    items2?.shuffle();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent.shade100,



      appBar: AppBar(
        title: Text('Drag & Drop Game').text.make(),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Text.rich(TextSpan(children: [
            TextSpan(
                text: "Score: ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            TextSpan(
                text: "$score",
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0))
          ])),
          Container(
            height: 600,
            width: 800,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: items!.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: <Widget>[
                      Column(children: [
                        Draggable<Data>(
                            data: items![index],
                            feedback: Image.network(
                              items![index].imgurl.toString(),
                              height: 100,
                              width: 100,
                            ),
                            childWhenDragging: Image.network(
                              items![index].imgurl.toString(),
                              height: 100,
                              width: 100,
                              colorBlendMode: BlendMode.softLight,
                            ),
                            child: Image.network(
                              items![index].imgurl.toString(),
                              height: 100,
                              width: 100,
                            ).p12())
                      ]).p12(),
                      Spacer(),
                      Expanded(
                        child: Container(
                            child: DragTarget<Data>(
                              onAccept: (receivedItem) {
                                if (items2![index].value == receivedItem.value) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  setState(() {
                                    items2![index].accepting = true;
                                    items2!.removeWhere((dataList) =>
                                    dataList.imgurl == receivedItem.imgurl);
                                    items!.removeWhere((dataList) =>
                                    dataList.imgurl == receivedItem.imgurl);

                                    score += 10;
                                  });
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar1);
                                  setState(() {
                                    score -= 5;
                                    items![index].accepting = false;
                                  });
                                }
                              },
                              onLeave: (receivedItem) {
                                setState(() {
                                  items![index].accepting = false;
                                });
                              },
                              onWillAccept: (receivedItem) {
                                setState(() {
                                  items![index].accepting = true;
                                });
                                return true;
                              },
                              builder: (context, acceptedItems, rejectedItems) =>
                                  CircleAvatar(
                                      radius: 60,
                                      child: Text(
                                        items2![index].name.toString(),
                                      )),
                            )),
                      )
                    ],
                  );
                }),
          )
        ]).centered(),
      ),
    );
  }
}