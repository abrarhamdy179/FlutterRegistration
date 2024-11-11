import 'package:dio/dio.dart';
import '../Models/register_model.dart';

class LoginService
{
  static Dio dio = Dio();
  static addData (String email , String password) async
  {
    Response response = await dio.post("https://todo-app-backend-dusky.vercel.app/api/auth/login",
        data: {
          "email":email,
          "password" : password,
        }
    );
    if(response.statusCode! >= 200 && response.statusCode! < 300)
    {
      print(response.data);
      return RegistrationModel.ConvermFronJson (response.data);
    }
    else
    {
      throw Exception("Server Error ");
    }
  }
}