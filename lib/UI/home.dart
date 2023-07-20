import 'package:flutter/material.dart';

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BizCard"),
        centerTitle: true,
      ),
      backgroundColor: Colors.orangeAccent,
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            _getCard(),
            _getAvatar()
          ],
        ),
      ),
    );
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(50),
      decoration: BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.circular(35.5)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("\nPranshu Chaurasia",
            style: TextStyle(fontSize: 25.5,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),),
          Text(
            "\nlorem ipsum lorem ipsum lorem ipsum\nlorem ipsum lorem ipsum lorem ipsum\n",
            style: TextStyle(fontStyle: FontStyle.italic),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_2_outlined),
              Text("contact.pranshu30@hotmail.com",
                style: TextStyle(fontWeight: FontWeight.w700),)
            ],
          )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Colors.redAccent, width: 2.5),
          image: DecorationImage(
              image: NetworkImage("https://picsum.photos/id/3/5000/3333"),
              fit: BoxFit.cover)
      ),
    );
  }
}