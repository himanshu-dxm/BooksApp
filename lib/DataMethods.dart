import 'dart:convert';
import 'package:http/http.dart' as http;

var dataList = [];

class DataFormat {
  final String name,id,company,orderId,invoicepaid,invoidePending;
  DataFormat({
    required this.name,
    required this.id,
    required this.company,
    required this.orderId,
    required this.invoicepaid,
    required this.invoidePending
  });

  factory DataFormat.fromJson(Map<String,dynamic> json,int index) {
    var temp = json["clients"][index];
    return DataFormat(
      invoidePending: temp["invoicePending"],
      id: temp["id"],
      invoicepaid: temp["invoicepaid"],
      company: temp["company"],
      name: temp["name"],
      orderId: temp["orderId"],
    );
  }
}

// API Call to access data
Future fetchData() async {
  DataFormat data ;
  var url = "https://run.mocky.io/v3/d53400a3-6126-495e-9d16-0b4414b537b3";
  final response = await http.get(Uri.parse(url));
  if(response.statusCode==200) {
    var myResponse = modifyResponse(response.body);
    var temp = jsonDecode(myResponse);
    for(int i=0;i<temp["clients"].length;i++) {
      data = DataFormat.fromJson(jsonDecode(myResponse),i);
      dataList.add(data);
    }
  }
}

// To Convert the JSON with error into a proper JSON format
 modifyResponse(temp) {
  var result="";
  result = temp+"\n}";
  return result;
}