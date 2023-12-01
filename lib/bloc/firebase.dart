import 'package:chat_app/models/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

class FireAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void register(String username, String pass, String name, Function onSuccess,
      Function(String) onErr) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: username, password: pass)
        .catchError((err) {
      if (kDebugMode) {
        print('Error: $err');
      }
      _onSignUpErr(err.code.toString(), onErr);
    }).then((user) {
      _createUser(user.user!.uid, username, name, onSuccess, onErr);
    });
  }

  void signIn(String username, String pass, Function onSuccess,
      Function(String) onError) {
    _firebaseAuth
        .signInWithEmailAndPassword(email: username, password: pass)
        .then((user) {
      onSuccess();
    }).catchError((err) {
      onError("Lỗi đăng nhập, vui lòng thử lại!");
    });
  }

  _createUser(
      String userId, String username, String name, Function onSuccess, Function onErr) {
    Map<String, dynamic> data =
        Users(userId, name, username, null, null, null, null).toJson();
    DatabaseReference ref = FirebaseDatabase.instance.ref().child("users");
    ref.child(userId).set(data).then((value) {
      print("on value: SUCCESSED");
      onSuccess();
    }).catchError((err) {
      print("err: ${err.toString()}");
      onErr();
    }).whenComplete(() {
      print("Hoàn thành");
    });
  }

  void _onSignUpErr(String code, Function(String) onRegisterError) {
    switch (code) {
      case "invalid-email":
        onRegisterError("Email không hợp lệ");
        break;
      case "email-already-in-use":
        onRegisterError("Email đã tồn tại");
        break;
      case "weak-password":
        onRegisterError("Mật khẩu quá yếu");
        break;
      default:
        onRegisterError("Đăng ký thất bại, vui lòng kiểm tra lại!");
        break;
    }
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
