
import 'package:flutter/cupertino.dart';

import '../db/db_helper.dart';
import '../models/contact_model.dart';

class ContactProvider extends ChangeNotifier{
    List<ContactModel> contacts = [];
    final db = DbHelper();

    Future<void>addContact(ContactModel contact) async{
     db.insertContact(contact);
      notifyListeners();
    }
}