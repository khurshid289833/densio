class SummaryDetailsModel {
  SummaryDetailsModel({
    required this.status,
    required this.data,
    required this.message,
    required this.statusCode,
  });
  late final bool status;
  late final Data data;
  late final String message;
  late final int statusCode;

  SummaryDetailsModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = Data.fromJson(json['data']);
    message = json['message'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.toJson();
    _data['message'] = message;
    _data['statusCode'] = statusCode;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.deviceId,
    required this.slotId,
    required this.certificationName,
    required this.approvedScale,
    required this.expiryDate,
    required this.status,
    required this.createdDate,
    required this.media,
    required this.createdBy,
    required this.vendor,
    required this.lastCalibrationDate,
    required this.calibrationReport,
    required this.nextCalibrationDate,
  });
  late final String id;
  late final String deviceId;
  late final String slotId;
  late final String certificationName;
  late final ApprovedScale approvedScale;
  late final String expiryDate;
  late final String status;
  late final String createdDate;
  late final List<Media> media;
  late final CreatedBy createdBy;
  late final Vendor vendor;
  late final String lastCalibrationDate;
  late final List<CalibrationReport> calibrationReport;
  late final String nextCalibrationDate;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    deviceId = json['deviceId'];
    slotId = json['slotId'];
    certificationName = json['certificationName'];
    approvedScale = ApprovedScale.fromJson(json['approvedScale']);
    expiryDate = json['expiryDate'];
    status = json['status'];
    createdDate = json['createdDate'];
    media = List.from(json['media']).map((e)=>Media.fromJson(e)).toList();
    createdBy = CreatedBy.fromJson(json['createdBy']);
    vendor = Vendor.fromJson(json['vendor']);
    lastCalibrationDate = json['lastCalibrationDate'];
    calibrationReport = List.from(json['calibrationReport']).map((e)=>CalibrationReport.fromJson(e)).toList();
    nextCalibrationDate = json['nextCalibrationDate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['deviceId'] = deviceId;
    _data['slotId'] = slotId;
    _data['certificationName'] = certificationName;
    _data['approvedScale'] = approvedScale.toJson();
    _data['expiryDate'] = expiryDate;
    _data['status'] = status;
    _data['createdDate'] = createdDate;
    _data['media'] = media.map((e)=>e.toJson()).toList();
    _data['createdBy'] = createdBy.toJson();
    _data['vendor'] = vendor.toJson();
    _data['lastCalibrationDate'] = lastCalibrationDate;
    _data['calibrationReport'] = calibrationReport.map((e)=>e.toJson()).toList();
    _data['nextCalibrationDate'] = nextCalibrationDate;
    return _data;
  }
}

class ApprovedScale {
  ApprovedScale();

  ApprovedScale.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class Media {
  Media({
    required this.uri,
    required this.meta,
  });
  late final String uri;
  late final Meta meta;

  Media.fromJson(Map<String, dynamic> json){
    uri = json['uri'];
    meta = Meta.fromJson(json['meta']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uri'] = uri;
    _data['meta'] = meta.toJson();
    return _data;
  }
}

class Meta {
  Meta();

  Meta.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class CreatedBy {
  CreatedBy({
    required this.id,
    required this.name,
  });
  late final String id;
  late final String name;

  CreatedBy.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class Vendor {
  Vendor({
    required this.vendorName,
    required this.vendorId,
  });
  late final String vendorName;
  late final String vendorId;

  Vendor.fromJson(Map<String, dynamic> json){
    vendorName = json['vendorName'];
    vendorId = json['vendorId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['vendorName'] = vendorName;
    _data['vendorId'] = vendorId;
    return _data;
  }
}

class CalibrationReport {
  CalibrationReport({
    required this.uri,
    required this.meta,
  });
  late final String uri;
  late final Meta meta;

  CalibrationReport.fromJson(Map<String, dynamic> json){
    uri = json['uri'];
    meta = Meta.fromJson(json['meta']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uri'] = uri;
    _data['meta'] = meta.toJson();
    return _data;
  }
}