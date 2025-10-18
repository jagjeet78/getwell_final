import '/utils/generalexport.dart';

class Hospitaldetailspage extends StatefulWidget {
  const Hospitaldetailspage({super.key});

  @override
  State<Hospitaldetailspage> createState() => _HospitaldetailspageState();
}

class _HospitaldetailspageState extends State<Hospitaldetailspage> {

  @override
  Widget build(BuildContext context) {
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
       
        body:Column(
    children: [

    Container(
      height: Get.height*0.15,
      width: double.infinity,
      color: Colors.grey,
      child: Center(
        child: Text('Hospital Image Placeholder', style: GoogleFonts.manrope(
          fontSize: 16,
          color: Colors.white,
        ),),
      ),
    ),



    ],




        ),


        
      ),
    );
  }
}