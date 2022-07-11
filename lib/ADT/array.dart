class Array<E> {
  int size;
  final E? defVar; // default value to fill array
  late List<E?> array = List.filled(size.toUnsigned(64), defVar);

  Array(this.size, {this.defVar});

  List<E?> toList() => array;

  void add(int index, E data) => (-1 < index && index < size)
      ? array[index] = data
      : throw ("Index error");

  void represent() => print(array);

  E? getIndex(int index) =>
      (-1 < index && index < size) ? array[index] : throw ("Index error");

  void delete(int index) => (-1 < index && index < size)
      ? array[index] = null
      : throw ("Index error");

  Iterable<E> traverse() sync* {
    for (int i = 0; i < size; i++) {
      yield getIndex(i) as E;
    }
  }

  void expand(Array<E> arr) {
    Array<E?> tempArray = Array(size + arr.size);

    for (int i = 0; i < array.length; i++) {
      tempArray.add(i, array[i]);
    }
    for (int i = 0; i < arr.size; i++) {
      tempArray.add(array.length + i, arr.getIndex(i));
    }
    size = arr.size + size;
    array = tempArray.toList();
  }
}
