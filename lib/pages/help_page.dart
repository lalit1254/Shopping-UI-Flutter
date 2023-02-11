import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learningproject/models/catalog.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  //get actions => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Help Center",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26),
          ),
        ),
        body: Column(
          children: [
            Column(
              children: [
                Container(
                  child: Text(
                    "Hi, how can we help you?",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    child: Column(children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          // labelText: "Search",
                        ),
                      ),
                      
                    ]))
              ],
            ),
            Container(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: List.generate(choices.length, (index) {
                  return Center(
                    child: SelectCard(
                      choice: choices[index]
                      ),
                  );
                }
                )
            )

    )
    ]
    ));
    
  }
}

class Choice {
  const Choice({required this.title, required this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Track Order', icon: Icons.home),
  const Choice(title: 'My returns', icon: Icons.reset_tv),
  const Choice(title: 'Cancellations', icon: Icons.cancel),
  const Choice(title: 'Reset Password', icon: Icons.restore),
  const Choice(title: 'Payment Options', icon: Icons.payment),
  const Choice(title: 'My vouchers', icon: Icons.currency_exchange),
  const Choice(title: 'Account modification', icon: Icons.mode_edit_outline),

];

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
   // final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(

        child: Center(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Icon(choice.icon, size:50.0, color: Colors.deepPurple)),
              Text(choice.title, textWidthBasis: TextWidthBasis.longestLine,),
            ]
        ),
        )
    );
  }
}
  
