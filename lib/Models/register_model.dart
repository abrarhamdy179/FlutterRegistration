class RegistrationModel
{
  String token;

  RegistrationModel({required this.token,});

  factory RegistrationModel.ConvermFronJson (Map<String,dynamic>JsonData)
  {
    return RegistrationModel(token:JsonData['token'] );
  }
}
