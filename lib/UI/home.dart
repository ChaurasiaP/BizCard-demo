import 'package:biz_card/Util/HexColor.dart';
import 'package:flutter/material.dart';

class BillSplitter extends StatefulWidget {
  const BillSplitter({super.key});

  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {

  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  Color _purple = HexColor("#6908D6");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.black12.withOpacity(0.08),
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: <Widget>[
            Container(
              width: 150,
              height: 50,
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.5),
                color: Colors.grey.shade50, //Colors.purpleAccent.shade100,
              ),
              alignment: Alignment.center,
              child: Text("Tip Calculator", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.redAccent),
              ),),
            // per person share display box
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.5),
                color: _purple.withOpacity(0.2), //Colors.purpleAccent.shade100,
              ),

              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Text("Total Per Person", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: _purple
                      ),),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("\$ ${calculateTotalTipPerPerson(_billAmount, _personCounter, _tipPercentage)}",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0
                        ),),
                      )
                    ]

                ),

              ),

            ),
            // per person share display box ends

            // enter bill amount widget, split, divide with share box
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.white60,
                  border: Border.all(
                      color: Colors.blueGrey.shade700
                  )

              ),
              child: Column(
                children: <Widget>[

                  // bill amount input/display block
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: _purple,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        prefixText: "Bill Amount: ",
                        prefixIcon: Icon(Icons.attach_money)
                    ),

                    onChanged: (String value){
                      try{
                        _billAmount = double.parse(value);
                      }catch(exception){
                        _billAmount = 0.0;
                      }
                    },

                  ),

                  // split, decrement, personCounter, increment widget
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Split text display
                      Text("Split", style: TextStyle(
                          color: Colors.grey.shade700
                      )

                      ),

                      Row(
                        // - countDisplay + buttons
                        children: <Widget>[
                          // decrement button
                          InkWell(
                            onTap: (){
                              setState(() {
                                if(_personCounter >1){
                                  _personCounter--;
                                }
                              }
                              );

                            },

                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: _purple.withOpacity(0.1)
                              ),

                              child: Center(
                                child: Text(
                                  "-", style: TextStyle(
                                    color: _purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0
                                ),

                                ),

                              ),

                            ),

                          ),
                          // decrement button ends

                          // person count display
                          Text("$_personCounter", style: TextStyle(
                              color: _purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0
                          ),
                          ),
                          // person count display ends

                          // person count increment button
                          InkWell(
                            onTap: (){
                              setState(() {
                                _personCounter++;
                              }
                              );

                            },

                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: _purple.withOpacity(0.1)
                              ),

                              child: Center(
                                child: Text(
                                  "+", style: TextStyle(
                                    color: _purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0
                                ),

                                ),

                              ),

                            ),

                          ),
                          // person count increment button ends

                        ],

                      ),

                    ],
                    // - countDisplay + buttons end

                  ),
                  // split, decrement, personCounter, increment widget ends

                  //TIP widget
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // tip text display
                      Text("Tip",style: TextStyle(
                          color: Colors.grey.shade700
                      ),),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.5, right: 20.5),
                        child: Text("\$ ${calculateTotalTip(_billAmount, _personCounter, _tipPercentage)}",style: TextStyle(
                            color: _purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0
                        )),
                      )
                    ],
                  ),

                  // SLIDER WIDGET
                  Column(
                    children: <Widget>[
                      Text("$_tipPercentage%", style: TextStyle(
                          color: _purple,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold
                      ),),
                      Slider(
                          min: 0, max:100, // enable slider to set the values between min and max (both inclusive)
                          activeColor: _purple, inactiveColor: Colors.grey,
                          divisions: 50, // kind of like step counter, 100 pointer slider will be divided into 50 divisions

                          value: _tipPercentage.toDouble(),
                          onChanged: (double newValue){
                            setState(() {
                              _tipPercentage = newValue.round();
                            });
                          })
                    ],
                  )

                ],

              ),

            ),

          ],

        ),

      ),

    );
  }
  calculateTotalTipPerPerson(double billAmount, int splitBy, int tipPercentage){
    var totalPerPerson = ((calculateTotalTip(billAmount, splitBy, tipPercentage)) + billAmount)/splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }
  calculateTotalTip(double billAmount, int splitBy, int tipPercentage){
    double totalTip = 0.0;

    if(billAmount < 0 || billAmount.toString().isEmpty || billAmount == null){
      // do nothing
    }else{
      totalTip = (billAmount * tipPercentage / 100);
    }
    return totalTip;
  }
}
