import 'dart:convert';

import 'package:book_recycler/model/login_signup_model.dart';
import 'package:book_recycler/model/login_signup_response.dart';
import 'package:book_recycler/model/most_popular.dart';
import 'package:http/http.dart';
import '../model/books.dart';
import '../model/globals.dart' as globals;

class ApiHelper{

  final String urlMostPopular = "https://book-recycler-1864f-default-rtdb.firebaseio.com/books.json?auth=AIzaSyDlpdLJbXIrkpZIYpowapPMjHLLFkwcjFI";
  final String urlLogin = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDlpdLJbXIrkpZIYpowapPMjHLLFkwcjFI";
  final String urlSignup = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDlpdLJbXIrkpZIYpowapPMjHLLFkwcjFI";
  final String urlGetBooks = "https://book-recycler-1864f-default-rtdb.firebaseio.com/books.json?auth=";



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

  /// bloc pattern signup api call
  Future<BooksModelResponseData> getBooks() async{
    String idToken = globals.authIdTokenFB;
    print('Token in bloc ${idToken}');
    //String idToken = "eyJhbGciOiJSUzI1NiIsImtpZCI6ImQwNTU5YzU5MDgzZDc3YWI2NDUxOThiNTIxZmM4ZmVmZmVlZmJkNjIiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vYm9vay1yZWN5Y2xlci0xODY0ZiIsImF1ZCI6ImJvb2stcmVjeWNsZXItMTg2NGYiLCJhdXRoX3RpbWUiOjE2NzQ0OTE4ODgsInVzZXJfaWQiOiJSSW5UenZ0bTY0YXRxVTBkb09XRk5Xb1A1NTcyIiwic3ViIjoiUkluVHp2dG02NGF0cVUwZG9PV0ZOV29QNTU3MiIsImlhdCI6MTY3NDQ5MTg4OCwiZXhwIjoxNjc0NDk1NDg4LCJlbWFpbCI6ImRwMUBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZW1haWwiOlsiZHAxQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.R6tjOYmmnNSOMFktMjg3naGjSywaBL7OwrzvZnZpQys73dfmR7Hc3Nz8WyA2APWD7Fk2bxOzDnhROmWMmG6k-qPOhSggZPAOwRcUSdl5q3p9fw408Zyf3aqg7vFo9XrwIkmje6kQLpmScRsABSlt1ee089En06nPTZpA35DhPgC_9aliZ99t7xJWPusLvJbHDs3103UJp0Lg8MBUW-pqijdzrIIHEDiq308G3BsweJnxHGJch05bVgx_hQ5JdKOsCbzsZUTGubXK1Vt2wZ2O1aHJ4CyjmYI0XVHfjSjt23K_7l41wwoSTp7nkqBOf6WR8_aKHFlzu1-Zg0YeRq-3qg";
    Response response =  await get(Uri.parse(urlGetBooks+idToken));
    // 200 -valid response
    // convert response body into dart based List
    List<dynamic> body = jsonDecode(response.body);

    print(body); // using dart api to convert json based collection to List in dart

    List<BooksModelResponseData> clients = body.map((dynamic data) => BooksModelResponseData.fromJson(data)).toList();
    print(clients);
    /// print response body
    //print(response.body);

    if(response.statusCode == 200 || response.statusCode== 201){
      return BooksModelResponseData.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to fetch books details') ;
    }

  }

}