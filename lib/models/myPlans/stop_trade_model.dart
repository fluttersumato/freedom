/// userId : "2b510e07-3699-4b16-8374-6e3a1933d664"
/// currentStatus : 1
/// newStatus : 3

class PostTradeStatusModel {
  PostTradeStatusModel({
      this.userId, 
      this.currentStatus, 
      this.newStatus,});

  PostTradeStatusModel.fromJson(dynamic json) {
    userId = json['userId'];
    currentStatus = json['currentStatus'];
    newStatus = json['newStatus'];
  }
  String? userId;
  int? currentStatus;
  int? newStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['currentStatus'] = currentStatus;
    map['newStatus'] = newStatus;
    return map;
  }

}