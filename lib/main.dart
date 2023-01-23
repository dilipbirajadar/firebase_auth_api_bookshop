import 'package:book_recycler/provide/auth.dart';
import 'package:book_recycler/screens/checkout/payment_confirmation_screen.dart';
import 'package:book_recycler/screens/exchange_book_screen.dart';
import 'package:book_recycler/screens/profile_screen.dart';
import 'package:book_recycler/screens/sell_book_screen.dart';
import 'package:flutter/material.dart';


import 'screens/buy_books_screen.dart';
import 'screens/cart/shopping_cart.dart';
import 'screens/checkout/checkout_add_address.dart';
import 'screens/checkout/checkout_screen.dart';
import 'screens/checkout/checkout_with_address.dart';
import 'screens/home_screen.dart';
import 'screens/landing_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';

void main() {
  runApp( MaterialApp(
    home: const LandingScreen(), //ExploreScreen(),
    routes: {
      '/login': (context) => const LoginScreen(),
      '/signup': (context) => const SignupScreen(),
      '/home': (context) => const HomeScreen(),
      '/buy_books': (context) => const BuyBooksScreen(),
      '/sell_book': (context) => const SellBookScreen (),
      '/exchange': (context) => const ExchangeBookScreen(),
      '/profile': (context) => const ProfileScreen(),
      '/cart': (context) => const CartCardScreen(),
      '/checkout': (context) => const CheckoutScreen(),
      '/addaddress': (context) => const AddAddressScreen(),
      '/checkoutwithaddress': (context) => CheckoutWithAddress(),
      '/paymentconfirmation': (context) => PaymentConfirmationScreen(),
    },
  ));

}

/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Auth(),
          ),

        ],
        child: Consumer<Auth>(
          builder: (context, auth, _) => MaterialApp(
            title: 'Book Recycler',

            home: auth.isAuth ? BuyBooksScreen() : LoginScreen(),
            routes: {
              '/login': (context) =>  LoginScreen(),
              '/signup': (context) => const SignupScreen(),
              '/home': (context) => const HomeScreen(),
              '/buy_books': (context) => const BuyBooksScreen(),
              '/sell_book': (context) => const SellBookScreen (),
              '/exchange': (context) => const ExchangeBookScreen(),
              '/profile': (context) => const ProfileScreen()
            },
          ),
        ));
  }
}*/

