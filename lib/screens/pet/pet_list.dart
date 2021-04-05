import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_tracker/models/Pet.dart';
import 'package:pet_tracker/screens/pet/add_pet.dart';
import 'package:pet_tracker/state/pet/PetProvider.dart';
import 'package:provider/provider.dart';

class PetList extends StatefulWidget {
  @override
  _PetListState createState() => _PetListState();
}

class _PetListState extends State<PetList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pet List"),
        backgroundColor: Color(0xff703BB1), // status bar color
        brightness: Brightness.light, 
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<PetProvider>(
            builder: (context, PetProvider data, child) {
              return data.getNotes.length != 0
                  ? ListView.builder(
                      itemCount: data.getNotes.length,
                      itemBuilder: (context, index) {
                        return CardList(data.getNotes[index], index);
                      })
                  : Center(
                      child: Text("Add Pets"),
                    );
            },
          )),
      floatingActionButton:FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Color(0xff703BB1),
              onPressed: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPet()),
                );
              },
            )
    );
  }
  
}

class CardList extends StatelessWidget {
  final Pet pet;
  int index;
  CardList(this.pet, this.index);
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
              //print(device.imeiNumber);
            },
          
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name : "+ pet.name,style: GoogleFonts.mukta()),  
                  SizedBox(height: 10,)  ,
                  Text("Category : "+ pet.category,style: GoogleFonts.mukta()),  
                  SizedBox(height: 10,)  ,
                  Text("Breed Type : "+ pet.breedType,style: GoogleFonts.mukta()),  
                  SizedBox(height: 10,)  
                ],
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
                Provider.of<PetProvider>(context, listen: false)
                    .removeNotes(index);
              }),
        ],
      ),
    );
  }
}