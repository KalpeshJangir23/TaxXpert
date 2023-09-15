import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  final List message;
  const MessageScreen({super.key, required this.message});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return ListView.separated(
        itemBuilder: ((context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: widget.message[index]['isUserMessage']
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                            20,
                          ),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(
                              widget.message[index]['isUserMessage'] ? 0 : 20),
                          topLeft: Radius.circular(
                              widget.message[index]['isUserMessage'] ? 20 : 0),
                        ),
                        color: widget.message[index]['isUserMessage']
                            ? Colors.grey.shade800
                            : Colors.grey.shade900.withOpacity(0.8)),
                    constraints: BoxConstraints(maxWidth: w * 2 / 3),
                    child: Text(widget.message[index]['message'].text.text[0])),
              ],
            ),
          );
        }),
        separatorBuilder: (_, i) =>
            Padding(padding: const EdgeInsets.only(top: 10)),
        itemCount: widget.message.length);
  }
}
