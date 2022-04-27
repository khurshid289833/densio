class LatestResultModel {
  LatestResultModel({
    required this.status,
    required this.data,
    required this.message,
    required this.statusCode,
  });
  late final bool status;
  late final List<Data> data;
  late final String message;
  late final int statusCode;

  LatestResultModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    message = json['message'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['message'] = message;
    _data['statusCode'] = statusCode;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.slotId,
    required this.deviceId,
    required this.deviceName,
    required this.result,
    required this.approvedStatus,
    required this.approvedOrRejectedBy,
    required this.createdDate,
    required this.createdBy,
  });
  late final String id;
  late final String slotId;
  late final String deviceId;
  late final String deviceName;
  late final Result result;
  late final String approvedStatus;
  late final ApprovedOrRejectedBy approvedOrRejectedBy;
  late final String createdDate;
  late final CreatedBy createdBy;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    slotId = json['slotId'];
    deviceId = json['deviceId'];
    deviceName = json['deviceName'];
    result = Result.fromJson(json['result']);
    approvedStatus = json['approvedStatus'];
    approvedOrRejectedBy = ApprovedOrRejectedBy.fromJson(json['approvedOrRejectedBy']);
    createdDate = json['createdDate'];
    createdBy = CreatedBy.fromJson(json['createdBy']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['slotId'] = slotId;
    _data['deviceId'] = deviceId;
    _data['deviceName'] = deviceId;
    _data['result'] = result.toJson();
    _data['approvedStatus'] = approvedStatus;
    _data['approvedOrRejectedBy'] = approvedOrRejectedBy.toJson();
    _data['createdDate'] = createdDate;
    _data['createdBy'] = createdBy.toJson();
    return _data;
  }
}

class Result {
  Result({
    required this.density,
    required this.densityUnit,
    required this.temperature,
    required this.temperatureUnit,
  });
  late final String density;
  late final String densityUnit;
  late final String temperature;
  late final String temperatureUnit;

  Result.fromJson(Map<String, dynamic> json){
    density = json['density'];
    densityUnit = json['densityUnit'];
    temperature = json['temperature'];
    temperatureUnit = json['temperatureUnit'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['density'] = density;
    _data['densityUnit'] = densityUnit;
    _data['temperature'] = temperature;
    _data['temperatureUnit'] = temperatureUnit;
    return _data;
  }
}

class ApprovedOrRejectedBy {
  ApprovedOrRejectedBy({
    required this.id,
    required this.name,
    required this.datetime,
  });
  late final String id;
  late final String name;
  late final String datetime;

  ApprovedOrRejectedBy.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['datetime'] = datetime;
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