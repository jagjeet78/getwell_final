import '/utils/generalexport.dart';
import '../sampledata/Medicalcategory.dart';

class Doctordetailspage extends StatefulWidget {
  const Doctordetailspage({super.key});

  @override
  State<Doctordetailspage> createState() => _DoctordetailspageState();
}

class _DoctordetailspageState extends State<Doctordetailspage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Doctor Details',

            style: GoogleFonts.manrope(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColor.primarycolor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 20),
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                'assets/images/user.png',
                              ),
                            ),

                            SizedBox(height: 4),
                            Column(
                              children: [
                                Text(
                                  'John Doe',
                                  style: GoogleFonts.manrope(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.writecolor,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Cardiologist',
                                  style: GoogleFonts.manrope(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'About',
                            style: GoogleFonts.manrope(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primarycolor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),

                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Text(
                              'Dr. John Doe is a highly skilled cardiologist with over 10 years of experience in treating heart-related conditions. He is dedicated to providing the best care for his patients and staying updated with.',
                            ),
                            
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
