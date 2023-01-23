import 'dart:convert';

import 'package:book_recycler/model/login_signup_model.dart';
import 'package:book_recycler/model/login_signup_response.dart';
import 'package:book_recycler/model/most_popular.dart';
import 'package:http/http.dart';

class ApiHelper{

  final String urlMostPopular = "https://book-recycler-1864f-default-rtdb.firebaseio.com/books.json?auth=AIzaSyDlpdLJbXIrkpZIYpowapPMjHLLFkwcjFI";
  final String urlLogin = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDlpdLJbXIrkpZIYpowapPMjHLLFkwcjFI";
  final String urlSignup = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDlpdLJbXIrkpZIYpowapPMjHLLFkwcjFI";



  /// normal post login request
  Future<LoginSignUpResponse> postLogin(LoginSignUpModel query) async {
    final response = await post(
      Uri.parse(urlLogin),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

      body: json.encode(
        {
          'email': query.email,
          'password': query.password,
          'returnSecureToken': true,
        },
      ),
    );
    print(response);
    print(response.statusCode);

    if (response.statusCode == 201 || response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print('response in 200 : $response');
      return LoginSignUpResponse.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create data.');
    }
  }
  /// normal post  signup request
  Future<LoginSignUpResponse> postSignup(LoginSignUpModel query) async {
    final response = await post(
      Uri.parse(urlSignup),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

      body: json.encode(
        {
          'email': query.email,
          'password': query.password,
          'returnSecureToken': true,
        },
      ),
    );
    print('response: $response');
    print(response.statusCode);
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return LoginSignUpResponse.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create data.');
    }
  }

  Future<List<MostPopularData>> getMostPopular() async {
    // use async to define asyn functions in dart
    Response response = await get(Uri.parse(
        urlMostPopular)); // get request , await waits  till the response is available
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      // 200 -valid response
      // convert response body into dart based List
      List<dynamic> body = jsonDecode(response.body);
      print(
          body); // using dart api to convert json based collection to List in dart
      List<MostPopularData> clients =
      body.map((dynamic data) => MostPopularData.fromJson(data)).toList();
      print(
          clients); // using factory methods to generate Dart objects from json object
      /*if (isFav) {
        clients = clients.where((i) => i.isFavorite).toList();
      }*/

      return clients;
    } else {
      // error processing request
      throw "unable to fetch details";
    }
  }


  /// bloc pattern login api call
  Future<LoginSignUpResponse> postLoginApi(LoginSignUpModel query) async{

    Response response =  await post(
      Uri.parse(urlLogin),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

      body: json.encode(
        {
          'email': query.email,
          'password': query.password,
          'returnSecureToken': true,
        },
      ),
    );
    /// print response body
    //print(response.body);

    if(response.statusCode == 200 || response.statusCode== 201){
      return LoginSignUpResponse.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to fetch movie details') ;
    }

  }

  /// bloc pattern signup api call
  Future<LoginSignUpResponse> postSignupApi(LoginSignUpModel query) async{

    Response response =  await post(
      Uri.parse(urlSignup),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

      body: json.encode(
        {
          'email': query.email,
          'password': query.password,
          'returnSecureToken': true,
        },
      ),
    );
    /// print response body
    //print(response.body);

    if(response.statusCode == 200 || response.statusCode== 201){
      return LoginSignUpResponse.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to fetch movie details') ;
    }

  }

}