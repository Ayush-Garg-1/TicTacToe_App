import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/topContainer.dart';

class TicTacToePage extends StatefulWidget {
  @override
  _TicTacToePageState createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  List<int> boxList = List.filled(9, 0);
  int draw = 0;
  int filledBox = 0;
  int player1Score = 0;
  int player2Score = 0;
  int gameCount = 0;
  bool turn = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xff00072D),
          child: Center(
              child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              TopContainer(player1Score: player1Score,player2Score: player2Score,),
              SizedBox(
                height: 40,
              ),
              Text("Draw : $draw time",
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Color(0xff123499),
                    borderRadius: BorderRadius.circular(25)),
                height: MediaQuery.of(context).size.height * 0.44,
                child: Center(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => checkWinner(index, context),
                        child: Container(
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Color(0xff00072D),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: showIcon(boxList[index]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            
            ],
          )),
        ),
      ),
    );
  }

  Widget showIcon(int player) {
    if (player == 1) {
      return Text("X", style: TextStyle(color: Colors.white, fontSize: 70));
    } else if (player == 2) {
      return Icon(Icons.circle_outlined, color: Colors.orange, size: 80);
    }
    return Container();
  }

  void checkWinner(int index, BuildContext context) {
    filledBox = filledBox + 1;
    
    if (boxList[index] == 0) {
      if (turn) {
        boxList[index] = 1;
        turn = false;
      } else {
        boxList[index] = 2;
        turn = true;
      }
      
        if ((boxList[0] == 1 && boxList[1] == 1 && boxList[2] == 1) ||
            (boxList[3] == 1 && boxList[4] == 1 && boxList[5] == 1) ||
            (boxList[6] == 1 && boxList[7] == 1 && boxList[8] == 1) ||
            (boxList[0] == 1 && boxList[3] == 1 && boxList[6] == 1) ||
            (boxList[1] == 1 && boxList[4] == 1 && boxList[7] == 1) ||
            (boxList[2] == 1 && boxList[5] == 1 && boxList[8] == 1) ||
            (boxList[0] == 1 && boxList[4] == 1 && boxList[8] == 1) ||
            (boxList[2] == 1 && boxList[4] == 1 && boxList[6] == 1)) {
          player1Score = player1Score + 1;
          ShowDialogBox("X");
        } else if ((boxList[0] == 2 && boxList[1] == 2 && boxList[2] == 2) ||
            (boxList[3] == 2 && boxList[4] == 2 && boxList[5] == 2) ||
            (boxList[6] == 2 && boxList[7] == 2 && boxList[8] == 2) ||
            (boxList[0] == 2 && boxList[3] == 2 && boxList[6] == 2) ||
            (boxList[1] == 2 && boxList[4] == 2 && boxList[7] == 2) ||
            (boxList[2] == 2 && boxList[5] == 2 && boxList[8] == 2) ||
            (boxList[0] == 2 && boxList[4] == 2 && boxList[8] == 2) ||
            (boxList[2] == 2 && boxList[4] == 2 && boxList[6] == 2)) {
          player2Score = player2Score + 1;
           ShowDialogBox("O");
        } else if (filledBox == 9) {
          draw = draw + 1;
          ShowDialogBox("X O",text: "Draw");
        }
      
      setState(() {});
    }
  }
  
ShowDialogBox(String iconText,{String text="Winner!"}){
  return  
  showGeneralDialog(
            context: context,
            barrierColor: Colors.orange,
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) {
              return ScaleTransition(
                scale: Tween<double>(begin: 0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    boxList = List.filled(9, 0);
                    gameCount = gameCount + 1;
                    filledBox = 0;
                    turn = true;
                    setState(() {});
                    Navigator.of(context).pop();
                    if(gameCount==3){
                      Navigator.pushReplacementNamed(context, "result-page",arguments: {"player1Score":player1Score,"player2Score":player2Score});
                    }

                  },
                  child: AlertDialog(
                    title: Column(
                      children: [
                        Text(
                          iconText,
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 50),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          text,
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        
}

}
