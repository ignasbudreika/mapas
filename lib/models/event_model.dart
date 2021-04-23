class EventModel {
  String id;
  String title;
  String start;
  String location;
  String description;

  EventModel(
      {this.id, this.title, this.start, this.location, this.description});

  @override
  String toString() {
    return this.id.toString() +
        this.title.toString() +
        this.start.toString() +
        this.location.toString() +
        this.description.toString();
  }
}
