import 'package:flutter/cupertino.dart';
import 'package:pet_tracker/models/Device.dart';

class DeviceProviders extends ChangeNotifier{
  List<Device> _device = [];

  List<Device> get getNotes{
    return _device;
  }

  void addDevice(Device device){
    _device.add(device);
    notifyListeners();
  }

  void removeNotes(int index)
 {
   _device.removeAt(index);
   notifyListeners();
 }
}