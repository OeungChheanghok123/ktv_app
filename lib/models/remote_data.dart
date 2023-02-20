class RemoteData<T> {
  late RemoteDataStatus status;
  String? message;
  T? data;

  RemoteData({
    required this.status,
    this.message,
    this.data,
  });
}

enum RemoteDataStatus { none, processing, success, error }
