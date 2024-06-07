import 'package:flutter/material.dart';

class NewContactPage extends StatefulWidget {
  const NewContactPage({super.key});
  static const routeName = '/new_contact';
  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final websiteController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[500],
        title: const Text('New Contact Page', style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: (){
            _saveContact();
          }, icon: const Icon(Icons.save, color: Colors.white)),
        ],
      ),
      body:  Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(10.0),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Please enter contact name';
                      }
                      return null;
                  },
                  decoration: const InputDecoration(
                      labelText: 'Contact Name',
                      border: OutlineInputBorder(),
                    filled: true,
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {

                      return null;
                  },
                  decoration: const InputDecoration(
                      labelText: 'Contact Email',
                      border: OutlineInputBorder(),
                    filled: true,
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: addressController,
                  validator: (value) {

                      return null;
                  },
                  decoration: const InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(),
                    filled: true,
                    prefixIcon: Icon(Icons.location_on),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: websiteController,
                  validator: (value) {

                      return null;
                  },
                  decoration: const InputDecoration(
                      labelText: 'Website',
                      border: OutlineInputBorder(),
                    filled: true,
                    prefixIcon: Icon(Icons.web),
                  ),
                ),
              ),

            ],
        )
        ,),
    );
  }

  void _saveContact() {
   if(formKey.currentState!.validate()){
     // Navigator.pop(context, {
     //   'name': nameController.text,
     //   'number': numberController.text
     // });
   }
  }
}
