import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Image.asset("assets/images/g1.jpg",width: double.infinity,height: double.infinity,fit: BoxFit.fitHeight,),
            Container(
              color: Colors.black.withOpacity(0.8),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("TIC",style: TextStyle(fontSize: 70,fontWeight:
                  FontWeight.bold,color: Colors.white,
                      shadows: <Shadow>[
                      Shadow(
                    blurRadius: 45.0,
                    color: Colors.red,
                  ),

                ],
                  ),
                  ),
                  Text("TAC",style: TextStyle(fontSize: 70,fontWeight:
                  FontWeight.bold,color: Colors.white,
                    shadows: <Shadow>[
                      Shadow(
                        blurRadius: 45.0,
                        color: Colors.blue,
                      ),

                    ],

                  ),),
                  Text("TOE",style: TextStyle(fontSize: 80,fontWeight:
                  FontWeight.bold,color: Colors.white,
                    shadows: <Shadow>[
                    Shadow(
                    blurRadius: 45,
                    color: Colors.orange,
                  ),

                    ],
                  ),),
                  SizedBox(height:70),

                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, "tic-tac-toe-page");
                    },
                    child: Text("Start Game",style: TextStyle(
                        shadows: <Shadow>[
                          Shadow(
                            blurRadius: 2,
                            color: Colors.white,
                          ),

                        ],

                        color: Colors.white,fontSize: 21,fontWeight: FontWeight.bold
       ),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),

                      ),
                      side: BorderSide(
                        color: Colors.white,
                        width: 2
                      ),
                      padding:EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
