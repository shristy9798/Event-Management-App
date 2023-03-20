class All_Events_List
{
  String? id;
  String? image;
  String? title;
  String? venue;
  String? time;
  String? date;
  String? duration;
  String? organizedBy;
  String? category;
  String? description;
  String? eventType;

  All_Events_List.fromMap(Map<String, dynamic> data){
    id = data['id'];
    title = data['Event name'];
    image = data['Poster'];
    venue = data['Venue Address'];
    time = data['Time'];
    date = data['Date'];
    duration = data['Event Duration'];
    organizedBy = data['Organized by'];
    category = data['Event Category'];
    description = data['Description'];
    eventType = data['Event Type'];
  }


}