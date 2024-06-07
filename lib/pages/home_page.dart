import 'package:flutter/material.dart';
import 'package:text_contact_list/pages/new_contact_page.dart';

 class HomePage extends StatelessWidget {
   const HomePage({super.key});
   static const routeName = '/';

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: const Text('Home Page', style: TextStyle(color: Colors.white),),
         backgroundColor: Colors.indigo,
       ),
       body: const Center(
         child: Text('Home Page'),
       ),
       floatingActionButton: FloatingActionButton(onPressed: (){
         Navigator.pushNamed(context, NewContactPage.routeName);
       }),
     );
   }
 }
