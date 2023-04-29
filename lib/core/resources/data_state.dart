abstract class DataState<T> {
  final T? data;
  final String? error;

  DataState(this.data, this.error);
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T? data) : super(data, null);
}

class DataFiald<T> extends DataState<T> {
  DataFiald(String? error) : super(null, error);
}
