import 'package:flutter/material.dart';
class Details extends StatefulWidget {

  var receiveData ;
  Details({ this.receiveData });

  @override
  State<Details> createState() => _DetailsState(receiveData);
}

class _DetailsState extends State<Details> {
  var receiveData;
  _DetailsState(receiveData);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
            body: Container(
              child: CircleAvatar(
                radius: 50,
                child: Image.network(receiveData["avatar"]),
              ),
            ),
    ));
  }
}
