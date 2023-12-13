List<T> getValues<T>(dynamic object) {
  if (object != null) {
    List<T> list = [];
    try {
      list = (object as List<dynamic>).cast<T>();
      return list;
    } on Exception {
      return List.empty();
    }
  }
  return List.empty();
}
