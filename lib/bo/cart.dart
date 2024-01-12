import 'package:epsi_shop/bo/produit.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier{
  final _items = <Produit>[];
  List<Produit> get items => _items;

  void add(Produit produit){
    _items.add(produit);
    notifyListeners();
  }

  void remove(Produit produit){
    _items.remove(produit);
    notifyListeners();
  }

  String getSum(){
    num sum = 0;
    for (Produit item in _items){
        sum += item.prix;
    }
    String sumString = "${sum.toStringAsFixed(2)}€";
    return sumString;
  }

  String getTVA(){
    num sum = 0;
    for (Produit item in _items){
      sum += item.prix;
    }
    String tvaString = "${(sum*0.2).toStringAsFixed(2)}€";
    return tvaString;
  }

  String getTotal(){
    num sum = 0;
    for (Produit item in _items){
      sum += item.prix;
    }
    String tvaString = "${(sum*1.2).toStringAsFixed(2)}€";
    return tvaString;
  }

  void removeAll(){
    _items.clear();
    notifyListeners();
  }
}