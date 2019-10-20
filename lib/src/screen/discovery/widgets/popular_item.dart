import 'package:flutter/material.dart';
import 'package:messenger_ui/src/models/popular_list.dart';

class PopularItem extends StatefulWidget {
  final Popular popularItem;
  PopularItem({Key key, this.popularItem}) : super(key: key);

  _PopularItemState createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: <Widget>[
          _buildConversationImage(),
          _buildTitleAndLatestMessage(),
        ],
      ),
    );
  }

  _buildTitleAndLatestMessage() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildConverastionTitle(),
            SizedBox(height: 2),
            _buildTextContent(widget.popularItem.note),
            SizedBox(height: 2),
            _buildTextContent(widget.popularItem.description),
          ],
        ),
      ),
    );
  }

  _buildConverastionTitle() {
    return Container(
      width: double.infinity,
      child: Text(
        widget.popularItem.title,
        style: TextStyle(
            fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  _buildTextContent(content) {
    return Container(
      width: double.infinity,
      child: Text(
        content,
        style: TextStyle(color: Colors.grey.shade700, fontSize: 14.0),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  _buildConversationImage() {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.0),
        image: DecorationImage(
          image: AssetImage(widget.popularItem.imgUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
