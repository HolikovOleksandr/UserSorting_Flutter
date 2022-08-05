class User {
  final String name;
  final String userName;
  final String image;
  bool isFollowedByMe;

  User(
    this.name,
    this.userName,
    this.image,
    this.isFollowedByMe,
  );
}

final List<User> users = [
  User(
    'Vovnyanko Olga',
    '@poneslo_ostapa',
    'lib/assets/images/Vovnyanko.jpg',
    false,
  ),
  User(
    'Bolotsky Yaroslav',
    '@kichmen88',
    'lib/assets/images/Bolotsky.jpg',
    false,
  ),
  User(
    'Maskenko Ilya',
    '@IlonMask',
    'lib/assets/images/Maskenko.png',
    false,
  ),
  User(
    'Tompsonuk Hariton',
    '@HanterTompson',
    'lib/assets/images/Tompsonuk.png',
    false,
  ),
  User(
    'Hendrixenko Evgen',
    '@JimmyHendrix',
    'lib/assets/images/Hendrixenko.png',
    false,
  ),
  User(
    'Flintchenko Klim',
    '@KitFlint',
    'lib/assets/images/Flintchenko.png',
    false,
  ),
  User(
    'Marlenko Dmytro',
    '@DamianMarley',
    'lib/assets/images/Marlenko.png',
    false,
  ),
  User(
    'Belchyk Gennady',
    '@GendalfWhite',
    'lib/assets/images/Bilchyk.png',
    false,
  ),
];
