import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xo_c15/BoardBtn.dart';
// unversioned
// ignored

// commit
class BoardScreen extends StatefulWidget {
  static const String routeName = "board";

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  int player1Score = 0;

  int player2Score = 0;

  String message = "Player 1’s Turn";

  List<String> boardState = [
    "","","",
    "","","",
    "","",""
  ];
  late String selectedSymbol;
  @override
  Widget build(BuildContext context) {
    BoardArgs args = ModalRoute.of(context)!.settings.arguments as BoardArgs ; // casting
    selectedSymbol = args.selectedSymbol;
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
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 20,
              top: 25,
              left: 16,
              right: 16
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 18
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(44),
                    color: Colors.white
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(args.player1Name,style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: Colors.black
                            ),),
                             Text(player1Score.toString(),style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: Colors.black
                            ),)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(args.player2Name,style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: Colors.black
                            ),),
                            Text(player2Score.toString(),style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: Colors.black
                            ),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32,),
                Text(message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  color: Colors.white
                ),),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 22
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(44),
                      color: Colors.white
                    ),
                    child:  Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              BoardBtn(
                                title: boardState[0],
                                index: 0,
                                onClick: onBoardClicked,
                              ),
                              const VerticalDivider(
                                color: Colors.black,
                              ),
                              BoardBtn(
                                index: 1,
                                title: boardState[1],
                                onClick: onBoardClicked,

                              ),
                              VerticalDivider(
                                color: Colors.black,
                              ),
                              BoardBtn(
                                index: 2,
                                title: boardState[2],
                                onClick: onBoardClicked,

                              ),


                            ],
                          ),
                        ),
                        Divider(
                          height: 0,
                          color: Colors.black,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              BoardBtn(
                                index: 3,
                                title: boardState[3],
                                onClick: onBoardClicked,
                              ),
                              VerticalDivider(
                                color: Colors.black,
                              ),
                              BoardBtn(
                                index: 4,
                                title: boardState[4],
                                onClick: onBoardClicked,
                              ),
                              VerticalDivider(
                                color: Colors.black,
                              ),
                              BoardBtn(
                                index: 5,
                                title: boardState[5],
                                onClick: onBoardClicked,
                              ),


                            ],
                          ),
                        ),
                        Divider(
                          height: 0,
                          color: Colors.black,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              BoardBtn(
                                index: 6,
                                title: boardState[6],
                                onClick: onBoardClicked,

                              ),
                              VerticalDivider(
                                color: Colors.black,
                              ),
                              BoardBtn(
                                index: 7,
                                title: boardState[7],
                                onClick: onBoardClicked,

                              ),
                              VerticalDivider(
                                color: Colors.black,
                              ),
                              BoardBtn(
                                index: 8,
                                title: boardState[8],
                                onClick: onBoardClicked,
                              ),


                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  // player 1 : 1 3 5 7 9
  // player 2 : 2 4 6 8
  int counter = 1;
  onBoardClicked(int index){
    if(boardState[index].isNotEmpty){
      return;
    }
    setState(() {
      if(counter.isOdd){
        boardState[index] = selectedSymbol;
        message = "Player 2's Turn";
      }else{
        boardState[index] = selectedSymbol=="x"?"o":"x";
        message = "Player 1's Turn";
      }
      if(checkWinner(selectedSymbol)){
        player1Score+=10;
        message = "Player1 Win";
        resetGame();
        return;
      }else if(checkWinner(selectedSymbol=="x"?"o":"x")){
        player2Score+=10;
        message = "Player2 Win";
        resetGame();
        return;
      }else if(counter==9){
        message = "Draw";
        resetGame();
        return;
      }
      counter++;
    });
  }

  resetGame(){
    Timer(Duration(
      seconds: 2
    ), () {
      setState(() {
        boardState = [
          "","","",
          "","","",
          "","",""
        ];
        counter = 1;
        message = "Player 1’s Turn";
      });
    });

  }
  bool checkWinner(String symbol){
    for(int i=0;i<9;i+=3){
      if(boardState[i]==symbol && boardState[i+1]==symbol && boardState[i+2]==symbol){
        return true;
      }
    }
    for(int i=0;i<3;i++){
      if(boardState[i]==symbol && boardState[i+3]==symbol && boardState[i+6]==symbol){
        return true;
      }
    }
    if(boardState[0]==symbol && boardState[4]==symbol && boardState[8]==symbol){
      return true;
    }
    if(boardState[2]==symbol && boardState[4]==symbol && boardState[6]==symbol){
      return true;
    }
    return false;
  }
}


class BoardArgs{
  String player1Name;
  String player2Name;
  String selectedSymbol;
  BoardArgs({
    required this.player1Name,
    required this.player2Name ,
    required this.selectedSymbol
  });
}
