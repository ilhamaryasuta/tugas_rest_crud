import 'package:flutter/material.dart';
import 'main.dart';
import 'package:http/http.dart' as http;

class Edit extends StatefulWidget {
  List list;
  int index;
  Edit({Key? key, required this.list, required this.index}) : super(key: key);
  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  late TextEditingController title;
  late TextEditingController content;
  void editData() {
    var url = Uri.parse('http://localhost/restapi/update.php'); //update api calling
    http.post(url, body: {
      'id': widget.list[widget.index]['id'],
      'title': title.text,
      'content': content.text
    });
  }

  @override
  void initState() {
    title = TextEditingController(text: widget.list[widget.index]['title']); //setting up the existing values in textediting control
    content = TextEditingController(text: widget.list[widget.index]['content']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Edit Data ${widget.list[widget.index]['title']}"),
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
                editData();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => const Home()),
                );
              },
              child: const Text("Edit Data"),
            ),
          ),
        ],
      ),
    );
  }
}
