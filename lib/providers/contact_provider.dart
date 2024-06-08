
import 'package:flutter/cupertino.dart';

import '../db/db_helper.dart';
import '../models/contact_model.dart';

class ContactProvider extends ChangeNotifier{
    List<ContactModel> contacts = [];
    final db = DbHelper();

    Future<void>addContact(ContactModel contact) async{
     db.insertContact(contact);
     await getAllContact();
     notifyListeners();
    }

    Future<void>getAllContact() async{
      contacts = await db.getAllContacts();
      notifyListeners();
    }
    Future<void>getAllFavoriteContact() async{
      contacts = await db.getAllFavoriteContacts();
      notifyListeners();
    }
    Future<int>updateContact(rowId, columnName, value) async{
      final id = db.updateSingleColumn(rowId, {columnName: value});
      await getAllContact();
      return id;
    }
    Future<int>deleteContact(rowId)async{
      final id = db.deleteContact(rowId);
      contacts.removeWhere((element) => element.id == rowId);
      return id;
    }
}