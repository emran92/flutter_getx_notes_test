class NotesModel{
  int id;
  String note;
  String title;


  NotesModel({this.id,this.title,this.note});


  NotesModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    note = json['note'];
    title = json['title'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['id'] = this.id;
    data['note'] = this.note;
    data['title'] = this.title;
    return data;
  }


}