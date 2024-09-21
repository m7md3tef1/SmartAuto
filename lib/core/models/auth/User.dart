class User {
  User({
    num? id,
    String? name,
    String? email,
  }) {
    _id = id;
    _name = name;
    _email = email;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
  }
  num? _id;
  String? _name;
  String? _email;
  User copyWith({
    num? id,
    String? name,
    String? email,
  }) =>
      User(
        id: id ?? _id,
        name: name ?? _name,
        email: email ?? _email,
      );
  num? get id => _id;
  String? get name => _name;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    return map;
  }
}

class Users {
  Users({
    this.id,
    this.name,
    this.lastName,
    this.email,
    this.phone,
    this.full_phone,
    this.image,
    this.password,
    this.fcm_token,
    this.street,
    this.passwordConfirmation,
    this.createdAt,
    this.pile_count,
    this.pile_IamIn,
    this.wallet_balance,
    this.reminder_day,
    this.updatedAt,
  });

  Users.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    full_phone = json['full_phone'];
    image = json['image'];
    createdAt = json['created_at'];
    pile_IamIn = json['piles_im_in_count'];
    pile_count = json['my_piles_count'];
    updatedAt = json['updated_at'];
    password = json['password'];
    fcm_token = json['token'];
    reminder_day = json['reminder_day'];
    passwordConfirmation = json['password_confirmation'];
    street = json['street'];
    wallet_balance = json['wallet_balance'];
  }
  int? id;
  String? name;
  String? lastName;
  String? email;
  String? phone;
  String? full_phone;
  String? image;
  String? createdAt;
  String? updatedAt;
  var password;
  var reminder_day;
  var fcm_token;
  var passwordConfirmation;
  var street;
  var pile_count;
  var pile_IamIn;
  var wallet_balance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['last_name'] = lastName;
    map['email'] = email;
    map['full_phone'] = full_phone;
    map['phone'] = phone;
    map['image'] = image;
    map['password'] = password;
    map['token'] = fcm_token;
    map['reminder_day'] = reminder_day;
    map['password_confirmation'] = passwordConfirmation;
    map['street'] = street;
    map['wallet_balance'] = wallet_balance;
    map['piles_im_in_count'] = pile_IamIn;
    map['my_piles_count'] = pile_count;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class MakeOrder {
  MakeOrder({
    var address_id,
    var payment_card_id,
    String? payment_method,
    String? shipping_method,
    var delivery_date,
    var delivery_time,
    var coupon,
  }) {
    _address_id = address_id;
    _payment_card_id = payment_card_id;
    _payment_method = payment_method;
    _delivery_date = delivery_date;
    _delivery_time = delivery_time;
    _shipping_method = shipping_method;
    _coupon = coupon;
  }

  MakeOrder.fromJson(dynamic json) {
    _address_id = json['address_id'];
    _payment_method = json['payment_method'];
    _coupon = json['coupon'];
    _delivery_time = json['delivery_time'];
    _delivery_date = json['delivery_date'];
    _payment_card_id = json['payment_card_id'];
    _shipping_method = json['shipping_method'];
  }
  var _address_id;
  var _payment_card_id;
  String? _payment_method;
  String? _shipping_method;
  var _coupon;
  var _delivery_time;
  var _delivery_date;
  MakeOrder copyWith({
    var addressId,
    var payment_card_id,
    String? payment_method,
    String? shipping_method,
    var coupon,
    var delivery_time,
    var delivery_date,
  }) =>
      MakeOrder(
        address_id: addressId ?? _address_id,
        payment_method: payment_method ?? _payment_method,
        coupon: coupon ?? _coupon,
        shipping_method: shipping_method ?? _shipping_method,
        payment_card_id: payment_card_id ?? _payment_card_id,
        delivery_time: delivery_time ?? _delivery_time,
        delivery_date: delivery_date ?? _delivery_date,
      );
  get address_id => _address_id;
  get payment_card_id => _payment_card_id;
  String? get payment_method => _payment_method;
  String? get shipping_method => _shipping_method;
  String? get coupon => _coupon;
  get delivery_date => _delivery_date;
  String? get delivery_time => _delivery_time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address_id'] = _address_id;
    map['payment_method'] = _payment_method;
    map['shipping_method'] = _shipping_method;
    map['coupon'] = _coupon;
    map['delivery_date'] = _delivery_date;
    map['delivery_time'] = _delivery_time;
    map['payment_card_id'] = _payment_card_id;
    return map;
  }
}

class Make {
  Make({
    this.address_id,
    this.payment_method,
    this.coupon,
    this.delivery_time,
    this.delivery_date,
    this.note,
    this.payment_card_id,
    this.shipping_method,
  });

  Make.fromJson(dynamic json) {
    address_id = json['address_id'];
    payment_method = json['payment_method'];
    coupon = json['coupon'];
    note = json['note'];
    delivery_time = json['delivery_time'];
    delivery_date = json['delivery_date'];
    payment_card_id = json['payment_card_id'];
    shipping_method = json['shipping_method'];
  }
  var address_id;
  var payment_card_id;
  String? payment_method;
  String? shipping_method;
  var delivery_date;
  var note;
  var delivery_time;
  var coupon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    address_id == null ? '' : map['address_id'] = address_id;
    payment_method == null ? '' : map['payment_method'] = payment_method;
    coupon == null ? '' : map['coupon'] = coupon;
    note == null ? '' : map['note'] = note;
    delivery_time == null ? '' : map['delivery_time'] = delivery_time;
    delivery_date == null ? '' : map['delivery_date'] = delivery_date;
    payment_card_id == null ? '' : map['payment_card_id'] = payment_card_id;
    shipping_method == null ? '' : map['shipping_method'] = shipping_method;
    return map;
  }
}
