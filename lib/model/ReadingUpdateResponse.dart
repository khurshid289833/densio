class ReadingUpdateResponse {
  ReadingUpdateResponse({
      bool? status, 
      Data? data, 
      String? message, 
      int? statusCode,}){
    _status = status;
    _data = data;
    _message = message;
    _statusCode = statusCode;
}

  ReadingUpdateResponse.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
    _statusCode = json['statusCode'];
  }
  bool? _status;
  Data? _data;
  String? _message;
  int? _statusCode;

  bool? get status => _status;
  Data? get data => _data;
  String? get message => _message;
  int? get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    map['statusCode'] = _statusCode;
    return map;
  }

}

class Data {
  Data({
      String? id, 
      String? status,}){
    _id = id;
    _status = status;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _status = json['status'];
  }
  String? _id;
  String? _status;

  String? get id => _id;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['status'] = _status;
    return map;
  }

}