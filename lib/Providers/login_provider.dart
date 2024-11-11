import 'package:abrar_registration/Services/login_service.dart';
import 'package:flutter/material.dart';
import '../Models/register_model.dart';
import '../Services/signup_service.dart';

class LoginProvider extends ChangeNotifier
{
  RegistrationModel? registrationModel;

  Future<bool> login (email, password) async
  {
    try
    {
      await LoginService.addData(email, password);
      notifyListeners();
      return true ;
    }
    catch(e)
    {
      print(e);
    }
    return false;
  }
}