import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
      
        body: Center(
    
   child: Column(
          children: [
            
              
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/lalit.png",
               // fit: BoxFit.fitWidth,
                scale: 2,
                
                
              ),
              
            ),
            Expanded(child: Column(children: [
              Container(
                child: Text("Lalit Chataut",textScaleFactor: 2,),
              ),
              Container(
                child: Text("lalitchataut15@gmail.com", textScaleFactor: 2,),
              ),
            ],))
         
            
             
             
             
             
             
             ],
             
           

             )
             
        ),
     
        );
  }
}
