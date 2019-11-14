class DeviceModel {
  String id;
  String storeId;
  String type;
  String name;
  String ipAddress;
  String macAddress;
  String port;
  String configName;
  bool isKitchen;
  bool isBar;
  int isAdmin;
  bool acceptManualPayment;
  String fcmToken;
  String fcmTokenBrowser;
  bool locked;

  DeviceModel(
      {this.id,
      this.storeId,
      this.type,
      this.name,
      this.ipAddress,
      this.macAddress,
      this.port,
      this.configName,
      this.isKitchen,
      this.isBar,
      this.isAdmin,
      this.acceptManualPayment,
      this.fcmToken,
      this.fcmTokenBrowser,
      this.locked});

  DeviceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['store_id'];
    type = json['type'];
    name = json['name'];
    ipAddress = json['ip_address'];
    macAddress = json['mac_address'];
    port = json['port'];
    configName = json['config_name'];
    isKitchen = json['is_kitchen'];
    isBar = json['is_bar'];
    isAdmin = json['is_admin'];
    acceptManualPayment = json['accept_manual_payment'];
    fcmToken = json['fcm_token'];
    fcmTokenBrowser = json['fcm_token_browser'];
    locked = json['locked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['store_id'] = this.storeId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['ip_address'] = this.ipAddress;
    data['mac_address'] = this.macAddress;
    data['port'] = this.port;
    data['config_name'] = this.configName;
    data['is_kitchen'] = this.isKitchen;
    data['is_bar'] = this.isBar;
    data['is_admin'] = this.isAdmin;
    data['accept_manual_payment'] = this.acceptManualPayment;
    data['fcm_token'] = this.fcmToken;
    data['fcm_token_browser'] = this.fcmTokenBrowser;
    data['locked'] = this.locked;
    return data;
  }
}