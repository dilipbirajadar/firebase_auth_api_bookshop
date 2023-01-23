import 'package:book_recycler/model/login_signup_model.dart';
import 'package:book_recycler/services/api_helper.dart';

class Repository{

  loginAPI(LoginSignUpModel loginSignUpModel)=> ApiHelper().postLoginApi(loginSignUpModel);

  signupAPI(LoginSignUpModel loginSignUpModel)=> ApiHelper().postSignupApi(loginSignUpModel);

  getBookAPI() => ApiHelper().getBooks();
}