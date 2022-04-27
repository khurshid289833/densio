class LatestResultResponse {
  LatestResultResponse({
      bool? status, 
      List<Data>? data, 
      Meta? meta, 
      String? message, 
      int? statusCode,}){
    _status = status;
    _data = data;
    _meta = meta;
    _message = message;
    _statusCode = statusCode;
}

  LatestResultResponse.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _message = json['message'];
    _statusCode = json['statusCode'];
  }
  bool? _status;
  List<Data>? _data;
  Meta? _meta;
  String? _message;
  int? _statusCode;

  bool? get status => _status;
  List<Data>? get data => _data;
  Meta? get meta => _meta;
  String? get message => _message;
  int? get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    map['message'] = _message;
    map['statusCode'] = _statusCode;
    return map;
  }

}

class Meta {
  Meta({
      int? page, 
      int? perPage, 
      int? pageCount, 
      int? totalCount, 
      List<Links>? links,}){
    _page = page;
    _perPage = perPage;
    _pageCount = pageCount;
    _totalCount = totalCount;
    _links = links;
}

  Meta.fromJson(dynamic json) {
    _page = json['page'];
    _perPage = json['per_page'];
    _pageCount = json['page_count'];
    _totalCount = json['total_count'];
    if (json['links'] != null) {
      _links = [];
      json['links'].forEach((v) {
        _links?.add(Links.fromJson(v));
      });
    }
  }
  int? _page;
  int? _perPage;
  int? _pageCount;
  int? _totalCount;
  List<Links>? _links;

  int? get page => _page;
  int? get perPage => _perPage;
  int? get pageCount => _pageCount;
  int? get totalCount => _totalCount;
  List<Links>? get links => _links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    map['per_page'] = _perPage;
    map['page_count'] = _pageCount;
    map['total_count'] = _totalCount;
    if (_links != null) {
      map['links'] = _links?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Links {
  Links({
      String? self,}){
    _self = self;
}

  Links.fromJson(dynamic json) {
    _self = json['self'];
  }
  String? _self;

  String? get self => _self;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['self'] = _self;
    return map;
  }

}

class Data {
  Data({
      String? id, 
      String? slotId, 
      String? deviceId,
    String? deviceName,
    Result? result,
      String? approvedStatus, 
      ApprovedOrRejectedBy? approvedOrRejectedBy, 
      String? createdDate, 
      CreatedBy? createdBy,}){
    _id = id;
    _slotId = slotId;
    _deviceId = deviceId;
    _deviceName = deviceName;
    _result = result;
    _approvedStatus = approvedStatus;
    _approvedOrRejectedBy = approvedOrRejectedBy;
    _createdDate = createdDate;
    _createdBy = createdBy;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _slotId = json['slotId'];
    _deviceId = json['deviceId'];
    _deviceName = json['deviceName'];
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
    _approvedStatus = json['approvedStatus'];
    _approvedOrRejectedBy = json['approvedOrRejectedBy'] != null ? ApprovedOrRejectedBy.fromJson(json['approvedOrRejectedBy']) : null;
    _createdDate = json['createdDate'];
    _createdBy = json['createdBy'] != null ? CreatedBy.fromJson(json['createdBy']) : null;
  }
  String? _id;
  String? _slotId;
  String? _deviceId;
  String? _deviceName;
  Result? _result;
  String? _approvedStatus;
  ApprovedOrRejectedBy? _approvedOrRejectedBy;
  String? _createdDate;
  CreatedBy? _createdBy;

  String? get id => _id;
  String? get slotId => _slotId;

  set approvedStatus(String? value) {
    _approvedStatus = value;
  }

  String? get deviceId => _deviceId;
  String? get deviceName => _deviceName;

  Result? get result => _result;
  String? get approvedStatus => _approvedStatus;
  ApprovedOrRejectedBy? get approvedOrRejectedBy => _approvedOrRejectedBy;
  String? get createdDate => _createdDate;
  CreatedBy? get createdBy => _createdBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['slotId'] = _slotId;
    map['deviceId'] = _deviceId;
    map['deviceName'] = _deviceName;

    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    map['approvedStatus'] = _approvedStatus;
    if (_approvedOrRejectedBy != null) {
      map['approvedOrRejectedBy'] = _approvedOrRejectedBy?.toJson();
    }
    map['createdDate'] = _createdDate;
    if (_createdBy != null) {
      map['createdBy'] = _createdBy?.toJson();
    }
    return map;
  }

}

class CreatedBy {
  CreatedBy({
      String? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  CreatedBy.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  String? _id;
  String? _name;

  String? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}

class ApprovedOrRejectedBy {
  ApprovedOrRejectedBy({
      String? id, 
      String? name, 
      String? datetime,}){
    _id = id;
    _name = name;
    _datetime = datetime;
}

  ApprovedOrRejectedBy.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _datetime = json['datetime'];
  }
  String? _id;
  String? _name;
  String? _datetime;

  String? get id => _id;
  String? get name => _name;
  String? get datetime => _datetime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['datetime'] = _datetime;
    return map;
  }

}

class Result {
  Result({
      String? density, 
      String? densityUnit, 
      String? temperature, 
      String? temperatureUnit,}){
    _density = density;
    _densityUnit = densityUnit;
    _temperature = temperature;
    _temperatureUnit = temperatureUnit;
}

  Result.fromJson(dynamic json) {
    _density = json['density'];
    _densityUnit = json['densityUnit'];
    _temperature = json['temperature'];
    _temperatureUnit = json['temperatureUnit'];
  }
  String? _density;
  String? _densityUnit;
  String? _temperature;
  String? _temperatureUnit;

  String? get density => _density;
  String? get densityUnit => _densityUnit;
  String? get temperature => _temperature;
  String? get temperatureUnit => _temperatureUnit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['density'] = _density;
    map['densityUnit'] = _densityUnit;
    map['temperature'] = _temperature;
    map['temperatureUnit'] = _temperatureUnit;
    return map;
  }

}