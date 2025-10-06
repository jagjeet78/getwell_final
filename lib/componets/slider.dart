import 'package:flutter/material.dart';


class slider extends StatefulWidget {
  const slider({super.key});

  @override
  State<slider> createState() => _sliderState();
}

class _sliderState extends State<slider> {
  @override
  Widget build(BuildContext context) {
    return Center(

      child: Row(
        slider(
          
       min:1,
       max:100,

        ),

      ),



    );
  }
}