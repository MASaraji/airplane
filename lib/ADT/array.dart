
class Array<E>{
  final int size;
  late final List<E?> array=List.filled(size.toUnsigned(64),null);

  Array(this.size);

  List<E?> toList()=> array;
  

  
  void add(int index,E data)=> (-1<index && index<size) ? array[index]=data : throw("Index error");
  
  void represent()=>print(array);

  E? getIndex(int index)=> (-1<index && index<size) ? array[index] : throw("Index error");

  void delete(int index)=> (-1<index && index<size) ? array[index]=null : throw("Index error");
}

