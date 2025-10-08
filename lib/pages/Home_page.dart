import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart'; // Only if you use GetX for navigation

class HomePage extends StatelessWidget {

  const HomePage({super.key,});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       



        

      



          
        
      


        
       body:Column(
        children: [




        Padding(
          padding: EdgeInsetsGeometry.all(8),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.local_cafe_sharp),
                Text("Hi User",style: TextStyle(fontSize: 24),),
                Icon(Icons.map),
            
            
                





              ],
            ),
          ),
         



         // search bar for seraching thigns and the all 


        









          
        ],
       ) ,
      
        
      ),
    );
    
    
    }}



  void main() => runApp(MaterialApp(home: HomePage()));