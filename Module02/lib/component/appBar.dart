import 'dart:convert';
import 'package:flutter/material.dart';
import '../component/geolocation/geolocation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_typeahead/flutter_typeahead.dart';
import './geolocation/location.dart';

class AppBarComponent extends StatefulWidget implements PreferredSizeWidget {
  const AppBarComponent(
      {required this.searchText, required this.onChanged, super.key});

  final String searchText;
  final ValueChanged<String> onChanged;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<AppBarComponent> createState() => _AppBarComponentState();
}

Future<http.Response> getCity(String country) {
  return http.get(Uri.parse(
      'https://geocoding-api.open-meteo.com/v1/search?name=$country&count=15'));
}

class _AppBarComponentState extends State<AppBarComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 200,
      width:200,
      // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: <Widget>[
          SizedBox (
            height:100,
            width:100,
          child: TypeAheadField<String>(

            builder: (context, controller, focusNode) {
              return TextField(

                  controller: controller,
                  focusNode: focusNode,
                  autofocus: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'City'));
            },
            itemBuilder: (BuildContext context,String value) {
              return  ListTile(
                title: Text(value),
                subtitle: Text(value),
              );
            },
            onSelected: (Object? value) {
              // getCity(value).then((res) => debugPrint(res.body));
            },
            suggestionsCallback: (String search) async {
              var res = await getCity(search);
               var test = json.decode(res.body);
              debugPrint("--------------------------");
              // debugPrint(test);
              return res.body.split(":");
            },
          )
          ),
          Expanded(
              flex: 3,
              child: TextField(
                onSubmitted: (String value) {
                  widget.onChanged(value);
                },
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    filled: true,
                    labelText: 'search',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    icon: Icon(Icons.search)),
              )),
          Expanded(
              child: IconButton(
            icon: const Icon(Icons.map),
            onPressed: () => {
              determinePosition().then((result) {
                setState(() {
                  widget.onChanged("${result.longitude} ${result.latitude}");
                });
              }).catchError((error) {
                setState(() {
                  debugPrint(error.toString());
                  widget.onChanged(error.toString());
                });
              }),
            },
            iconSize: 50,
          )),
        ],
      ),
    );
  }
}
