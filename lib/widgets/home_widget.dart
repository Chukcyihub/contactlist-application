import 'package:contactlist/providers/contact_provider.dart';
import 'package:contactlist/screens/contact_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  static const List<String> list = <String>['Remove', 'Add to Favorite'];
  String dropdownValue = list.first;

  @override
  void initState() {
    super.initState();
    getContact();
  }

  getContact() async =>
      await context.read<ContactProvider>().fetchContact(context);

  @override
  Widget build(BuildContext context) {
    var mylist = Provider.of<ContactProvider>(context).apiContact;
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            // This is housing the search input for contacts
            const Padding(
              padding: EdgeInsets.only(
                left: 25.0,
                right: 25.0,
              ),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search_rounded),
                  hintText: "search contacts",
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            // This will be housing a list of contacts
            Expanded(
              child: ListView.builder(
                  itemCount: mylist.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) {
                            return const ContactScreen();
                          }),
                        );
                      },
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          "assets/images/Starr.jpeg",
                          height: 50.0,
                        ),
                      ),
                      title: Text(
                        mylist[index].name,
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      subtitle: Text(
                        mylist[index].phoneNumber,
                      ),
                      trailing: DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          height: 2,
                          color: Colors.black,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
