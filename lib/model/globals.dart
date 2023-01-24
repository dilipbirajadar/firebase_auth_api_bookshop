library my_prj.globals;

import 'package:flutter/material.dart';

import 'books.dart';

final TextEditingController addressname = TextEditingController();
final TextEditingController phoneNumber = TextEditingController();
final TextEditingController email = TextEditingController();

final TextEditingController addresstitle = TextEditingController();
final TextEditingController address = TextEditingController();
final TextEditingController city = TextEditingController();
final TextEditingController state = TextEditingController();

final TextEditingController creditcardname = TextEditingController();
final TextEditingController creditcardnumber = TextEditingController();
final TextEditingController month = TextEditingController();
final TextEditingController year = TextEditingController();
final TextEditingController securitycode = TextEditingController();

final List<int> entries = <int>[230, 250, 300, 420];

double totalPriceSum = 0;

String authIdTokenFB = '';

List<BooksModelResponseData> globalBooksList = <BooksModelResponseData>[]  ;

