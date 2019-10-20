import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:messenger_ui/src/models/account_user.dart';
import 'package:messenger_ui/src/routes/routes.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  _ProfileState createState() => _ProfileState();
}

const ListYourFriendChat = ['Hello', 'Nice to meet you!'];
const ListYourChat = ['Hi', 'Nice to meet you!'];

class _ProfileState extends State<Profile> {
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
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
        },
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: <Widget>[
              _buildAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  controller: _controller,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Center(
                        child: Container(
                          width: 160.0,
                          height: 160.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80.0),
                            image: DecorationImage(
                              image: AssetImage(yourAccount.avatarImg),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Center(
                        child: Text(
                          'fb.com/hungdalat',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildTitleSetting('Account'),
                      _buildSettingItem('Username', '@hungdalat', true),
                      _buildSettingItem('Gender', 'Male', true),
                      _buildSettingItem(
                          'Email', 'flutterforsale@gmail.com', false),
                      _buildTitleSetting('Setting'),
                      _buildSettingItem('Notification', '', true),
                      _buildSettingItem('Privacy and Security', '', true),
                      _buildSettingItem('Language', '', true),
                      _buildSettingItem('Chat Settings', '', true),
                      _buildSettingItem('Help', '', false),
                      SizedBox(height: 16.0)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildAppBar() {
    return Container(
      height: 90.0,
      padding: EdgeInsets.only(right: 12.0, top: 16.0),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: _isScroll ? Colors.black12 : Colors.white,
          offset: Offset(0.0, 1.0),
          blurRadius: 10.0,
        ),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: InkWell(
                  onTap: () {
                    Routes.goBack(context);
                  },
                  child: Icon(
                    FontAwesomeIcons.arrowLeft,
                    size: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Container(
                child: Text(
                  'Profile',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Icon(
                    FontAwesomeIcons.camera,
                    color: Colors.black,
                    size: 20.0,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Icon(
                    FontAwesomeIcons.solidEdit,
                    color: Colors.black,
                    size: 20.0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildTitleSetting(title) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 10.0,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border(
            top: BorderSide(width: 0.5, color: Colors.grey.shade300),
            bottom: BorderSide(width: 0.5, color: Colors.grey.shade300),
          )),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
      ),
    );
  }

  _buildSettingItem(title, subtitle, isBorderBottom) {
    return Container(
      margin: EdgeInsets.only(left: 16.0),
      padding: EdgeInsets.only(
        top: 12.0,
        bottom: 12.0,
        right: 10.0,
      ),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
          width: isBorderBottom ? 0.5 : 0.0,
          color: isBorderBottom ? Colors.grey.shade300 : Colors.transparent,
        ),
      )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 15.0,
                ),
              ),
              SizedBox(width: 10.0),
              Icon(
                FontAwesomeIcons.chevronRight,
                color: Colors.grey.shade500,
                size: 18.0,
              )
            ],
          )
        ],
      ),
    );
  }
}
