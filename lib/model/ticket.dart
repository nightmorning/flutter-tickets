class Ticket {
  int id;
  String name;
  String image;
  int play;
  int comment;

  Ticket(this.id, this.name, this.image, this.play, this.comment);

  Ticket.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        play = json['play'],
        comment = json['comment'];

  Map<String, dynamic> toJson() =>
    <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'play': play,
      'comment': comment,
    };
}