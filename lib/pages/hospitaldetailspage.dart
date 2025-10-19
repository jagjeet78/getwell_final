import '/utils/generalexport.dart';
import '../sampledata/Medicalcategory.dart';
import '/Routes/app_routes.dart';
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
          title: Text(
            'Hospital Details',
            style: GoogleFonts.manrope(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColor.primarycolor,
            ),
          ),

          backgroundColor: Colors.white,
        ),

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: Get.height * 0.23,
                  width: double.infinity,
                  color: Colors.white,

                  child: Center(
                    child: Image.asset(
                      'assets/images/hospital.png',
                      height: Get.height * 0.20,
                      fit: BoxFit.fill,
                      width: Get.width * 0.9,
                    ),
                  ),
                ),

                Container(
                  height: 60,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 12),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            'City General Hospital',
                            style: GoogleFonts.manrope(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primarycolor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  height: Get.height * 0.048,

                  width: Get.width * 0.9,

                  child: Padding(
                    padding: EdgeInsetsGeometry.only(top: 4, bottom: 12),
                    child: Row(
                      children: [
                        Text(
                          '123 Main Street, Anytown, USA',
                          style: GoogleFonts.manrope(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColor.primarycolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: Get.height * 0.048,

                  width: Get.width * 0.9,

                  child: Padding(
                    padding: EdgeInsetsGeometry.only(top: 4, bottom: 12),
                    child: Row(
                      children: [
                        Text(
                          '(555) 123-4567',
                          style: GoogleFonts.manrope(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColor.primarycolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  height: Get.height * 0.055,

                  width: Get.width * 0.9,

                  child: Padding(
                    padding: EdgeInsetsGeometry.only(top: 16, bottom: 8),
                    child: Row(
                      children: [
                        Text(
                          'Departments',
                          style: GoogleFonts.manrope(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primarycolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Padding(
                  padding: EdgeInsetsGeometry.only(left: 0),
                  child: SizedBox(
                    height: 45, // must give height when inside Column
                    child: ListView.builder(
                      itemCount: medicalCategories.length,

                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final category = medicalCategories[index];
                        return Container(
                          width: 130,
                          height: 32,
                          color: Color(0xFFF0F2F5),

                          margin: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsetsGeometry.only(
                                  left: 5,
                                  right: 5,
                                ),
                                child: Icon(
                                  category.icon,
                                  size: 18,
                                  color: AppColor.writecolor,
                                ),
                              ),
                              SizedBox(width: 2),
                              Text(
                                category.name,
                                style: GoogleFonts.manrope(
                                  color: AppColor.writecolor,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),

                Container(
                  height: Get.height * 0.055,

                  width: Get.width * 0.9,

                  child: Padding(
                    padding: EdgeInsetsGeometry.only(top: 16, bottom: 8),
                    child: Row(
                      children: [
                        Text(
                          'Doctors',
                          style: GoogleFonts.manrope(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primarycolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Container(
                  height: Get.height * 0.20,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      doctorcard(),
                      doctorcard(),
                      doctorcard(),
                      doctorcard(),
                      doctorcard(),
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

Widget doctorcard() {
  return Container(
    height: Get.height * 0.14,
    width: Get.width * 0.4,

    child: GestureDetector(

      onTap: () {
      Get.toNamed(AppRoutes.DoctordetailsPage);
      },
      child: Column(
        children: [
          Container(
            height: Get.height * 0.14,
            width: Get.width * 0.40,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
          ),
          Container(
            height: Get.height * 0.04,
            width: Get.width * 0.40,
      
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dr. Jane Smith',
                  style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primarycolor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
