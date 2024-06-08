const String tblContact = 'tbl_contact';
const String colConId = 'id';
const String colConName = 'name';
const String colConNumber = 'number';
const String colConEmail = 'email';
const String colConAddress = 'address';
const String colConWebsite = 'website';
const String colConIsFavorite = 'is_favorite';

class ContactModel{
  int? id;
  String name;
  String number;
  String? email;
  String? address;
  String? website;
  bool isFavorite;
  ContactModel({required this.name,required this.number,this.email,   this.address,   this.website, this.isFavorite = false, this.id});

  factory ContactModel.fromMap(Map<String, dynamic> map){
    return ContactModel(
      id: map[colConId],
      name: map[colConName],
      number: map[colConNumber],
      email: map[colConEmail],
      address: map[colConAddress],
      website: map[colConWebsite],
      isFavorite: map[colConIsFavorite] == 1
    );
  }
  Map<String, dynamic> toMap(){
    final map = <String, dynamic>{
      colConName: name,
      colConNumber: number,
      colConEmail: email,
      colConAddress: address,
      colConWebsite: website,
      colConIsFavorite: isFavorite ? 1 : 0
    };
    if(id != null){
      map[colConId] = id;
    }
    return map;
  }

}