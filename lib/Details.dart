import 'package:flutter/material.dart';
class Details extends StatefulWidget {


  var receiveData ;
  Details({ this.receiveData });

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  @override
  void initState() {
    print(widget.receiveData.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
            body: Container(
              child: CircleAvatar(
                radius: 50,
                child: Image.network(widget.receiveData["avatar"]),
              ),
            ),
    ));
  }
}
