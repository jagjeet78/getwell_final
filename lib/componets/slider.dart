import 'package:flutter/material.dart';


class slider extends StatefulWidget {
  const slider({super.key, required double value, required int min,required int max});

  @override
  State<slider> createState() => _sliderState();
}

class _sliderState extends State<slider> {

  double age =25.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      

      child: Row(

        children: [
          slider(
            
            value:age,
            min:1,
            max:120,
            
          
          )
        ],
        
      ),



    );
  }
}