class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User({
    this.id,
    this.name,
    this.imageUrl,
    this.isOnline,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Group 1',
  imageUrl: 'assets/images/nick-fury.jpg',
  isOnline: true,
);

// USERS
final User ironMan = User(
  id: 1,
  name: 'Group 2',
  imageUrl: 'assets/images/ironman.jpeg',
  isOnline: true,
);
final User captainAmerica = User(
  id: 2,
  name: 'Group 3',
  imageUrl: 'assets/images/captain-america.jpg',
  isOnline: true,
);
final User hulk = User(
  id: 3,
  name: 'Group 4',
  imageUrl: 'assets/images/hulk.jpg',
  isOnline: false,
);
final User scarletWitch = User(
  id: 4,
  name: 'Group 5',
  imageUrl: 'assets/images/scarlet-witch.jpg',
  isOnline: false,
);
final User spiderMan = User(
  id: 5,
  name: 'Group 6',
  imageUrl: 'assets/images/spiderman.jpg',
  isOnline: true,
);
final User blackWindow = User(
  id: 6,
  name: 'Group 7',
  imageUrl: 'assets/images/black-widow.jpg',
  isOnline: false,
);
final User thor = User(
  id: 7,
  name: 'Group 8',
  imageUrl: 'assets/images/thor.png',
  isOnline: false,
);
final User captainMarvel = User(
  id: 8,
  name: 'Group 9',
  imageUrl: 'assets/images/captain-marvel.jpg',
  isOnline: false,
);
