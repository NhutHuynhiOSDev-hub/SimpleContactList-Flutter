
class Record {

  String url;
  String name;
  String photo;
  String address;
  String contact;

  Record({
    required this.url,
    required this.name,
    required this.photo,
    required this.contact,
    required this.address
  });

  factory Record.fromJson(Map<String, dynamic> json){
    return new Record(
        url: json['url'],
        name: json['name'],
        photo: json['photo'],
        address: json['address'],
        contact: json ['contact']
    );
  }
}