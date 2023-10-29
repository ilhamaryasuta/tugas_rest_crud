import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class NewData extends StatefulWidget {
  const NewData({Key? key}) : super(key: key);
  @override
  State<NewData> createState() => _NewDataState();
}

class _NewDataState extends State<NewData> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  void addData() {
    var url = Uri.parse('http://localhost/restapi/create.php'); //Inserting Api Calling
    http.post(url, body: {
      "title": title.text,
      "content": content.text
    }); // parameter passed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Add New Blog"),
        ),
        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: title,
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Title',
                hintText: 'Enter Title',
                prefixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.title),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              maxLines: 5,
              controller: content,
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Content',
                hintText: 'Enter Content',
                prefixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.text_snippet_outlined),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: MaterialButton(
              color: Colors.amber,
              onPressed: () {
                addData();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => const Home()),
                );
              },
              child: const Text("Add Data"),
            ),
          ),
        ],
      ),
    );
  }
}
