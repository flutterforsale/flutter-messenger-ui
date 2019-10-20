import 'package:flutter/material.dart';
import 'package:messenger_ui/src/models/list_friend_model.dart';
import 'package:messenger_ui/src/models/popular_list.dart';

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
        return StoryListItem(
            popularItem: popularList[index], popularIndex: index);
      },
      itemCount: popularList.length,
    );
  }
}

class StoryListItem extends StatefulWidget {
  final Popular popularItem;
  final int popularIndex;
  StoryListItem({this.popularItem, this.popularIndex});

  @override
  State<StatefulWidget> createState() {
    return _StoryListItemState();
  }
}

class _StoryListItemState extends State<StoryListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.popularIndex == 0
          ? EdgeInsets.only(left: 16.0)
          : EdgeInsets.only(right: 0.0),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  image: DecorationImage(
                    image: AssetImage(widget.popularItem.imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                width: 60.0,
                child: Text(
                  widget.popularItem.title,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
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
