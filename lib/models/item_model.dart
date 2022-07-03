class Items {
  List<Item> itemslist = [];

  Items.fromJson(var json) {
    for (var item in json) {
      itemslist.add(Item(item['ID'], item['title'], item['description'],
          item['full_description'], item['link'], item['image']));
    }
  }
}

class Item {
  int id = 0;
  String title = '',
      description = '',
      fullDescription = '',
      link = '',
      image = '';

  Item(this.id, this.title, this.description, this.fullDescription, this.link,
      this.image);
}
