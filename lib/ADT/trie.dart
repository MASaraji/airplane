class Trie<E> {
  Node ancestor = Node(data: null);

  E? find(String data) {
    Node temp = ancestor;
    List chars = data.split("");

    for (String char in chars) {
      Node? child = temp.findChild(char);

      if (child == null) {
        return null;
      }
      temp = child;
    }
    return temp.value;
  }

  void add(String data, E value) {
    Node temp = ancestor;
    List chars = data.split("");
    for (String char in chars) {
      Node? child = temp.findChild(char);
      temp = child ?? temp.addChild(char);
    }
    temp.value = value;
  }
}

class Node<E> {
  E? value;
  String? data;
  List<Node> children = [];
  Node({required this.data, this.value});

  Node addChild(String data) {
    Node node = Node(data: data);
    children.add(node);
    return node;
  }

  Node? findChild(String data) {
    for (var child in children) {
      if (child.data == data) {
        return child;
      }
    }
    return null;
  }
}
