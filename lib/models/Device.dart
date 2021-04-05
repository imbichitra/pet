class Device {
  String imeiNumber;
  String modelType;

  Device(this.imeiNumber, this.modelType);

  Device.fromJson(Map<String, dynamic> json) {
    imeiNumber = json['imeiNumber'];
    modelType = json['modelType'] != null ? json['modelType'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imeiNumber'] = this.imeiNumber;
    data['modelType'] = this.modelType;
    return data;
  }
}
