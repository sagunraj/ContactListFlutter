import 'package:contacts_app/add_contact.dart';
import 'package:flutter/material.dart';
import 'models/contact.dart';

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  List<Contact> contacts = [
    Contact("Biraj Maharjan", "9812345678",
        "https://reqres.in/img/faces/1-image.jpg"),
    Contact(
        "Anjan Bista", "9810345678", "https://reqres.in/img/faces/2-image.jpg"),
    Contact("Kiran Kumar Limbu", "9812344678",
        "https://reqres.in/img/faces/3-image.jpg"),
    Contact("Bishal Shrestha", "9802345678",
        "https://reqres.in/img/faces/4-image.jpg"),
    Contact("Bishwas Shrestha", "9822345678",
        "https://reqres.in/img/faces/5-image.jpg"),
    Contact(
        "Soujan Rai", "9832345678", "https://reqres.in/img/faces/6-image.jpg"),
    Contact(
        "Sagar Thapa", "9842345678", "https://reqres.in/img/faces/7-image.jpg"),
    Contact("Bikesh Kuthu", "9852345678",
        "https://reqres.in/img/faces/8-image.jpg"),
    Contact("Raju Kaji Shakya", "9862345678",
        "https://reqres.in/img/faces/9-image.jpg"),
    Contact("Upendra Man Singh", "9872345678",
        "https://reqres.in/img/faces/10-image.jpg"),
    Contact("Ranjit Dhimal", "9882345678",
        "https://reqres.in/img/faces/11-image.jpg"),
    Contact(
        "Rohit Chand", "9892345678", "https://reqres.in/img/faces/12-image.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => _navigateToAddContactScreen(context),
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _navigateToAddContactScreen(context))
          ],
          title: Text("Contacts"),
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
                children: List.generate(contacts.length,
                    (index) => _generateContact(contacts[index]))),
          ),
        ));
  }

  void _navigateToAddContactScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (c) => AddContactScreen(
                  onAddPressed: (name, phone) {
                    Contact newContact = Contact(name, phone,
                        "https://reqres.in/img/faces/10-image.jpg");
                    setState(() {
                      contacts.add(newContact);
                    });
                    Navigator.pop(c);
                  },
                )));
  }

  Widget _generateContact(Contact contact) {
    return ListTile(
      leading: CircleAvatar(
        maxRadius: 20,
        backgroundImage: NetworkImage(contact.imageUrl),
      ),
      title: Text(contact.name),
      subtitle: Text(contact.phone),
    );
  }
}
