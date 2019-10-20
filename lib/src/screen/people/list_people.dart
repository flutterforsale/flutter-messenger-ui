import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:messenger_ui/src/models/list_friend_model.dart';
import 'package:messenger_ui/src/screen/people/widgets/people_card.dart';
import 'package:messenger_ui/src/widgets/messenger_app_bar/messenger_app_bar.dart';

class ListPeople extends StatefulWidget {
  ListPeople({Key key}) : super(key: key);

  _ListFriendState createState() => _ListFriendState();
}

class _ListFriendState extends State<ListPeople> {
  bool _isScroll = false;
  ScrollController _controller;

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
        color: Colors.white,
        child: Column(
          children: <Widget>[
            MessengerAppBar(
              isScroll: _isScroll,
              title: 'People',
              actions: <Widget>[
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade200,
                  ),
                  child: Icon(
                    FontAwesomeIcons.solidAddressBook,
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
                    FontAwesomeIcons.userPlus,
                    size: 18.0,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: GridView.builder(
                  padding: EdgeInsets.only(top: 10.0),
                  controller: _controller,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.5),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return PeopleCard(
                        peopleItem: friendList[index], indexItem: index);
                  },
                  itemCount: friendList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
