import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:messenger_ui/src/models/list_friend_model.dart';
import 'package:messenger_ui/src/screen/chats/widgets/conversation_item.dart';
import 'package:messenger_ui/src/screen/chats/widgets/search_bar.dart';
import 'package:messenger_ui/src/screen/chats/widgets/stories_list.dart';
import 'package:messenger_ui/src/widgets/messenger_app_bar/messenger_app_bar.dart';

class ListFriend extends StatefulWidget {
  ListFriend({Key key}) : super(key: key);

  _ListFriendState createState() => _ListFriendState();
}

class _ListFriendState extends State<ListFriend> {
  ScrollController _controller;
  bool _isScroll = false;

  _scrollListener() {
    if (_controller.offset > 0) {
      this.setState(() {
        _isScroll = true;
      });
    } else {
      this.setState(() {
        _isScroll = false;
      });
    }
  }

  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowGlow();
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            _buildMessengerAppBar(_isScroll),
            _buildRootListView(),
          ],
        ),
      ),
    );
  }

  _buildMessengerAppBar(_isScroll) {
    return (MessengerAppBar(
      isScroll: _isScroll,
      title: 'Chats',
      actions: <Widget>[
        Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade200,
          ),
          child: Icon(
            FontAwesomeIcons.camera,
            size: 18.0,
          ),
        ),
        Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade200,
          ),
          child: Icon(
            FontAwesomeIcons.pen,
            size: 18.0,
          ),
        ),
      ],
    ));
  }

  _buildRootListView() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 10.0),
        controller: _controller,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildSearchBar();
          } else if (index == 1) {
            return _buildStoriesList();
          } else {
            return ConversationItem(
              friendItem: friendList[index - 2],
            );
          }
        },
        itemCount: friendList.length + 2,
      ),
    );
  }

  _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: SearchBar(),
    );
  }

  _buildStoriesList() {
    return Container(
      height: 100,
      padding: EdgeInsets.only(top: 16.0),
      child: StoriesList(),
    );
  }
}
