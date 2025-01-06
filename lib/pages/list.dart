import 'package:flutter/material.dart';
import 'package:flutter_chat_app/pages/chat.dart';

class ListPage extends StatelessWidget {
  const ListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Chat"),
        centerTitle: false, // This will align the title to the left
        titleSpacing: 0, // This removes the default padding
        leading: Container(), // This removes the default back button space
      ),
      body: ListView(
          children: [
            ListTile(
              onTap:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatPage()));
              },
              leading: CircleAvatar(backgroundImage: AssetImage("person.jpeg")),
              title: Text("Isabella"),
              subtitle: Text("Hai Nathan, apa kabar cintaku???"),
            ),
            ListTile(
              onTap:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatPage()));
              },
              leading: CircleAvatar(backgroundImage: AssetImage("ade.jpeg")),
              title: Text("Ade Muliadi"),
              subtitle: Text("Than free ko?? aku mau curhat sama ko"),
            ),
            ListTile(
              onTap:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatPage()));
              },
              leading: CircleAvatar(backgroundImage: AssetImage("rahma.jpeg")),
              title: Text("Tante Rahma"),
              subtitle: Text("Hai Nathan, nanti malam jadi kan???"),
            ),
            ListTile(
              onTap:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatPage()));
              },
              leading: CircleAvatar(backgroundImage: AssetImage("danen.jpeg")),
              title: Text("Danendra"),
              subtitle: Text("Than yuk nongkrong nanti malam!"),
            ),
            ListTile(
              onTap:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatPage()));
              },
              leading: CircleAvatar(backgroundImage: AssetImage("sesetan.jpeg")),
              title: Text("Tante Sesetan"),
              subtitle: Text("Hai Nathan, tante kangen sama kamu!!!"),
            ),
          ],
        ),
      );   
  }
}