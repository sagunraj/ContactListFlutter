import 'package:flutter/material.dart';

class AddContactScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final Function(String, String) onAddPressed;

  AddContactScreen({Key key, @required this.onAddPressed}) : super(key: key);

  void _onFormSubmit() {
    if (formKey.currentState.validate()) {
      onAddPressed(nameController.text, phoneController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add New Contact"),
          actions: [
            IconButton(icon: Icon(Icons.done), onPressed: _onFormSubmit)
          ],
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextFormField(
                    validator: (name) {
                      if (name.isEmpty)
                        return "The 'Name' field cannot be empty.";
                      return null;
                    },
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: "Name", border: OutlineInputBorder())),
                SizedBox(height: 15),
                TextFormField(
                    validator: (phone) {
                      if (phone.isEmpty)
                        return "The 'Phone' field cannot be empty.";
                      return null;
                    },
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: "Phone", border: OutlineInputBorder()),
                    maxLength: 10),
                SizedBox(height: 15),
                TextButton(onPressed: _onFormSubmit, child: Text("Submit"))
              ],
            ),
          ),
        ));
  }
}
