import 'package:flutter/material.dart';

void main() {
  runApp(HealthTrackerApp());
}
class HealthTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health Tracker',
      theme: ThemeData(
    primaryColor: Colors.teal,
    scaffoldBackgroundColor: Colors.teal[200],),
  home:

  BodyMassIndexScreen(),);
  }
}

class BodyMassIndexScreen extends StatefulWidget {


  @override

  _BodyMassIndexScreenState createState() => _BodyMassIndexScreenState();


}


class _BodyMassIndexScreenState extends State<BodyMassIndexScreen> {
  int userHeight = 170;
 int userWeight = 65;
  int userAge = 25;

  String selectedGender = 'male';
 double calculatedBMI = 0;

  void computeBMI() {
    setState(() {
    calculatedBMI = userWeight / ((userHeight / 100) * (userHeight / 100));
    });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Body Mass Index'), backgroundColor: Colors.teal,),
      body: Column(
     children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
              GestureDetector(onTap: () {
                  setState(() {
              selectedGender = 'male';
                  });
                },
                child: Container(
                  width: 140,
                  height: 140,
          margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
             color: selectedGender == 'male' ? Colors.teal[400] : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 5,
               offset: Offset(0, 3),
                      ),],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.male, size: 50, color: selectedGender == 'male' ? Colors.white : Colors.teal),

         Text('Male', style: TextStyle(color: selectedGender == 'male' ? Colors.white : Colors.teal, fontSize: 18,),),

                      ],
            ),
              ),
            ),
         ),
          GestureDetector(
        onTap: () {
                  setState(() {
         selectedGender = 'female';
                  });
                },
                child: Container(
           width: 140,
                  height: 140,
              margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: selectedGender == 'female' ? Colors.pink[300] : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 3),),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.female, size: 50, color: selectedGender == 'female' ? Colors.white : Colors.pink),
                        Text('Female', style: TextStyle(color: selectedGender == 'female' ? Colors.white : Colors.pink, fontSize: 18,),),
              ],
              ),
           )
               ,
                ),

          ),
            ],
          ),
          SizedBox(height: 20),
     Slider(value: userHeight.toDouble(), min: 100, max: 250,
            activeColor: Colors.teal,
        inactiveColor: Colors.teal[100],
            onChanged: (value) {
              setState(() {
                userHeight = value.toInt();
              }

              );
            },
     ),
      Text('Height: $userHeight cm', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal[900]),),

          SizedBox(height: 20),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
      children: [
    Text('Weight',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal[900]),),

              SizedBox(width: 20),
              Row(
                children: [
        IconButton(
   icon: Icon(Icons.remove_circle_outline, color: Colors.teal),
           onPressed: () {
       setState(() {
         if (userWeight > 0) userWeight--;

                      }

                      );
                        },
            ),

                  Text('$userWeight kg',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal[900]),),
    IconButton(icon: Icon(Icons.add_circle_outline, color: Colors.teal),
                    onPressed: () {
                     setState(() {
              userWeight++;
               }
               );
                    },
               ),
           ],
           ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Age',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal[900]),
              ),
              SizedBox(width: 20),
              Row(
                children: [
                  IconButton(icon: Icon(Icons.remove_circle_outline, color: Colors.teal), onPressed: () {
                      setState(() {
                        if (userAge > 0) userAge--;

                      }

                );
                    },
                  ),
                  Text('$userAge years', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal[900]),),
                  IconButton(
              icon: Icon(Icons.add_circle_outline, color: Colors.teal),
                    onPressed: () {
                 setState(() {userAge++;
                      }

                      );
           },
            )
                  ,
          ],
              ),
            ],
          ),
          SizedBox(height: 20),

          ElevatedButton(onPressed: computeBMI,

            child: Text('Calculate BMI', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
    backgroundColor: Colors.teal,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Your BMI: ${calculatedBMI.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal[900]),
       ),
        ],
  ),
    );
  }
}