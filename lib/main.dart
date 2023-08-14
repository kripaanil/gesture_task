

import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

void main(List<String> args) {
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:Home()
    );
  }
}
class Home extends StatefulWidget {
   Home({super.key});
  

  @override
  State<Home> createState() => _HomeState();
}
double _scaleFactor = 1.0;
double _baseScaleFactor = 1.0;
class _HomeState extends State<Home> {
  var icon=Icon(Icons.favorite,);
  bool press=true;
  bool prs=true;
  var norm=20.0;
  // var zoomin=50.0;
  // var zoomout=20.0;
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("TAP ME",style: TextStyle(fontSize: 30),),
                  GestureDetector(
                    child: Icon(Icons.favorite,
                    color: press == true? Colors.red : Colors.black,),
                    
                    onTap: () =>
                    setState(() {  
                      press=!press;
                      }),
                      ),
                ],
              ),
              
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [
                      Text("Long press",style: TextStyle(fontSize: 20),),
                      GestureDetector(
                        child:Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: prs==true? BoxShape.circle : BoxShape.rectangle
                          ),

                        ), 
                        onLongPress: () => 
                        setState(() {
                           prs=!prs;
                          _displaySuccessMotionToast();

                          }),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector
                  (child: Text(
                    "Zoom out Zoom in",
                    textScaleFactor: _scaleFactor,
                    ),
                  
                  onScaleStart: (details) => 
                 _baseScaleFactor = _scaleFactor,
                  onScaleUpdate: (details) => 
                  setState(() {
                    _scaleFactor = _baseScaleFactor * details.scale;
                  }),
                  )

            ],
          ),
              
        )),
    );
  }


void _displaySuccessMotionToast() {
    MotionToast toast = MotionToast.success(
      title: const Text(
        'clicked',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      description: const Text(
        'LONG PRESSED',
        style: TextStyle(fontSize: 12),
      ),
      layoutOrientation: ToastOrientation.ltr,
      animationType: AnimationType.fromLeft,
      dismissable: true,
    );
    toast.show(context);
    Future.delayed(const Duration(seconds: 4)).then((value) {
      toast.dismiss();
    });
  }
}