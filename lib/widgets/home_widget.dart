import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
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
                  itemCount: 80,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
                      leading: Image.asset(
                        "assets/images/add-user.png",
                        height: 45.0,
                      ),
                      title: const Text(
                        "Ayra Starr",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      subtitle: const Text(
                        "+234 702 688 1411",
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                      // trailing: DropdownButton(
                      //   items: const [
                      //     DropdownMenuItem(
                      //       child: Text("View Contacts"),
                      //     ),
                      //     DropdownMenuItem(
                      //       child: Text("Add favorite"),
                      //     ),
                      //   ],
                      //   onChanged: (value) {},
                      // ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
