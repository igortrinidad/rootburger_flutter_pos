import 'package:rootburger_flutter_pos/models/device_model.dart';
import 'package:rootburger_flutter_pos/models/payment_method_model.dart';
import 'package:rootburger_flutter_pos/models/user_model.dart';

class StoreModel {
  String id;
  String name;
  String email;
  String slug;
  String description;
  Address address;
  String receiptAddress;
  double lat;
  double lng;
  String phone;
  String website;
  bool makeDelivery;
  int stoneCode;
  String socialName;
  String cnpj;
  String receiptMessage;
  List<OpeningHours> openingHours;
  String uberStoreId;
  Null ifoodMerchantId;
  List<UserModel> users;
  List<DeviceModel> devices;
  List<PaymentMethodModel> paymentMethods;

  StoreModel(
      {this.id,
      this.name,
      this.email,
      this.slug,
      this.description,
      this.address,
      this.receiptAddress,
      this.lat,
      this.lng,
      this.phone,
      this.website,
      this.makeDelivery,
      this.stoneCode,
      this.socialName,
      this.cnpj,
      this.receiptMessage,
      this.openingHours,
      this.uberStoreId,
      this.ifoodMerchantId,
      this.users,
      this.devices,
      this.paymentMethods});

  StoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    slug = json['slug'];
    description = json['description'];
    address = json['address'] != null ? new Address.fromJson(json['address']) : null;
    receiptAddress = json['receipt_address'];
    lat = json['lat'];
    lng = json['lng'];
    phone = json['phone'];
    website = json['website'];
    makeDelivery = json['make_delivery'];
    stoneCode = json['stone_code'];
    socialName = json['social_name'];
    cnpj = json['cnpj'];
    receiptMessage = json['receipt_message'];
    if (json['opening_hours'] != null) {
      openingHours = new List<OpeningHours>();
      json['opening_hours'].forEach((v) {
        openingHours.add(new OpeningHours.fromJson(v));
      });
    }
    uberStoreId = json['uber_store_id'];
    ifoodMerchantId = json['ifood_merchant_id'];

    if (json['users'] != null) {
      users = new List<UserModel>();
      json['users'].forEach((v) {
        users.add(new UserModel.fromJson(v));
      });
    }
    if (json['devices'] != null) {
      devices = new List<DeviceModel>();
      json['devices'].forEach((v) {
        devices.add(new DeviceModel.fromJson(v));
      });
    }
    if (json['payment_methods'] != null) {
      paymentMethods = new List<PaymentMethodModel>();
      json['payment_methods'].forEach((v) {
        paymentMethods.add(new PaymentMethodModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['slug'] = this.slug;
    data['description'] = this.description;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['receipt_address'] = this.receiptAddress;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['phone'] = this.phone;
    data['website'] = this.website;
    data['make_delivery'] = this.makeDelivery;
    data['stone_code'] = this.stoneCode;
    data['social_name'] = this.socialName;
    data['cnpj'] = this.cnpj;
    data['receipt_message'] = this.receiptMessage;
    if (this.openingHours != null) {
      data['opening_hours'] = this.openingHours.map((v) => v.toJson()).toList();
    }
    data['uber_store_id'] = this.uberStoreId;
    data['ifood_merchant_id'] = this.ifoodMerchantId;
    if (this.users != null) {
      data['users'] = this.users.map((v) => v.toJson()).toList();
    }
    if (this.devices != null) {
      data['devices'] = this.devices.map((v) => v.toJson()).toList();
    }
    if (this.paymentMethods != null) {
      data['payment_methods'] =
          this.paymentMethods.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  String url;
  String city;
  String name;
  String state;
  String fullAddress;

  Address({this.url, this.city, this.name, this.state, this.fullAddress});

  Address.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    city = json['city'];
    name = json['name'];
    state = json['state'];
    fullAddress = json['full_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['city'] = this.city;
    data['name'] = this.name;
    data['state'] = this.state;
    data['full_address'] = this.fullAddress;
    return data;
  }
}

class OpeningHours {
  String to;
  int dow;
  String from;
  bool closed;
  String labelEn;
  String labelPt;

  OpeningHours(
      {this.to, this.dow, this.from, this.closed, this.labelEn, this.labelPt});

  OpeningHours.fromJson(Map<String, dynamic> json) {
    to = json['to'];
    dow = json['dow'];
    from = json['from'];
    closed = json['closed'];
    labelEn = json['label_en'];
    labelPt = json['label_pt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['to'] = this.to;
    data['dow'] = this.dow;
    data['from'] = this.from;
    data['closed'] = this.closed;
    data['label_en'] = this.labelEn;
    data['label_pt'] = this.labelPt;
    return data;
  }
}

