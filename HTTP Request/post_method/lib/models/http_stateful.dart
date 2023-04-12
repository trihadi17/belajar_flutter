//* Package json convert
import 'dart:convert';

//* import package http
import 'package:http/http.dart' as http;

class HttpStateful {
  //* Variable
  String? id, name, job, createdAt;

  //* Constructor menggunakan named parameter (urutan bebas)
  HttpStateful({this.id, this.name, this.job, this.createdAt});

  //* membuat method connect API (asynchronous)
  static Future<HttpStateful> connectApi(String name, String job) async {
    //* Parse data url (get data dari url)
    Uri url = Uri.parse("https://reqres.in/api/users");

    //* hasil response (aysnchronous)
    var hasilResponse = await http.post(url, body: {"name": name, "job": job});

    //* decode hasil response to JSON
    var data = json.decode(hasilResponse.body);

    //* response
    return HttpStateful(
        id: data["id"],
        name: data["name"],
        job: data["job"],
        createdAt: data["createdAt"]);
  }
}
