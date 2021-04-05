import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_tracker/models/Device.dart';
import 'package:pet_tracker/screens/device/add_device.dart';
import 'package:pet_tracker/state/device/DeviceProvider.dart';
import 'package:provider/provider.dart';

class DeviceList extends StatefulWidget {
  @override
  _DeviceListState createState() => _DeviceListState();
}

class _DeviceListState extends State<DeviceList> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool _show = true;
  GlobalKey<FormState> _formKey = GlobalKey();
  bool visibility = true;
  bool isSubmit = false;
  int selectedIndex = 0;
  PersistentBottomSheetController sheetController;

  List<String> models = ['3G', '4G', 'NBIOT'];
  String imei,model;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Device List"),
        backgroundColor: Color(0xff703BB1), // status bar color
        brightness: Brightness.light, 
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<DeviceProviders>(
            builder: (context, DeviceProviders data, child) {
              return data.getNotes.length != 0
                  ? ListView.builder(
                      itemCount: data.getNotes.length,
                      itemBuilder: (context, index) {
                        return CardList(data.getNotes[index], index);
                      })
                  : Center(
                      child: Text("Add Device"),
                    );
            },
          )),
      floatingActionButton: _show
          ? FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Color(0xff703BB1),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => AddDevice()),
                // );

                sheetController = scaffoldKey.currentState
                    .showBottomSheet((context) => bottomSheet());
                _showButton(false);

                sheetController.closed.then((value) {
                  _showButton(true);
                });
              },
            )
          : Container(),
    );
  }

  void _showButton(bool value) {
    setState(() {
      selectedIndex=0;
      _show = value;
    });
  }

  Container bottomSheet() {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "Add device",
                  style: GoogleFonts.mukta(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                onSaved: (value) => imei = value,
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
                decoration: InputDecoration(
                  filled: true,
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                  labelText: "Imei Number",
                  labelStyle: GoogleFonts.mukta(
                      color: Color(0xff703BB1).withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff703BB1))),
                  focusedBorder: new OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff703BB1)),
                  ),
                  focusedErrorBorder: new OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                  ),
                  errorBorder: new OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Select Model",style: GoogleFonts.mukta(
                      fontSize: 20, fontWeight: FontWeight.bold),),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  customeRadio(models[0], 0),
                  SizedBox(
                    width: 10,
                  ),
                  customeRadio(models[1], 1),
                  SizedBox(
                    width: 10,
                  ),
                  customeRadio(models[2], 2)
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: isSubmit
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Color(0xff703BB1)),
                      )
                    : TextButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                             _formKey.currentState.save();
                             Device device = new Device(imei,models[selectedIndex]);
                             
                             
                             print(device.imeiNumber+" "+device.modelType);
                             Provider.of<DeviceProviders>(context,listen: false).addDevice(device);
                             if (scaffoldKey.currentState.isDrawerOpen) {
                                Navigator.of(context).pop();
                                return false;
                              }
                             
                          }
                        },
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff703BB1),
                                    Color(0xff703BB1)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "Add",
                                style: GoogleFonts.mukta(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21),
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeIndex(int index) {
    sheetController.setState(() {
      print(index);
      selectedIndex = index;
    });
  }

  Widget customeRadio(String txt, int index) {
    return OutlinedButton(
      onPressed: () {
        changeIndex(index);
      },
      child: Text(
        txt,
        style: TextStyle(
            color: selectedIndex == index ? Color(0xff703BB1) : Colors.grey),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
            color: selectedIndex == index ? Color(0xff703BB1) : Colors.grey,
            width: 1),
      ),
    );
  }
}

class CardList extends StatelessWidget {
  final Device device;
  int index;
  CardList(this.device, this.index);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
              )),
          child: ListTile(
            onTap: () {
              print(device.imeiNumber);
            },
            leading: Icon(Icons.developer_board),
            title: new Text("IMEI: "+device.imeiNumber),
            subtitle: Text("MODEL: "+device.modelType,
                style: TextStyle(color: Colors.black, fontSize: 17)),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black26,
            ),
          ),
        ),
        secondaryActions: <Widget>[
          IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () {
                print("HELLO DELETED");
                Provider.of<DeviceProviders>(context, listen: false)
                    .removeNotes(index);
              }),
        ],
      ),
    );
  }
}
