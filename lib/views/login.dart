import 'package:chat_app/bloc/auth_bloc.dart';
import 'package:chat_app/views/custom.dart';
import 'package:chat_app/views/home.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final String _userError = "Tên đăng nhập không hợp lệ";
  final String _passError = "Mật khẩu không hợp lệ";
  final bool _userInvalid = false;
  final bool _passInvalid = false;
  bool _show = true;
  final CheckAuth _checkAuth = CheckAuth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Đăng nhập",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: MyTextField(
                    controller: _userController,
                    obscureText: false,
                    hintText: "Email",
                    errorText: _userInvalid ? _userError : null,
                  )),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: <Widget>[
                        MyTextField(
                          controller: _passController,
                          obscureText: _show,
                          hintText: "Mật khẩu",
                          errorText: _passInvalid ? _passError : null,
                        ),
                        GestureDetector(
                            onTap: showpass,
                            child: Text(
                              _show ? "HIỆN" : "ẨN",
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.grey),
                            )),
                      ])),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: ElevatedButton(
                    onPressed: _onLoginClick,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      )),
                    ),
                    child: const Text(
                      "Đăng Nhập",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Text(
                  "Lấy lại mật khẩu",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          )),
    );
  }

  void showpass() {
    setState(() {
      _show = !_show;
    });
  }

  void _onLoginClick() {
    String username = _userController.text;
    String pass = _passController.text;
    _checkAuth.signIn(username, pass, () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Home()));
    }, (msg) {
      MsgDialog.showMsgDialog(context, "Đăng nhập", msg);
    });
  }
}
