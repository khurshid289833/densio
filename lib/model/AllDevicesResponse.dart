class AllDevicesResponse {
  AllDevicesResponse({
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

  AllDevicesResponse.fromJson(dynamic json) {
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
      String? deviceId, 
      String? deviceName, 
      String? model, 
      Certification? certification, 
      Qc? qc, 
      AssignedTo? assignedTo, 
      String? status, 
      OwnedBy? ownedBy, 
      ModifiedBy? modifiedBy, 
      String? modifiedDate, 
      bool? online, 
      ReadingInfo? readingInfo, 
      int? noOfSlot, 
      List<SlotInfo>? slotInfo, 
      Parts? parts, 
      String? createdDate, 
      CreatedBy? createdBy,}){
    _deviceId = deviceId;
    _deviceName = deviceName;
    _model = model;
    _certification = certification;
    _qc = qc;
    _assignedTo = assignedTo;
    _status = status;
    _ownedBy = ownedBy;
    _modifiedBy = modifiedBy;
    _modifiedDate = modifiedDate;
    _online = online;
    _readingInfo = readingInfo;
    _noOfSlot = noOfSlot;
    _slotInfo = slotInfo;
    _parts = parts;
    _createdDate = createdDate;
    _createdBy = createdBy;
}

  Data.fromJson(dynamic json) {
    _deviceId = json['deviceId'];
    _deviceName = json['deviceName'];
    _model = json['model'];
    _certification = json['certification'] != null ? Certification.fromJson(json['certification']) : null;
    _qc = json['qc'] != null ? Qc.fromJson(json['qc']) : null;
    _assignedTo = json['assignedTo'] != null ? AssignedTo.fromJson(json['assignedTo']) : null;
    _status = json['status'];
    _ownedBy = json['ownedBy'] != null ? OwnedBy.fromJson(json['ownedBy']) : null;
    _modifiedBy = json['modifiedBy'] != null ? ModifiedBy.fromJson(json['modifiedBy']) : null;
    _modifiedDate = json['modifiedDate'];
    _online = json['online'];
    _readingInfo = json['readingInfo'] != null ? ReadingInfo.fromJson(json['readingInfo']) : null;
    _noOfSlot = json['noOfSlot'];
    if (json['slotInfo'] != null) {
      _slotInfo = [];
      json['slotInfo'].forEach((v) {
        _slotInfo?.add(SlotInfo.fromJson(v));
      });
    }
    _parts = json['parts'] != null ? Parts.fromJson(json['parts']) : null;
    _createdDate = json['createdDate'];
    _createdBy = json['createdBy'] != null ? CreatedBy.fromJson(json['createdBy']) : null;
  }
  String? _deviceId;
  String? _deviceName;
  String? _model;
  Certification? _certification;
  Qc? _qc;
  AssignedTo? _assignedTo;
  String? _status;
  OwnedBy? _ownedBy;
  ModifiedBy? _modifiedBy;
  String? _modifiedDate;
  bool? _online;
  ReadingInfo? _readingInfo;
  int? _noOfSlot;
  List<SlotInfo>? _slotInfo;
  Parts? _parts;
  String? _createdDate;
  CreatedBy? _createdBy;

  String? get deviceId => _deviceId;
  String? get deviceName => _deviceName;
  String? get model => _model;
  Certification? get certification => _certification;
  Qc? get qc => _qc;
  AssignedTo? get assignedTo => _assignedTo;
  String? get status => _status;
  OwnedBy? get ownedBy => _ownedBy;
  ModifiedBy? get modifiedBy => _modifiedBy;
  String? get modifiedDate => _modifiedDate;
  bool? get online => _online;
  ReadingInfo? get readingInfo => _readingInfo;
  int? get noOfSlot => _noOfSlot;
  List<SlotInfo>? get slotInfo => _slotInfo;
  Parts? get parts => _parts;
  String? get createdDate => _createdDate;
  CreatedBy? get createdBy => _createdBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['deviceId'] = _deviceId;
    map['deviceName'] = _deviceName;
    map['model'] = _model;
    if (_certification != null) {
      map['certification'] = _certification?.toJson();
    }
    if (_qc != null) {
      map['qc'] = _qc?.toJson();
    }
    if (_assignedTo != null) {
      map['assignedTo'] = _assignedTo?.toJson();
    }
    map['status'] = _status;
    if (_ownedBy != null) {
      map['ownedBy'] = _ownedBy?.toJson();
    }
    if (_modifiedBy != null) {
      map['modifiedBy'] = _modifiedBy?.toJson();
    }
    map['modifiedDate'] = _modifiedDate;
    map['online'] = _online;
    if (_readingInfo != null) {
      map['readingInfo'] = _readingInfo?.toJson();
    }
    map['noOfSlot'] = _noOfSlot;
    if (_slotInfo != null) {
      map['slotInfo'] = _slotInfo?.map((v) => v.toJson()).toList();
    }
    if (_parts != null) {
      map['parts'] = _parts?.toJson();
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

class Parts {
  Parts({
      String? ebr, 
      String? mar,}){
    _ebr = ebr;
    _mar = mar;
}

  Parts.fromJson(dynamic json) {
    _ebr = json['ebr'];
    _mar = json['mar'];
  }
  String? _ebr;
  String? _mar;

  String? get ebr => _ebr;
  String? get mar => _mar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ebr'] = _ebr;
    map['mar'] = _mar;
    return map;
  }

}

class SlotInfo {
  SlotInfo({
      String? id, 
      String? liquidType,}){
    _id = id;
    _liquidType = liquidType;
}

  SlotInfo.fromJson(dynamic json) {
    _id = json['id'];
    _liquidType = json['liquidType'];
  }
  String? _id;
  String? _liquidType;

  String? get id => _id;
  String? get liquidType => _liquidType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['liquidType'] = _liquidType;
    return map;
  }

}

class ReadingInfo {
  ReadingInfo({
      String? lastReading, 
      String? acceptedValues, 
      int? totalValues,}){
    _lastReading = lastReading;
    _acceptedValues = acceptedValues;
    _totalValues = totalValues;
}

  ReadingInfo.fromJson(dynamic json) {
    _lastReading = json['lastReading'];
    _acceptedValues = json['acceptedValues'];
    _totalValues = json['totalValues'];
  }
  String? _lastReading;
  String? _acceptedValues;
  int? _totalValues;

  String? get lastReading => _lastReading;
  String? get acceptedValues => _acceptedValues;
  int? get totalValues => _totalValues;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lastReading'] = _lastReading;
    map['acceptedValues'] = _acceptedValues;
    map['totalValues'] = _totalValues;
    return map;
  }

}

