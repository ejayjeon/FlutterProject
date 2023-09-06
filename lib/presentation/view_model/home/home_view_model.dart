import 'package:flutter/material.dart';
import 'package:whoever/domain/repository/book_repository.dart';
import 'package:whoever/presentation/view_model/home/home_event.dart';

class HomeViewModel with ChangeNotifier {
  final BookRepository bookRepository;

  HomeViewModel({
    required this.bookRepository,
  }) {
    // View Model을 초기화할 때 항상 _loadBooks()를 실행한다
    _loadBooks();
  }

  void onEvent(HomeEvent event) {
    event.when(
      loadBooks: _loadBooks,
    );
  }

  Future<void> _loadBooks() async {
    notifyListeners();
  }
}
