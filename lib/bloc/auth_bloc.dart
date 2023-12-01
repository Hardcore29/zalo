import 'dart:async';
import 'package:chat_app/bloc/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CheckAuth {
  final StreamController _userController = StreamController();
  final StreamController _passController = StreamController();
  final StreamController _confirmController = StreamController();
  final StreamController _nameController = StreamController();

  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;
  Stream get confirmStream => _confirmController.stream;
  Stream get nameStream => _nameController.stream;
  final FireAuth _fireAuth = FireAuth();

  bool isInvalid(String user, String pass, String confirm, String name) {
    if (user.isEmpty) {
      _userController.addError("Nhập email");
      return false;
    }
    _userController.sink.add("");

    if (name.isEmpty) {
      _nameController.addError("Nhập tên");
      return false;
    } else if (name.length < 4 || name.length > 40) {
      _nameController.addError("Tên phải từ 4 đến 40 kí tự");
    } else if (!name.contains(RegExp(r'^[a-zA-Z]$'))) {
      _nameController.add("Tên không chứa số và kí tự đặc biệt");
    }
    _nameController.sink.add("");

    if (pass.isEmpty) {
      _passController.addError("Nhập mật khẩu");
      return false;
    } else if (pass.length < 6 || pass.length > 10) {
      _passController.addError("Mật khẩu phải từ 6 đến 10 kí tự");
    }
    _passController.sink.add("");

    if (confirm.isEmpty) {
      _confirmController.addError("Nhập xác nhận mật khẩu");
      return false;
    } else if (confirm != pass) {
      _confirmController.addError("Xác nhận mật khẩu không hơp lệ");
      return false;
    }
    _confirmController.sink.add("");

    return true;
  }

  void register(String username, String pass, String name, Function onSuccess,
      Function(String) onErr) {
    _fireAuth.register(username, pass, name, onSuccess, onErr);
  }

  void signIn(String email, String pass, Function onSuccess,
      Function(String) onSignInError) {
    _fireAuth.signIn(email, pass, onSuccess, onSignInError);
  }

  User? getUser() {
    User? currentuser = FirebaseAuth.instance.currentUser;
    return currentuser;
  }

  void dispose() {
    _userController.close();
    _passController.close();
    _confirmController.close();
  }
}
