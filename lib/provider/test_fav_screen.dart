import 'package:flutter/material.dart';

class FavScreenProvider with ChangeNotifier{
  List<int> _likes =[];

  List<int> get likedItems => _likes;

  void addLikes(int indx){
    if(likedItems.contains(indx)){
      likedItems.remove(indx);
    }else{
      likedItems.add(indx);
    }
    print(likedItems);
    notifyListeners();
  }
}