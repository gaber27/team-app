class UsersModel {
  UsersModel({
    required this.users,
    required this.total,
    required this.skip,
    required this.limit,
  });
  late final List<Users> users;
  late final int total;
  late final int skip;
  late final int limit;

  UsersModel.fromJson(Map<String, dynamic> json){
    users = List.from(json['users']).map((e)=>Users.fromJson(e)).toList();
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['users'] = users.map((e)=>e.toJson()).toList();
    _data['total'] = total;
    _data['skip'] = skip;
    _data['limit'] = limit;
    return _data;
  }
}

class Users {
  Users({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hair,
    required this.domain,
    required this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
    required this.bank,
    required this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
    required this.crypto,
  });
  late final int id;
  late final dynamic firstName;
  late final dynamic lastName;
  late final dynamic maidenName;
  late final int age;
  late final dynamic gender;
  late final dynamic email;
  late final dynamic phone;
  late final dynamic username;
  late final dynamic password;
  late final dynamic birthDate;
  late final dynamic image;
  late final dynamic bloodGroup;
  late final int height;
  late final dynamic weight;
  late final dynamic eyeColor;
  late final Hair hair;
  late final dynamic domain;
  late final dynamic ip;
  late final Address address;
  late final dynamic macAddress;
  late final dynamic university;
  late final Bank bank;
  late final Company company;
  late final dynamic ein;
  late final dynamic ssn;
  late final dynamic userAgent;
  late final Crypto crypto;

  Users.fromJson(Map<String, dynamic> json){
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    maidenName = json['maidenName'];
    age = json['age'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    username = json['username'];
    password = json['password'];
    birthDate = json['birthDate'];
    image = json['image'];
    bloodGroup = json['bloodGroup'];
    height = json['height'];
    weight = json['weight'];
    eyeColor = json['eyeColor'];
    hair = Hair.fromJson(json['hair']);
    domain = json['domain'];
    ip = json['ip'];
    address = Address.fromJson(json['address']);
    macAddress = json['macAddress'];
    university = json['university'];
    bank = Bank.fromJson(json['bank']);
    company = Company.fromJson(json['company']);
    ein = json['ein'];
    ssn = json['ssn'];
    userAgent = json['userAgent'];
    crypto = Crypto.fromJson(json['crypto']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['maidenName'] = maidenName;
    _data['age'] = age;
    _data['gender'] = gender;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['username'] = username;
    _data['password'] = password;
    _data['birthDate'] = birthDate;
    _data['image'] = image;
    _data['bloodGroup'] = bloodGroup;
    _data['height'] = height;
    _data['weight'] = weight;
    _data['eyeColor'] = eyeColor;
    _data['hair'] = hair.toJson();
    _data['domain'] = domain;
    _data['ip'] = ip;
    _data['address'] = address.toJson();
    _data['macAddress'] = macAddress;
    _data['university'] = university;
    _data['bank'] = bank.toJson();
    _data['company'] = company.toJson();
    _data['ein'] = ein;
    _data['ssn'] = ssn;
    _data['userAgent'] = userAgent;
    _data['crypto'] = crypto.toJson();
    return _data;
  }
}

class Hair {
  Hair({
    required this.color,
    required this.type,
  });
  late final dynamic color;
  late final dynamic type;

  Hair.fromJson(Map<String, dynamic> json){
    color = json['color'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['color'] = color;
    _data['type'] = type;
    return _data;
  }
}

class Address {
  Address({
    required this.address,
    required this.city,
    required this.coordinates,
    required this.postalCode,
    required this.state,
  });
  late final dynamic address;
  late final dynamic city;
  late final Coordinates coordinates;
  late final dynamic postalCode;
  late final dynamic state;

  Address.fromJson(Map<String, dynamic> json){
    address = json['address'];
    city = json['city'];
    coordinates = Coordinates.fromJson(json['coordinates']);
    postalCode = json['postalCode'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address'] = address;
    _data['city'] = city;
    _data['coordinates'] = coordinates.toJson();
    _data['postalCode'] = postalCode;
    _data['state'] = state;
    return _data;
  }
}

class Coordinates {
  Coordinates({
    required this.lat,
    required this.lng,
  });
  late final double lat;
  late final double lng;

  Coordinates.fromJson(Map<String, dynamic> json){
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lat'] = lat;
    _data['lng'] = lng;
    return _data;
  }
}

class Bank {
  Bank({
    required this.cardExpire,
    required this.cardNumber,
    required this.cardType,
    required this.currency,
    required this.iban,
  });
  late final dynamic cardExpire;
  late final dynamic cardNumber;
  late final dynamic cardType;
  late final dynamic currency;
  late final dynamic iban;

  Bank.fromJson(Map<String, dynamic> json){
    cardExpire = json['cardExpire'];
    cardNumber = json['cardNumber'];
    cardType = json['cardType'];
    currency = json['currency'];
    iban = json['iban'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cardExpire'] = cardExpire;
    _data['cardNumber'] = cardNumber;
    _data['cardType'] = cardType;
    _data['currency'] = currency;
    _data['iban'] = iban;
    return _data;
  }
}

class Company {
  Company({
    required this.address,
    required this.department,
    required this.name,
    required this.title,
  });
  late final Address address;
  late final dynamic department;
  late final dynamic name;
  late final dynamic title;

  Company.fromJson(Map<String, dynamic> json){
    address = Address.fromJson(json['address']);
    department = json['department'];
    name = json['name'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address'] = address.toJson();
    _data['department'] = department;
    _data['name'] = name;
    _data['title'] = title;
    return _data;
  }
}

class Crypto {
  Crypto({
    required this.coin,
    required this.wallet,
    required this.network,
  });
  late final dynamic coin;
  late final dynamic wallet;
  late final dynamic network;

  Crypto.fromJson(Map<String, dynamic> json){
    coin = json['coin'];
    wallet = json['wallet'];
    network = json['network'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['coin'] = coin;
    _data['wallet'] = wallet;
    _data['network'] = network;
    return _data;
  }
}