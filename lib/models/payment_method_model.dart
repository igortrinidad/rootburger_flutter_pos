class PaymentMethodModel {
  String id;
  String storeId;
  String namePt;
  String nameEn;
  double tax;
  String method;
  Null path;
  bool isActive;
  bool isManual;
  bool couldHaveTips;
  bool countSale;
  bool shouldEmitFiscalReceipt;
  int menuOrder;
  String iconClass;
  String cnpjCredenciadoraNf;
  String meioPagamentoNf;
  int bandeiraNf;
  String photoUrl;
  String formattedTax;

  PaymentMethodModel(
      {this.id,
      this.storeId,
      this.namePt,
      this.nameEn,
      this.tax,
      this.method,
      this.path,
      this.isActive,
      this.isManual,
      this.couldHaveTips,
      this.countSale,
      this.shouldEmitFiscalReceipt,
      this.menuOrder,
      this.iconClass,
      this.cnpjCredenciadoraNf,
      this.meioPagamentoNf,
      this.bandeiraNf,
      this.photoUrl,
      this.formattedTax});

  PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['store_id'];
    namePt = json['name_pt'];
    nameEn = json['name_en'];
    tax = json['tax'];
    method = json['method'];
    path = json['path'];
    isActive = json['is_active'];
    isManual = json['is_manual'];
    couldHaveTips = json['could_have_tips'];
    countSale = json['count_sale'];
    shouldEmitFiscalReceipt = json['should_emit_fiscal_receipt'];
    menuOrder = json['menu_order'];
    iconClass = json['icon_class'];
    cnpjCredenciadoraNf = json['cnpj_credenciadora_nf'];
    meioPagamentoNf = json['meio_pagamento_nf'];
    bandeiraNf = json['bandeira_nf'];
    photoUrl = json['photo_url'];
    formattedTax = json['formatted_tax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['store_id'] = this.storeId;
    data['name_pt'] = this.namePt;
    data['name_en'] = this.nameEn;
    data['tax'] = this.tax;
    data['method'] = this.method;
    data['path'] = this.path;
    data['is_active'] = this.isActive;
    data['is_manual'] = this.isManual;
    data['could_have_tips'] = this.couldHaveTips;
    data['count_sale'] = this.countSale;
    data['should_emit_fiscal_receipt'] = this.shouldEmitFiscalReceipt;
    data['menu_order'] = this.menuOrder;
    data['icon_class'] = this.iconClass;
    data['cnpj_credenciadora_nf'] = this.cnpjCredenciadoraNf;
    data['meio_pagamento_nf'] = this.meioPagamentoNf;
    data['bandeira_nf'] = this.bandeiraNf;
    data['photo_url'] = this.photoUrl;
    data['formatted_tax'] = this.formattedTax;
    return data;
  }
}