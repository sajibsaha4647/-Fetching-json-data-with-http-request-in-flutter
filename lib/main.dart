import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'Details.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var ResponData ;
  Future GetresData() async{
    var url = Uri.parse('https://reqres.in/api/users?page=2');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedResponse = convert.jsonDecode(response.body);
      ResponData = decodedResponse['data'];
      print(ResponData.length);
      print('Number of books about http: $ResponData');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.GetresData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("Fetching data api"),),
      body: Container(
          child: Column(
            children: [
                ListView.builder(
                    itemCount: ResponData == null ? 0 : ResponData.length ,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context,i){
                      return ListTile(
                        title: Text(ResponData[i]["first_name"]),
                        subtitle: Text(ResponData[i]["email"]),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(receiveData:ResponData[i])));
                        },
                      );
                    }
                    ),
            ],
          ),
      ),
    ));
  }
}


