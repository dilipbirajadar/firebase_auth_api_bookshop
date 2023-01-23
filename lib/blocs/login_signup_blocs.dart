import 'package:book_recycler/model/login_signup_model.dart';
import 'package:rxdart/rxdart.dart';

import '../model/login_signup_response.dart';
import '../resources/repository.dart';

class _LoginSignupBloc{
  //Access to Repository
  final repository = Repository();
  //Asynchrounous Data Stream --> Observables or Subject
  //Data provider -Stream
  //Data Consumer -Sink
  //PublishSubject -Act as a Stream and Sink
  final _loginFetcher = PublishSubject <LoginSignUpResponse> ();

  get loginData => _loginFetcher.stream;//provide data to UI

  doLogin(LoginSignUpModel loginSignUpModel) async {
    LoginSignUpResponse loginResponse = await repository.loginAPI(loginSignUpModel);

    print("email ${loginResponse.email}");
    print("id Token ${loginResponse.idToken}");

    _loginFetcher.sink.add(loginResponse);//Add data to the PublishSubject object _movieFetcher
  }

  doSignup(LoginSignUpModel loginSignUpModel) async {
    LoginSignUpResponse loginResponse = await repository.signupAPI(loginSignUpModel);

    print("email ${loginResponse.email}");
    print("id Token ${loginResponse.idToken}");

    _loginFetcher.sink.add(loginResponse);//Add data to the PublishSubject object _movieFetcher
  }

}

final loginBlock = _LoginSignupBloc();//Singleton Object