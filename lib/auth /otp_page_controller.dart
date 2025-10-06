import 'dart:async';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OtpPageController extends GetxController {
  late Timer _timer;
  var seconds = (60).obs;
  RxInt resetotpcount =0.obs;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
   
    
  }

  @override
  void onClose() {
    // This is the most important part. We cancel the timer
    // to prevent it from running in the background after the
    // page is gone. We use our instance variable '_timer'.
    _timer.cancel();
    print("Timer cancelled because the page was closed.");
    super.onClose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
      } else {
        _timer.cancel();
          resetotpcount.value++;
        print("OTP expired. Count: ${resetotpcount.value}");
      }
    });
  }

  void restartTimer(){
 _timer.cancel();      // cancel previous timer
  seconds.value = 60;   // reset countdown
  _startTimer();        // start a new timer
}



void popout(int time){
   Future.delayed(Duration(seconds: time), () {
      SystemNavigator.pop(); // gracefully closes the app
      // Or use exit(0); if you want to force exit
    });
}



}





