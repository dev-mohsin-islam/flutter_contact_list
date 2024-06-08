import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_contact_list/pages/new_contact_page.dart';
import 'package:text_contact_list/providers/contact_provider.dart';

 class HomePage extends StatefulWidget {
   const HomePage({super.key});
   static const routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   bool isFirst = true;
   int currentIndex = 0;

   @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
     if(isFirst){
       context.read<ContactProvider>().getAllFavoriteContact();
       isFirst = false;
     }

    super.didChangeDependencies();
  }

   @override
   Widget build(BuildContext context) {

     return Scaffold(
       appBar: AppBar(
         title: const Text('Home Page', style: TextStyle(color: Colors.white),),
         backgroundColor: Colors.indigo,
       ),
       body:  Consumer(builder: (context, ContactProvider provider, child) {
         return ListView.builder(
           itemCount: provider.contacts.length,
           itemBuilder: (context, index) {
             return Dismissible(
               key: ValueKey(provider.contacts[index].id),
               direction: DismissDirection.endToStart,
               background: Container(color: Colors.red, alignment: Alignment.centerRight,child: Icon(Icons.delete, color: Colors.white),),
               confirmDismiss: (direction) async {
                 return await showDialog(context: context, builder: (context) => AlertDialog(
                   title: const Text('Are you sure?'),
                   content: const Text('Do you want to delete this contact?'),
                   actions: [
                     TextButton(onPressed: (){
                       Navigator.of(context).pop(false);
                     }, child: const Text('No')),
                     TextButton(onPressed: (){
                       Navigator.of(context).pop(true);
                     }, child: const Text('Yes')),
                   ],
                 ));
               },
               onDismissed: (_) {
                 provider.deleteContact(provider.contacts[index].id!);
               },
               child: ListTile(

                 title: Text(provider.contacts[index].name),
                 subtitle: Text(provider.contacts[index].number),
                 trailing: IconButton(onPressed: (){
                   final value = provider.contacts[index].isFavorite ? 0 : 1;
                   provider.updateContact(provider.contacts[index].id!, 'is_favorite', value);
                 }, icon: Icon(provider.contacts[index].isFavorite ? Icons.favorite : Icons.favorite_border)),

               ),
             );
           },
         );
       }),
       floatingActionButton: FloatingActionButton(
         backgroundColor: Colors.indigo,
           shape: const CircleBorder(),
           child: const Icon(Icons.add_circle, color: Colors.white),
           onPressed: (){
         Navigator.pushNamed(context, NewContactPage.routeName);

       }),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       bottomNavigationBar: BottomAppBar(

         padding: EdgeInsets.zero,
         shape: const CircularNotchedRectangle(),
         notchMargin: 20.0,
         clipBehavior: Clip.antiAlias,
         color: Colors.indigo,
         child: BottomNavigationBar(
           currentIndex: currentIndex,
           onTap: (index){
               setState(() {
                 currentIndex = index;
               });
               _loadData();
           },
           backgroundColor: Colors.indigo[200],
             items: const[
           BottomNavigationBarItem(icon: Icon(Icons.list), label: 'All'),
           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
         ]),
       ),
     );
   }

  void _loadData() {
     if(currentIndex == 0){
       context.read<ContactProvider>().getAllContact();
     }else{
       context.read<ContactProvider>().getAllFavoriteContact();
     }
  }
}
