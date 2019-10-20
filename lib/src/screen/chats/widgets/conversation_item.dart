import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:messenger_ui/src/models/list_friend_model.dart';
import 'package:messenger_ui/src/screen/chat_detail/chat_detail.dart';

class ConversationItem extends StatefulWidget {
  final ListFriendModel friendItem;
  final String dateFormat;
  ConversationItem({Key key, this.friendItem, this.dateFormat})
      : super(key: key);

  _ConversationItemState createState() => _ConversationItemState();
}

class _ConversationItemState extends State<ConversationItem> {
  @override
  Widget build(BuildContext context) {
    // print(widget.friendItem.imageAvatarUrl);
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetail(friendItem: widget.friendItem),
          ),
        ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.15,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                _buildConversationImage(),
                _buildTitleAndLatestMessage(),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: SlideAction(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: SlideAction(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.phone,
                  color: Colors.black,
                  size: 20.0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 16.0),
              child: SlideAction(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.videocam,
                  color: Colors.black,
                  size: 20.0,
                ),
              ),
            ),
          ],
          secondaryActions: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: SlideAction(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 20.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: SlideAction(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.notifications,
                  color: Colors.black,
                  size: 20.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: SlideAction(
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.restore_from_trash,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
            ),
          ],
        ),
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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildLatestMessage(),
                  _buildTimeOfLatestMessage()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildConverastionTitle() {
    return Text(
      widget.friendItem.name,
      style: TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
    );
  }

  _buildLatestMessage() {
    return Container(
      width: 150.0,
      child: Text(
        widget.friendItem.shortDescription,
        style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  _buildTimeOfLatestMessage() {
    return Text('1:21PM',
        style: TextStyle(color: Colors.grey.shade700, fontSize: 11));
  }

  _buildConversationImage() {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        image: DecorationImage(
          image: AssetImage(widget.friendItem.imageAvatarUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
