abstract class IErrorSearch implements Exception {}

class ErrorSearch implements IErrorSearch {}

class ErrorSearchRepository implements IErrorSearch {
  final String message;

  ErrorSearchRepository(this.message);
}
