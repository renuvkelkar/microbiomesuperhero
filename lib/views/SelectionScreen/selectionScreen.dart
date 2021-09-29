import 'package:aahaarkarnti_chart_app/views/DashBoard/DashBoard.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class SelectionScreen extends StatefulWidget {
  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
   bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Container(
            child: Image.network(
              "https://image.freepik.com/free-vector/empty-sky-nature-scene-park_1308-50041.jpg",
              height: context.screenHeight,
              width: 400,
              fit: BoxFit.cover,
            ),
          ),
          // Lottie.network(
          //     'https://assets7.lottiefiles.com/packages/lf20_zkhpkpyc.json',
          //     height: 400,
          //     width: 1200),
          Column(
            children: [
              InkWell(
                onTap: () {
                  // Timer(Duration(seconds: 5), () {
                  //   // 5 seconds over, navigate to Page2.
                  //   Navigator.push(context, MaterialPageRoute(builder: (_) => Screen2()));
                  // });

                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => DashBoard()));
                },
                child: Container(
                  height: context.screenHeight * 0.10,
                  width: context.screenWidth * 0.7,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50)),
                  child: Text("Info Cards").text.xl2.bold.white.makeCentered(),
                ).p8(),
              ),
              15.heightBox,
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => DashBoard()));
                },
                child: Container(
                  height: context.screenHeight * 0.10,
                  width: context.screenWidth * 0.7,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50)),
                  child: Text("Puzzle").text.xl2.bold.white.makeCentered(),
                ).p8(),
              ),
              15.heightBox,
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => DashBoard()));
                },
                child: Container(
                  height: context.screenHeight * 0.10,
                  width: context.screenWidth * 0.7,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(50)),
                  child: Text("Quiz").text.xl2.bold.white.makeCentered(),
                ).p8(),
              )
            ],
          ).py(100).px(50),
          Positioned(
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Lottie.network(
                    'https://assets7.lottiefiles.com/private_files/lf30_cdui7M.json',
                    height: 120,
                    width: 100,
                    fit: BoxFit.cover),
                Lottie.network(
                    'https://assets6.lottiefiles.com/packages/lf20_nz20vA.json',
                    height: 140,
                    width: 100,
                    fit: BoxFit.cover),
                Lottie.network(
                    'https://assets9.lottiefiles.com/packages/lf20_0wtvp7yg.json',
                    height: 100,
                    width: 150,
                    fit: BoxFit.cover)
              ],
            ),
          ),
        ],
      ),
    );
  }
}