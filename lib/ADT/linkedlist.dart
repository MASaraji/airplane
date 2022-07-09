class LinkedList {
  Node? head;
  Node? tail;

  void add(var data) {
    Node node = Node(data: data);
    if (head == null) {
      head = node;
      tail = head;
    } else {
      tail?.next = node;
      tail = node;
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

class Node {
  var data;
  Node? next;

  Node({required this.data});
}