class ModifiedBy {
  ModifiedBy({
      String? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  ModifiedBy.fromJson(dynamic json) {
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

class OwnedBy {
  OwnedBy({
      String? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  OwnedBy.fromJson(dynamic json) {
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

class AssignedTo {
  AssignedTo({
      String? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  AssignedTo.fromJson(dynamic json) {
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

class Qc {
  Qc({
      String? vendorId, 
      String? vendorName, 
      String? approveDate, 
      Operator? operator,}){
    _vendorId = vendorId;
    _vendorName = vendorName;
    _approveDate = approveDate;
    _operator = operator;
}

  Qc.fromJson(dynamic json) {
    _vendorId = json['vendorId'];
    _vendorName = json['vendorName'];
    _approveDate = json['approveDate'];
    _operator = json['operator'] != null ? Operator.fromJson(json['operator']) : null;
  }
  String? _vendorId;
  String? _vendorName;
  String? _approveDate;
  Operator? _operator;

  String? get vendorId => _vendorId;
  String? get vendorName => _vendorName;
  String? get approveDate => _approveDate;
  Operator? get operator => _operator;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['vendorId'] = _vendorId;
    map['vendorName'] = _vendorName;
    map['approveDate'] = _approveDate;
    if (_operator != null) {
      map['operator'] = _operator?.toJson();
    }
    return map;
  }

}

class Operator {
  Operator({
      String? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Operator.fromJson(dynamic json) {
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

class Certification {
  Certification({
      bool? status, 
      String? date,}){
    _status = status;
    _date = date;
}

  Certification.fromJson(dynamic json) {
    _status = json['status'];
    _date = json['date'];
  }
  bool? _status;
  String? _date;

  bool? get status => _status;
  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['date'] = _date;
    return map;
  }

}