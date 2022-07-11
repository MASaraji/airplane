import 'package:airplane/ADT/array.dart';
import 'package:airplane/ADT/linkedlist.dart';

class Stack<E> {
  int size = 0;
  LinkedList<E> linkedList = LinkedList();

  void push(E value) {
    linkedList.addFirst(value);
    size++;
  }

  E? pop() {
    if (size == 0) {
      return null;
    }

    E? temp = linkedList.removeFirst();
    size--;
    return temp;
  }

  Array toArray() => linkedList.toArray();

  void representAll() => linkedList.representAll();

  int length() => size;
}
