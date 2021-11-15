import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

String url = "https://graphql.anilist.co";

class GetConsumer {

  GetConsumer();

  Future<String> getPetition() async {
    var url = Uri.https('www.googleapis.com','/books/v1/volumes',{'q':'{http}'});

    var response = await http.get(url);
    if(response.statusCode == 200){
      print(response.body);
      var jsonResponse = convert.jsonDecode(response.body) as Map<String,dynamic>;
      var itemCount = jsonResponse['totalItems'];
      var titlebook = jsonResponse['items'][0];
      print('Number of books about http: $itemCount');
      print("Titulo $titlebook");
    }

    return "";
  }
}