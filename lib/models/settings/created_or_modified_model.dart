class CreatedOrModifiedPostModel {
  String? createdByUserID;
  String? modifiedByUserID;
  int? modifiedByAppId;
  String? modifiedByAppName;
  String? modifiedByAppVersionNumber;
  String? modifiedByBrowserName;
  String? modifiedByBrowserVersion;
  String? modifiedByModel;
  String? modifiedByManufacturer;
  String? modifiedByDeviceType;
  String? modifiedByNetworkType;
  int? modifiedByPlatformId;
  String? modifiedByPlatformVersion;
  String? modifiedByLatitude;
  String? modifiedByLongitude;
  String? modifiedByIp;
  String? modifiedByCity;
  String? modifiedByRegion;
  int? modifiedByCountryId;
  int? modifiedByLanguageId;

  CreatedOrModifiedPostModel(
      {this.createdByUserID,
      this.modifiedByUserID,
      this.modifiedByAppId,
      this.modifiedByAppName,
      this.modifiedByAppVersionNumber,
      this.modifiedByBrowserName,
      this.modifiedByBrowserVersion,
      this.modifiedByModel,
      this.modifiedByManufacturer,
      this.modifiedByDeviceType,
      this.modifiedByNetworkType,
      this.modifiedByPlatformId,
      this.modifiedByPlatformVersion,
      this.modifiedByLatitude,
      this.modifiedByLongitude,
      this.modifiedByIp,
      this.modifiedByCity,
      this.modifiedByRegion,
      this.modifiedByCountryId,
      this.modifiedByLanguageId});

  static List<Map<String, dynamic>> setJsonTableNameAndDefaultFields(
      {required String tableName,
      bool isModified = false,
      bool isCreated = false}) {
    List<Map<String, dynamic>> jsonArray = [];

    final Map<String, dynamic> tablemap = {
      'type': tableName,
      // Add more key-value pairs as needed
    };
    final modifiedMap = <String, dynamic>{
      "ModifiedByUserID": "@UserId",
      "ModifiedByAppId": 1,
      "ModifiedByAppName": "Freedom",
      "ModifiedByAppVersionNumber": "2.0.0",
      "ModifiedByBrowserName": null,
      "ModifiedByBrowserVersion": null,
      "ModifiedByModel": "SM-G610F",
      "ModifiedByManufacturer": "samsung",
      "ModifiedByDeviceType": "Phone",
      "ModifiedByNetworkType": "Cellular",
      "ModifiedByPlatformId": 3,
      "ModifiedByPlatformVersion": "8.1.0",
      "ModifiedByLatitude": "33.72148",
      "ModifiedByLongitude": "73.04329",
      "ModifiedByIp": "192.168.43.1",
      "ModifiedByCity": "Islamabad",
      "ModifiedByRegion": "Islamabad",
      "ModifiedByCountryId": 167,
      "ModifiedByLanguageId": 1,
    };
    if (isCreated) {
      modifiedMap["CreatedByUserID"] = "@UserId";
    }
    modifiedMap.addAll({
      '__metadata': tablemap,
    });
    jsonArray.add(modifiedMap);

    return jsonArray;
  }
}
