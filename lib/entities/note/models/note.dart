abstract class INote{
  String? id;
  String head;
  String body;
  DateTime? lastUpdate;
  bool fav;

  INote({
    this.id,
    required this.head,
    required this.body,
    this.fav = false,
    // required this.lastUpdate
    this.lastUpdate
  });

  INote.fromJson(Map<String, dynamic> json) :
        // id = json['id'],
        head = json['head'],
        body = json['body'],
        // lastUpdate = DateTime.parse(json['lastUpdate']),
        // fav = json['fav'];
        fav = false;

  void editNote();

}

class Note extends INote{

  Note({
    super.id,
    required super.head,
    required super.body,
    super.fav,
    super.lastUpdate
    // required super.lastUpdate
  }) : super();

  Note.fromJson(super.json) : super.fromJson();

  Map<String, dynamic> toJson() => {
    'id': id,
    'head': head,
    'body': body,
    // 'lastUpdate': lastUpdate.toIso8601String(),
    'lastUpdate': null,
    'fav': fav,
  };

  @override
  void editNote(){}

}
