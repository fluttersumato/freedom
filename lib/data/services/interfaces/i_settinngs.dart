
abstract class ISettings{

  Future<dynamic> saveAboutText({ String? url,required dynamic model});

}

/*
List<Map<String, dynamic>> jsonFields=CreatedOrModifiedPostModel.setJsonTableNameAndDefaultFields(tableName: "Users",isCreated: true);

jsonFields[0]['Id']= "@UserId";
jsonFields[0]['AboutMe']= "AboutMe Text";
String jsonStringForPost = jsonEncode(jsonFields);*/
