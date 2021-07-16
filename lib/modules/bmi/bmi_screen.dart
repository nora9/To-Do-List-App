import 'dart:ffi';
import 'dart:math';

import 'package:bmi/modules/bmi_result/bmi_result_secreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;
  double height= 180;
  int weight=60;
  int age=30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          //Start section 1 --------------------------------------------------------------------------------------
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale=true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: isMale ? Colors.blue : Colors.grey[300],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/male.png'),
                              color:isMale ? Colors.grey[200]:Colors.black,
                              height: 90.0,
                              width: 90.0,
                            ),
                            SizedBox(height: 15.0,),
                            Text(
                              'Male',
                              style: TextStyle(
                                color:isMale ? Colors.grey[200]:Colors.black,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale=false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: !isMale ? Colors.blue : Colors.grey[300],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/female.png'),
                              color:!isMale ? Colors.grey[200]:Colors.black,
                              height: 90.0,
                              width: 90.0,
                            ),
                            SizedBox(height: 15.0,),
                            Text(
                              'Female',
                              style: TextStyle(
                                color:!isMale ? Colors.grey[200]:Colors.black,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //End Section 1 ------------------------------------------------------------------------------------------

          //Start section 2 --------------------------------------------------------------------------------------
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[300],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        Text(
                          'CM',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: height,
                      max: 220.0,
                      min: 40.0,
                      onChanged: (value){
                        setState(() {
                          height=value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          //End Section 2 ------------------------------------------------------------------------------------------

          //Start section 3 --------------------------------------------------------------------------------------
          Expanded(
            child:  Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[300],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${weight}',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             FloatingActionButton(
                               onPressed: (){
                                 setState(() {
                                   weight--;
                                 });
                               },
                               heroTag: 'w--',
                               mini: true,
                               child: Icon(
                                 Icons.remove,
                               ),
                             ),
                             FloatingActionButton(
                               onPressed: (){
                                 setState(() {
                                   weight++;
                                 });
                               },
                               heroTag: 'w++',
                               mini: true,
                               child: Icon(
                                 Icons.add,
                               ),
                             ),
                           ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[300],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${age}',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             FloatingActionButton(
                               onPressed: (){
                                 setState(() {
                                   age--;
                                 });
                               },
                               heroTag: 'age--',
                               mini: true,
                               child: Icon(
                                 Icons.remove,
                               ),
                             ),
                             FloatingActionButton(
                               onPressed: (){
                                 setState(() {
                                   age++;
                                 });
                               },
                               heroTag: 'age++',
                               mini: true,
                               child: Icon(
                                 Icons.add,
                               ),
                             ),
                           ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //End Section 3 ------------------------------------------------------------------------------------------

          //Start section 4 --------------------------------------------------------------------------------------
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.blue,
              ),
              width: double.infinity,
              child: MaterialButton(
                height: 50.0,
                onPressed: (){
                  var result= weight / pow(height/100, 2);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)
                        {
                         return BmiResultScreen(
                           isMale: isMale,
                           age: age,
                           result: result.round(),
                         );
                        },
                      ),
                  );
                },
                child: Text(
                  'Calcualte',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
