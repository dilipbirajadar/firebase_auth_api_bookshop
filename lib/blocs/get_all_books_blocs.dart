import 'package:rxdart/rxdart.dart';

import '../model/books.dart';
import '../resources/repository.dart';

class _GetAllBooks{
  //Access to Repository
  final repository = Repository();
  //Asynchrounous Data Stream --> Observables or Subject
  //Data provider -Stream
  //Data Consumer -Sink
  //PublishSubject -Act as a Stream and Sink
  final _getBooksFetcher = PublishSubject <List<BooksModelResponseData>> ();

  get getBooksData => _getBooksFetcher.stream;//provide data to UI

  getAllBooksList() async {
    List<BooksModelResponseData> booksModel = await repository.getBookAPI();

    print("books name ${booksModel[0].name}");
    print("book author ${booksModel[0].author}");

    _getBooksFetcher.sink.add(booksModel);//Add data to the PublishSubject object _movieFetcher
  }

}

final getAllBooks = _GetAllBooks();//Singleton Object