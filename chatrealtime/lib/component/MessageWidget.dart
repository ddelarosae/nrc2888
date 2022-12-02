import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageWidget extends StatelessWidget {
  final String text;
  final DateTime createdAt;

  const MessageWidget(this.createdAt, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 1, top: 5, right: 1, bottom: 2),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: MaterialButton(
              disabledTextColor: Colors.black,
              padding: const EdgeInsets.only(left: 10),
              onPressed: null,
              child: Wrap(
                children: <Widget>[
                  Row(
                    children: [
                      Text(text),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                DateFormat('kk:ma, dd-MM-yyyy').format(createdAt).toString(),
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          )
        ],
      ),
    );
  }
}
