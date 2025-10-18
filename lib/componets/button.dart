import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatefulWidget {

   final double  height;
   final double width;
   final String text;
   final double fontsize;
   final Color backcolor;
  final Color writecolor;
 final VoidCallback tapfunc;

  
  Button({
    super.key,
    required this.height,
    required this.width,
    required this.text,
    required this.fontsize,
    required this.backcolor,
    required this.writecolor,
    required this.tapfunc,


  
  
  
  
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
    onTap: ()=> widget.tapfunc(),

      child: Container(
        height: widget.height,
        width: widget.width,
      color: widget.backcolor,
      
        child: Center(
          child: Padding(
            padding: EdgeInsetsGeometry.only(
              top:5.5,
              bottom: 5.5,
              left:25.5,
              right: 25.5,
            ),
            child: Text('${widget.text}', style: GoogleFonts.manrope(
              fontSize: widget.fontsize,
              color: widget.writecolor,
              fontWeight: FontWeight.w500,
              
            ),),
          ),
        ),
      
      
        
      ),
    );
  }
}