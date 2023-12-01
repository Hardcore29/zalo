import 'package:chat_app/views/login.dart';
import 'package:chat_app/views/register.dart';
import 'package:flutter/material.dart';

class WaitingScreenState extends StatelessWidget {
  const WaitingScreenState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                "assets/images/Zalo_Logo.png",
                width: 100,
              ),
            ),
            Expanded(
              flex: 4,
              child: Image.asset("assets/images/slider1.png",
                  width: double.infinity, fit: BoxFit.fill),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        Route<LoginScreen> route = MaterialPageRoute(
                            builder: (context) => const LoginScreen());
                        Navigator.push(context, route);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        )),
                        //padding: const EdgeInsets.all(12.0),
                        //minimumSize: const Size(200, 10)
                      ),
                      child: const Text("Đăng Nhập",
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.white)),
                    ))),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        Route<RegisterScreen> route = MaterialPageRoute(
                            builder: (context) => const RegisterScreen());
                        Navigator.push(context, route);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        )),
                        //padding: const EdgeInsets.all(12.0),
                        //minimumSize: const Size(200, 10)
                      ),
                      child: const Text("Đăng Ký",
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.white)),
                    )))
          ],
        ),
      ),
    );
  }
}
