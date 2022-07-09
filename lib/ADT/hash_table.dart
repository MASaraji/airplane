import 'package:airplane/ADT/stack.dart';
import "array.dart";
import "linkedlist.dart";

class HashTable<KeyType, ValueType> {
  late var hashFunction;
  late int threshold;
  late int arrayLength;
  int numberOfHashObject = 0;
  late Array<LinkedList> arr = Array(arrayLength);
  HashTable({this.threshold = 5, hashFunction, this.arrayLength = 7}) {
    this.hashFunction = hashFunction ?? defaultHashFunction;
    fillArray();
  }

  void fillArray() {
    for (int i = 0; i < arrayLength; i++) {
      arr.add(i, LinkedList());
    }
  }

  Stack getBucketCells() {
    Stack<BucketCell> stack = Stack();
    for (LinkedList cell in arr.traverse()) {
      for (BucketCell bucket in cell.traverse()) {
        stack.push(bucket);
      }
    }
    return stack;
  }

  void rehash() {
    Stack buckets = getBucketCells();
    arrayLength *= 2;
    arr = Array(arrayLength);
    fillArray();
    BucketCell? temp = buckets.pop();
    while (temp != null) {
      int index = temp.hashCode % arrayLength;
      addBucketCell(temp, index);
      temp = buckets.pop();
    }
  }

  int defaultHashFunction(KeyType key, int mod) => key.hashCode % mod;
  // {
  //var ascii = AsciiCodec();
  //List<int> arrOfAscii = ascii.encode(key);
  //int index = arrOfAscii.reduce((value, element) => value + element);
  //return index % mod;
//  }
  BucketCell? findBucketCell(KeyType key) {
    int index = hashFunction(key, arrayLength);
    LinkedList cell = arr.getIndex(index) as LinkedList;
    return cell.find((e) => e.hashCode == key.hashCode);
  }

  void addBucketCell(BucketCell bucketCell, int index) {
    LinkedList cell = arr.getIndex(index) as LinkedList;
    cell.add(bucketCell);
    if (cell.size > threshold) {
      rehash();
    }
  }

  void add(KeyType key, ValueType value) {
    HashObject hashObject = HashObject(key: key, value: value);
    int index = hashFunction(key, arrayLength);
    BucketCell? bucketCell = findBucketCell(key);
    if (bucketCell == null) {
      bucketCell = BucketCell(hashCode: key.hashCode);
      addBucketCell(bucketCell, index);
    }
    bucketCell.add(hashObject);
    numberOfHashObject++;
  }

  void addUnique(KeyType key, ValueType value) {
    BucketCell? bucketCell = findBucketCell(key);
    int index = hashFunction(key, arrayLength);
    if (bucketCell == null) {
      bucketCell = BucketCell(hashCode: key.hashCode);
      addBucketCell(bucketCell, index);
    }
    HashObject? hashObject = bucketCell.get(key);
    if (hashObject == null) {
      hashObject = HashObject(key: key, value: value);
      bucketCell.add(hashObject);
      numberOfHashObject++;
    } else {
      hashObject.value = value;
    }
  }

  ValueType? get(KeyType key) {
    BucketCell? bucketCell = findBucketCell(key);
    if (bucketCell == null) {
      return null;
    }
    HashObject? value = bucketCell.get(key);
    return value?.value;
  }

  Array<ValueType> getValues() {
    Array<ValueType> array = Array(numberOfHashObject);
    int index = 0;
    Stack stack = getBucketCells();
    BucketCell? temp = stack.pop();
    while (temp != null) {
      for (var value in temp.getValues()) {
        array.add(index, value);
        index++;
      }
      temp = stack.pop();
    }
    return array;
  }

  bool containsKey(KeyType key) {
    var value = get(key);
    return value != null;
  }

  int length() => numberOfHashObject;
}

class HashObject<KeyType, ValueType> {
  final KeyType key;
  ValueType value;
  HashObject({required this.key, required this.value});
}

class BucketCell {
  final int hashCode;
  LinkedList<HashObject> linkedList = LinkedList();

  BucketCell({required this.hashCode});

  void add(HashObject hashObject) => linkedList.add(hashObject);

  get(var key) => linkedList.find((e) => e.key == key);

  Iterable getValues() sync* {
    for (HashObject hashObject in linkedList.traverse()) {
      yield hashObject.value;
    }
  }
}
