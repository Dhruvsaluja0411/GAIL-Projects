import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(String message)
{
  Fluttertoast.showToast(
        msg: message,
        // toastLength: Toast.LENGTH_SHORT,
        // gravity: ToastGravity.CENTER,
        // timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
}

showLoaderDialog(BuildContext context){
  AlertDialog alert = AlertDialog(
    content: Builder(builder: (context){
      return SizedBox(
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          const CircularProgressIndicator(
            color: Colors.red,
          ),
          const SizedBox(height: 18,),
          Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text("Loading..."),
          )
        ]),
      );
    }),
  );
  showDialog(
    barrierDismissible: false,
    context: context, builder: (BuildContext context){
      return alert;
    });
}

String getMessageFromErrorCode(String errorCode){
  switch(errorCode){
    case "ERROR_EMAIL_ALREADY_IN_USE":
      return "Email already used. Go to login page.";
    case "account-exists-with-different-credentials":
      return "Email already used. Go to login page.";
    case "email-already-in-use":
      return "Email already used. Go to login page.";
    case "ERROR_WRONG_PASSWORD":
      return "wrong-password.";
    case "ERROR_USER_NOT_FOUND":
      return "No user found with this email.";
    case "user-not-found":
      return "Email already used. Go to login page.";
    case "ERROR_USER_DISABLED":
      return "user disabled.";
    case "ERROR_TOO_MANY_REQUESTS":
      return "too many requests to log into this account.";
    case "operation-not-allowed":
      return "too many requests to log into this account.";
    case "ERROR_OPERATION_NOT_ALLOWED":
      return "too many requests to log into this account.";
    case "ERROR_INVALID_EMAIL":
      return "Email address is invalid.";
    case "invalid-email":
      return "Email address is invalid.";
    default:
      return "Login failed. Please try again.";
  }
}

bool loginValidation(String email, String password){
  if(email.trim().isEmpty && password.trim().isEmpty)
  {
    showMessage("Both fields are empty.");
    return false;
  }
  else if(email.trim().isEmpty)
  {
    showMessage("Email is empty.");
    return false;
  }
  else if(password.trim().isEmpty || password.trim().length <6)
  {
    showMessage("Password should be greater than 6 characters.");
    return false;
  }
  else{
    return true;
  }
}

bool signUpVaildation(
    String email, String password, String name, String phone) {
  if (email.isEmpty && password.isEmpty && name.isEmpty && phone.isEmpty) {
    showMessage("All Fields are empty");
    return false;
  } else if (name.isEmpty) {
    showMessage("Name is Empty");
    return false;
  } else if (email.isEmpty) {
    showMessage("Email is Empty");
    return false;
  } else if (phone.isEmpty) {
    showMessage("Phone is Empty");
    return false;
  } else if(password.trim().isEmpty || password.trim().length <6)
  {
    showMessage("Password should be greater than 6 characters.");
    return false;
  } else {
    return true;
  }
}