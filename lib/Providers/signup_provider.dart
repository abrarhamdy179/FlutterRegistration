import 'package:flutter/material.dart';
import '../Models/register_model.dart';
import '../Services/signup_service.dart';

class SignUpProvider extends ChangeNotifier
{
  RegistrationModel? registrationModel;

  Future<bool> signup (name, email, password) async
  {
    try
    {
        await SignUpService.addData(name, email, password);
        notifyListeners();
        return true;
    }
    catch(e)
    {
      print(e);
    }
    return false;
  }
}