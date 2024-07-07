

import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    var scores = ModalRoute.of(context)?.settings.arguments as Map<String,dynamic>;
   
    return Scaffold(
      body: 
      Container(
        width:MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        color: Color(0xff00072D),
        child:
        (scores["player1Score"]==scores["player2Score"]) ? 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Draw",style: TextStyle(fontSize:50,color: Colors.white,fontWeight: FontWeight.bold)),
            SizedBox(height: 50,),
        ElevatedButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, "tic-tac-toe-page");
          },
          child: Text("Play Again",style: TextStyle(color: Colors.white,fontSize: 21,fontWeight: FontWeight.bold
          ),),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff0E3049FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            side:BorderSide(
              color: Colors.white,
              width: 2
            ),
            padding:EdgeInsets.symmetric(vertical: 18,horizontal: 35),
          ),
        ),
               
          ],
        ):
        Column(children: [
            Container(
               width:MediaQuery.of(context).size.width,
               decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100))
               ),
              height: 300,
              child: Stack(
                children: [
                   Positioned(
                       top: 20,
                    left: (MediaQuery.of(context).size.width-150)/2,
                    child: Image.asset("assets/images/crown.png",width: 150,)),
                   Positioned(
                    left: (MediaQuery.of(context).size.width-75)/2,
                     top: 116,
                    child: CircleAvatar(
                                        radius: 40,
                                        foregroundColor: Colors.blue,
                                        backgroundImage:
                                            AssetImage("assets/images/user.jpg"),
                                      ),),
                  Positioned(
                      left: (MediaQuery.of(context).size.width-160)/2,
                    top: 220,
                      child: Text("Hii, ${scores["player1Score"]>scores["player2Score"]?"Ayush Garg":"Nishant Garg"}!",style: TextStyle(fontSize:25,color: Colors.white,fontWeight: FontWeight.bold),)),
                ],
              ),
            ),
           SizedBox(height: 10,),
           Image.asset("assets/images/stars.png",width:double.infinity,fit: BoxFit.fitWidth,),
          Text("Congratulations!",style: TextStyle(fontSize:40,color: Colors.white,fontWeight: FontWeight.bold),),
          SizedBox(height: 15,),
          Text("You Won The Match",style: TextStyle(fontSize:20,color: Colors.white,fontWeight: FontWeight.bold),),
          SizedBox(height: 50,),
          ElevatedButton(
            onPressed: (){
              Navigator.pushReplacementNamed(context, "tic-tac-toe-page");
            },
            child: Text("Play Again",style: TextStyle(color: Colors.white,fontSize: 21,fontWeight: FontWeight.bold
            ),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff0E3049FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              side:BorderSide(
                color: Colors.white,
                width: 2
              ),
              padding:EdgeInsets.symmetric(vertical: 18,horizontal: 35),
            ),
          ),
       
        ],),
      ),
    );
  }
}
