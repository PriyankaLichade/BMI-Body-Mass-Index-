import 'package:flutter/material.dart';

void main() {
  runApp(const MyBMI());
}

class MyBMI extends StatelessWidget{
  const MyBMI ({super.key});

  Widget build(BuildContext context){
    return MaterialApp(
      title:"BMI Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home:BMIPage(),
    );
  }
}

class BMIPage extends StatefulWidget{
  const BMIPage ({super.key});
  
  State<BMIPage> createState(){
    return _BMIPageState();
  }
}
  
  class _BMIPageState extends State<BMIPage>{

    TextEditingController wtController = TextEditingController();
    TextEditingController ftController = TextEditingController();
    TextEditingController inController = TextEditingController();

    double bmi = 0;
    String result = "";

    
   
    Widget build(BuildContext context)
    {
      return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child:Container(
          width:300,
          height:500,
          child:Center(
            
          
          child:Column(
            //mainAxisAlignment: MainAxisAlignment.center,
           // crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            TextField(
              controller: wtController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Weight (kg)",
                
                prefixIcon: Icon(Icons.line_weight),
                border: OutlineInputBorder(),
                
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: ftController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Height (ft)",
                
                prefixIcon: Icon(Icons.height), 
                border: OutlineInputBorder(),
                
              ),
            ),
            SizedBox(height: 10,),
            TextField(
               controller: inController,
               keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Height (in)",
                
                prefixIcon: Icon(Icons.height), 
                border: OutlineInputBorder(),
               
              ),
            ),
            SizedBox(height: 20,),
    ElevatedButton(
      style:ElevatedButton.styleFrom(backgroundColor: Colors.purple.shade300,minimumSize: Size(100,50)),
    onPressed: (){

        var wt = wtController.text.toString();
        var ft = ftController.text.toString();
        var inch =inController.text.toString();

    if(wt!="" && ft!="" && inch!="")
    {
      //BMI calculation

      var owt= int.parse(wt);
      var oft= int.parse(ft);
      var oinch= int.parse(inch);

      var total=oinch+(oft*12);

      var tcm=total*2.54;

      var tmeter=tcm/100;

      bmi=owt/(tmeter*tmeter);

      if(bmi>25)
      {
        result="You are Overweight\nYour BMI is : ${bmi.toStringAsFixed(3)}";
      }
      else if(bmi<18.5)
      {
        result="You are Underweight\nYour BMI is : ${bmi.toStringAsFixed(3)}";
      }
      else
      {
        result="You are Normal Weight\nYour BMI is : ${bmi.toStringAsFixed(3)}";
      }

    }
    else
    {
      result="Please Fill all the blanks";
    } 
    setState((){
      
    });
     },
        child: Text("Calculate BMI",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight:FontWeight.bold),),
       ),
       SizedBox(height: 10,),
            Text("${result}",style:TextStyle(fontSize: 20,color: Colors.black,fontWeight:FontWeight.bold)),
          ],
        ),
        ),
          ),
        ),
      );
    }
  }