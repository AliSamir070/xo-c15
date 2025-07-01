import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xo_c15/board_screen.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedSymbol = "x";
  String player1 = "";
  TextEditingController player1Controller = TextEditingController();
  TextEditingController player2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff00D2FF),
              Color(0xff3A7BD5)
            ]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset("assets/images/Frame 1.png",
                    width: double.infinity,
                    fit: BoxFit.cover,),
                  const Text("Tic-Tac-Toe",style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w900
                  ),)
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16
                ),
                child: SingleChildScrollView(
                  child: Column(children: [
                    TextField(
                      controller: player1Controller,
                      onChanged: (value) {
                        player1 = value;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Player1 Name",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(
                              color: Colors.white,
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      controller: player2Controller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Player2 Name",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(
                              color: Colors.white,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(
                              color: Colors.white,
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("Pick who goes first?",style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                    ),),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                selectedSymbol = 'x';
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 39
                                ),
                                decoration: BoxDecoration(
                                  color: selectedSymbol=="x"
                                      ?Colors.white
                                      :Colors.transparent,
                                  borderRadius: BorderRadius.circular(32)
                                ),
                                child: SvgPicture.asset("assets/images/x_icon.svg")),
                          ),
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                selectedSymbol = 'o';
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 39
                                ),
                                decoration: BoxDecoration(
                                    color: selectedSymbol=="o"
                                        ?Colors.white
                                        :Colors.transparent,
                                    borderRadius: BorderRadius.circular(32)
                                ),
                                child: SvgPicture.asset("assets/images/o_icon.svg")),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamed(context, BoardScreen.routeName,
                              arguments: BoardArgs(
                                  player1Name: player1Controller.text,
                                  player2Name: player2Controller.text,
                                  selectedSymbol: selectedSymbol)
                          );
                        }, child: Text("Start Game"))
                  ],),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
