class LinkedList<E> {
  Node? head;
  Node? tail;
  int size = 0;

  void add(E? data) {
    Node<E?> node = Node(data: data);
    if (head == null) {
      head = node;
      tail = head;
    } else {
      tail?.next = node;
      tail = node;
    }
    size++;
  }

  void addFirst(E? data) {
    Node<E?> node = Node(data: data);
    if (head == null) {
      head = node;
      tail = head;
    } else {
      node.next = head;
      head = node;
    }
    size++;
  }

  E? removeFirst() {
    if (head == null) {
      return null;
    } else if (head == tail) {
      E temp = head?.data;
      head = null;
      tail = null;
      size--;
      return temp;
    }
    E temp = head?.data;
    head = head?.next;
    size--;
    return temp;
  }

  Iterable<E> traverse() sync* {
    Node? temp = head;
    while (temp != null) {
      yield temp.data as E;
      temp = temp.next;
    }
  }

  void representAll() {
    Node? temp = head;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }

  find(Function func) {
    Node? temp = head;
    while (temp != null) {
      if (func(temp.data)) {
        return temp.data;
      }
      temp = temp.next;
    }
  }
}

class Node<E> {
  E? data;
  Node? next;

  Node({required this.data});
}
