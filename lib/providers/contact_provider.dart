// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:contactlist/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContactProvider with ChangeNotifier {
// This variable will save contact from the internet

  List<ContactModel> apiContact = [];
  List<ContactModel> get apiContacts => apiContact;

  //store contacts to list of favorites

  List<ContactModel> favContact = [];
  List<ContactModel> get favContacts => favContact;

  /// method to fetch contact from the internet
  /// return null
  ///
  Future<void> fetchContact(BuildContext context) async {
    try {
      final resp = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/users"),
      );
      if (resp.statusCode == 200) {
        //decode the response data
        final jsondata = jsonDecode(resp.body);
        //loop through and store data in apiContact list

        for (var data in jsondata) {
          apiContact.add(
            ContactModel(
              id: data['id'],
              name: data['name'],
              email: data['email'],
              phoneNumber: data['phone'],
              website: data['website'],
              address: data['address']['city'] +
                  ", " +
                  data['address']['street'] +
                  ", " +
                  data['address']['suite'],
            ),
          );
        }
      } else {
        print("Could not fetch data from the internet");
      }
    } on SocketException {
      //return a snackbar with the message, no internet access
      const snack = SnackBar(
        content: Text("No Internet Access"),
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snack);
    }
    notifyListeners();
  }
}
