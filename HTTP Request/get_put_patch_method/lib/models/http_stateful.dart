import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpStateful {
  String? id, fullname, email, avatar;

  HttpStateful({this.id, this.fullname, this.email, this.avatar});

  static Future<HttpStateful> connectAPI(String id) async {
    Uri url = Uri.parse("https://reqres.in/api/users/" + id);

    var hasilResponse = await http.get(url);

    //* Get response semua data
    // var data = json.decode(hasilResponse.body);

    //* Get hanya beberapa data
    var data = (json.decode(hasilResponse.body))['data'];

    print(data);

    return HttpStateful(
      //* memakai to string karna data asalnya dikembalikan dalam bentuk int
      id: data['id'].toString(),
      fullname: data['first_name'] + " " + data['last_name'],
      email: data['email'],
      avatar: data['avatar'],
    );
  }
}
