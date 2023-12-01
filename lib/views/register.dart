import 'package:chat_app/views/custom.dart';
import 'package:chat_app/views/login.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/bloc/auth_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _show = true;
  final CheckAuth _checkAuth = CheckAuth();
  @override
  void dispose() {
    _checkAuth.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Đăng Ký",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
        child: Column(children: [
           Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: StreamBuilder(
                stream: _checkAuth.nameStream,
                builder: (context, snapshot) => MyTextField(
                  errorText: snapshot.hasError ? snapshot.error : null,
                  controller: _nameController,
                  obscureText: false,
                  hintText: "Nhập tên người dùng",
                ),
              )),
          Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: StreamBuilder(
                stream: _checkAuth.userStream,
                builder: (context, snapshot) => MyTextField(
                  errorText: snapshot.hasError ? snapshot.error : null,
                  controller: _userController,
                  obscureText: false,
                  hintText: "Số email",
                ),
              )),
          Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child:
                  Stack(alignment: AlignmentDirectional.centerEnd, children: [
                StreamBuilder(
                  stream: _checkAuth.passStream,
                  builder: (context, snapshot) => MyTextField(
                    errorText: snapshot.hasError ? snapshot.error : null,
                    controller: _passController,
                    obscureText: _show,
                    hintText: "Mật khẩu",
                  ),
                ),
                GestureDetector(
                    onTap: showpass,
                    child: Text(
                      _show ? "HIỆN" : "ẨN",
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    )),
              ])),
          Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child:
                  Stack(alignment: AlignmentDirectional.centerEnd, children: [
                StreamBuilder(
                  stream: _checkAuth.confirmStream,
                  builder: (context, snapshot) => MyTextField(
                    errorText: snapshot.hasError ? snapshot.error : null,
                    controller: _confirmController,
                    obscureText: _show,
                    hintText: "Xác nhận mật khẩu",
                  ),
                ),
                GestureDetector(
                    onTap: showpass,
                    child: Text(
                      _show ? "HIỆN" : "ẨN",
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    ))
              ])),
          Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: ElevatedButton(
                onPressed: onclickRegister,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  )),
                ),
                child: const Text(
                  "Đăng Ký",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ))
        ]),
      ),
    );
  }

  void showpass() {
    setState(() {
      _show = !_show;
    });
  }

  onclickRegister() async {
    var isValid = _checkAuth.isInvalid(
        _userController.text, _passController.text, _confirmController.text, _nameController.text);
    if (isValid) {
      _checkAuth.register(_userController.text, _passController.text, _nameController.text, () {
        MsgDialog.showMsgDialog(context, "Đăng ký", "Đăng ký thành công");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }, (msg) {
        MsgDialog.showMsgDialog(context, "Đăng ký", msg);
      });
    }
  }
}
