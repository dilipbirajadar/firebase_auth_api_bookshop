class LoginSignUpModel{
  final String password;
  final String email;
  final String returnSecureToken ;

  /**
   * "kind": "identitytoolkit#VerifyPasswordResponse",
      "localId": "TtONaMYr3gdmfopsEQq8oblv1Y13",
      "email": "dilip.p@gmail.com.com",
      "displayName": "",
      "idToken": "eyJhbGciOiJSUzI1NiIsImtpZCI6ImQwNTU5YzU5MDgzZDc3YWI2NDUxOThiNTIxZmM4ZmVmZmVlZmJkNjIiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vYm9vay1yZWN5Y2xlci0xODY0ZiIsImF1ZCI6ImJvb2stcmVjeWNsZXItMTg2NGYiLCJhdXRoX3RpbWUiOjE2NzQyMTM1NjAsInVzZXJfaWQiOiJUdE9OYU1ZcjNnZG1mb3BzRVFxOG9ibHYxWTEzIiwic3ViIjoiVHRPTmFNWXIzZ2RtZm9wc0VRcThvYmx2MVkxMyIsImlhdCI6MTY3NDIxMzU2MCwiZXhwIjoxNjc0MjE3MTYwLCJlbWFpbCI6ImRpbGlwLnBAZ21haWwuY29tLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJkaWxpcC5wQGdtYWlsLmNvbS5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJwYXNzd29yZCJ9fQ.fF-XTrB-RJLyzAnXteHgo8a5OGoCmND3SzxfQcxJ5V7ir1ki4aA_y7kL0VXGRqrrw2495c1INr7a_rrd7WfEEJUXbep0Nwhe9rC0zHCkQo364CmoCBeQ2YeYCHnENsQHCNDyR70SUMIZUREjOcydAHCATmFAoex5rSSWqu24nPUje-jbcblcMn8YDvIa4bvMcjpX9jPGAjstEzc5okE4TLaxn-VHi9KWVTTcZPE_y_Cg77j_fx4ht-ofjkRc2aZVEa03K4YDXUriY05LG8riHpa5ipQ_rKSJjn-cOMXuvR78anJoaBA3gnH2z1XgXaErPttBh8a1fJxCZZk3bKZagQ",
      "registered": true,
      "refreshToken": "AOkPPWTk2uKS5qDaoQw4j5iWnALSepwOQvwc97WIMysVe71iXTIx1qdFwOmbbW6nIW7r0q5wkwEtKXL2iZSkXpLGN3mrtq6HK0fcAwh9SWg18R_zV20fq5yHZXuhtMV__BcuwHcowmk50izNer-qd25WqwokoHlDBuqfMnUvcr1g8ZV-qF_siySy3AVFZ0qiRs_JhIFpq__C5aD2_idLigCwKQfzGGGeCYMM3Ubtv4B5jFmCxNOU8Wo",
      "expiresIn": "3600"
      }
   */

  const LoginSignUpModel({required this.email,required this.password,required this.returnSecureToken});

  factory LoginSignUpModel.fromJson(Map<String, dynamic> json) {
    String kind;
    String localId;
    String email;
    String displayName;
    String idToken;
    String registered;
    String refreshToken;



    return LoginSignUpModel(
      email: json['email'],
      password: json['idToken'],
      returnSecureToken: json['localId']
    );
  }
}