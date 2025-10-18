import '/utils/generalexport.dart';

class Hospitaldetailspage extends StatefulWidget {
  const Hospitaldetailspage({super.key});

  @override
  State<Hospitaldetailspage> createState() => _HospitaldetailspageState();
}

class _HospitaldetailspageState extends State<Hospitaldetailspage> {

  @override
  Widget build(BuildContext context) {
        print('Screen Height: ${Get.height}');
    print('Screen Width: ${Get.width}');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          title: Text('Hospital Details',style: GoogleFonts.manrope(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color:AppColor.primarycolor,
            
          ),),

          backgroundColor: Colors.white,


        ),
       
        body:Padding(
          padding: EdgeInsets.symmetric(horizontal:16),
          child: Column(
              children: [
          
              Container(
                height: Get.height*0.2,
                width: double.infinity,
                color: Colors.white,
                
                child: Center(
          child: Image.asset('assets/images/hospital.png',height: Get.height*0.20,fit: BoxFit.fill,width: Get.width*0.9,),
                ),
              ),
         
          
          Container(
            height: 60,
         
           decoration: BoxDecoration(
          
          
   


            
           ),

           child: Padding(
             padding: EdgeInsets.only(top: 20,bottom: 12),
             child: Row(children: [
              Expanded(
                child: Container(
                  
                 child:Text('City General Hospital',style: GoogleFonts.manrope(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                                 color: AppColor.primarycolor,
                 ),) ,
                ),
              ),










              
             ],),
           ),
          ),
             

          Container()
          
          
          
          
          
          
          
              ],
          
          
          
          
          ),
        ),


        
      ),
    );
  }
}