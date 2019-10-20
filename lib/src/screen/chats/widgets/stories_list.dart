import 'package:flutter/material.dart';
import 'package:messenger_ui/src/models/list_friend_model.dart';

class StoriesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StoriesListState();
  }
}

class _StoriesListState extends State<StoriesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        if (index == 0) {
          return AddToYourStoryButton();
        } else {
          return StoryListItem(
              friendItem: friendList[index], friendIndex: index);
        }
      },
      itemCount: friendList.length,
    );
  }
}

class StoryListItem extends StatefulWidget {
  final ListFriendModel friendItem;
  final int friendIndex;
  StoryListItem({this.friendItem, this.friendIndex});

  @override
  State<StatefulWidget> createState() {
    return _StoryListItemState();
  }
}

class _StoryListItemState extends State<StoryListItem> {
  _buildBorder() {
    if (widget.friendItem.isActive) {
      return Border.all(color: Colors.grey.shade300, width: 3);
    } else {
      return Border.all(color: Colors.blue, width: 3);
    }
  }

  _getTextStyle() {
    if (widget.friendItem.isActive) {
      return _viewedStoryListItemTextStyle();
    } else {
      return _notViewedStoryListItemTextStyle();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 60.0,
                width: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: _buildBorder(),
                ),
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  margin: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    image: DecorationImage(
                      image: AssetImage(widget.friendItem.imageAvatarUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                width: 60.0,
                child: Text(
                  widget.friendItem.name,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: _getTextStyle(),
                ),
              ),
            ],
          ),
          SizedBox(width: 12.0)
        ],
      ),
    );
  }
}

class AddToYourStoryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        children: <Widget>[
          Column(
            children: [
              Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade200,
                    // borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: Icon(
                    Icons.add,
                    size: 35.0,
                  )),
              SizedBox(height: 8.0),
              Text('Your story', style: _viewedStoryListItemTextStyle()),
            ],
          ),
          SizedBox(width: 12.0)
        ],
      ),
    );
  }
}

_notViewedStoryListItemTextStyle() {
  return TextStyle(
      fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold);
}

_viewedStoryListItemTextStyle() {
  return TextStyle(fontSize: 12, color: Colors.grey);
}
