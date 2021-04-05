import 'package:flutter/material.dart';
import 'package:pet_tracker/models/Pet.dart';

class PetProvider extends ChangeNotifier{
  List<Pet> _device = [];

  List<Pet> get getNotes{
    return _device;
  }

  void addDevice(Pet device){
    _device.add(device);
    notifyListeners();
  }

  void removeNotes(int index)
 {
   _device.removeAt(index);
   notifyListeners();
 }
}