import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plinic2/src/pages/my/my_test.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: TextButton(
          onPressed: () {
            Get.to(()=>MyTestPage());
            // await FirebaseAuth.instance.signOut();
          },
          child: Text('마이페이지 이동'),
        ),
        // child: Mjpeg(
        //   stream: 'http://192.168.1.1/snapshot.cgi?resolution=11&user=admin&pwd=',
        //   // http://192.168.1.1/snapshot.cgi?resolution=6&reinit_camera=1&save=1&user=admin&pwd=
        //   // http://192.168.1.1/snapshot.cgi?resolution=11&user=admin&pwd=
        //   // http://192.168.1.1/protocol.csp?opt=snap&function=set
        //   // http://192.168.1.1/livestream.cgi?resolution=1&user=admin&pwd=admin
        //   width: 550,
        //   height: 600,
        //   isLive: true,
        // )
      ),
    );
  }
}
