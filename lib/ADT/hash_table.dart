import 'dart:convert';

import "array.dart";
import "linkedlist.dart";

class HashTable{

  late var hashFunction;
  late int threshold;
  late int arrayLength;
  late Array<LinkedList> arr;
  HashTable({int threshold=1 ,var hashFunction,int arrayLength=1 }){
  this.arrayLength=arrayLength; 

  this.threshold=threshold ;
  this.hashFunction=hashFunction ?? DefaultHashFunction; 
  this.arr=Array(arrayLength);
   arr.add(0, LinkedList());
  }


  int DefaultHashFunction(String key,int mod){
  var ascii=AsciiCodec();
  List<int> arrOfAscii=ascii.encode(key);
  int index=arrOfAscii.reduce((value, element) => value+element);
  return index%mod;}


  void add(String key,var value){
  HashObject hashObject=HashObject(key:key,value:value);
  int index=hashFunction(key,arrayLength);

  LinkedList cell=arr.getIndex(index) as LinkedList;
  cell.add(hashObject);
  }
  get(String key){
    int index=hashFunction(key,arrayLength);
    LinkedList cell=arr.getIndex(index) as LinkedList;
    var value=cell.find((value)=>value.key==key);
    return value?.value ;
  }
}

class HashObject{
  String key;
  var value;
 HashObject({required this.key,this.value}); 

}

void main(){
  HashTable ht=HashTable();

  ht.add("hamed","hamed");
  print(ht.get("hamd"));
  }
