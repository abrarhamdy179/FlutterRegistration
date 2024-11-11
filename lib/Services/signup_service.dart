import 'package:dio/dio.dart';
import '../Models/register_model.dart';

class SignUpService
{
  static Dio dio = Dio();
  static addData (String name ,String email , String password) async
  {
    Response response = await dio.post("https://todo-app-backend-dusky.vercel.app/api/auth/register",
        data: {
          "username": name,
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