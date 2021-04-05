import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_tracker/models/Device.dart';
import 'package:pet_tracker/state/device/DeviceProvider.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class AddDevice extends StatefulWidget {
  @override
  _AddDeviceState createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {
  GlobalKey<FormState> _formKey = GlobalKey();
  FocusNode _trackerIdFocusNode = FocusNode();

  Device device = new Device("", "");
  List<String> models = ['3G', '4G', 'NBIOT'];
  String dropDownValue;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add device"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 100.0),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: _getFormContents(),
          ),
        ),
      ),
    );
  }

  Widget _getFormContents() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            focusNode: _trackerIdFocusNode,
            onSaved: (value) => device.imeiNumber = value,
            validator: (value) {
              if (value.length == 0) {
                return "Required field can not be empty";
              }
              if (num.tryParse(value) == null) {
                return "Should contain digits";
              }
              if (value.length != 15) {
                return "Imei number should be 15 digits";
              }
              return null;
            },
            style: Theme.of(context).textTheme.headline6,
            decoration: InputDecoration(
                labelStyle: Theme.of(context).textTheme.subtitle1,
                labelText: 'Tracker IMEI Number',
                
                enabledBorder: enableBorder,
                focusedBorder: focusedBorder,
               
                errorBorder: errorBorder,
                isDense: true,
                contentPadding: EdgeInsets.all(12)),
          ),
          SizedBox(
            height: 12,
          ),
          myDropDown(),
          SizedBox(
            height: 30,
          ),
          RaisedGradientButton(
            child: Text('Add Device',
                style: Theme.of(context).textTheme.headline6.apply(
                      color: Colors.white,
                    )),
            onPressed: () {
              submit();
            },
          )
        ],
      ),
    );
  }

   void submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      postData();
    }
  }

  void postData() async {
    device.modelType = dropDownValue;
   Provider.of<DeviceProviders>(context,listen: false).addDevice(device);
   Navigator.of(context).pop();
  }

  Widget myDropDown() {
    return Container(
      height: 45.0,
      decoration: BoxDecoration(
        // border: Border.all(width: 0.7, color: Colors.grey[700]),
        // color: Colors.grey[400],
        borderRadius: BorderRadius.all(Radius.zero),
      ),
      // padding: EdgeInsets.symmetric(vertical: 1, horizontal: 20),
      width: 400,
      child: DropdownButton<String>(
        isExpanded: true,
        value: dropDownValue,
        hint: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Select Model',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
            )),
        icon: Icon(
          Icons.arrow_downward,
          size: 30,
        ),
        iconSize: 10,
        elevation: 16,
        style: Theme.of(context).textTheme.headline6,
        underline: Container(
          height: 1,
          color: Colors.grey[500],
        ),
        onChanged: (String newValue) {
          setState(() {
            dropDownValue = newValue;
          });
        },
        items: models.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                value,
                textAlign: TextAlign.center,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}