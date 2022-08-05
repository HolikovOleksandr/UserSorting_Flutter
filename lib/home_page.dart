// ignore_for_file: library_private_types_in_public_api, unused_field, sized_box_for_whitespace, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:searcheble_list/models/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> _foundedUsers = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      _foundedUsers = users;
    });
  }

  onSearch(String search) {
    setState(() {
      _foundedUsers = users
          .where(
              (user) => user.name.toLowerCase().contains(search.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        title: Container(
          height: 44,
          child: TextField(
            style: TextStyle(color: Colors.white),
            onChanged: ((value) => onSearch(value)),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade800,
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey.shade500,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50),
              ),
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
              hintText: 'Search users',
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.grey.shade900,
        child: ListView.builder(
            itemCount: _foundedUsers.length,
            itemBuilder: (context, index) {
              return userComponent(user: _foundedUsers[index]);
            }),
      ),
    );
  }

  userComponent({required user}) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(user.image),
                ),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[500],
                    ),
                  ),
                  Text(
                    user.userName,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                user.isFollowedByMe = !user.isFollowedByMe;
              });
            },
            child: AnimatedContainer(
              height: 35,
              width: 110,
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color:
                    user.isFollowedByMe ? Color(0xFF5E35B1) : Color(0x00FFFFFF),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: user.isFollowedByMe
                      ? Color(0x00000000)
                      : Color(0xFFFFFFFF),
                ),
              ),
              child: Center(
                child: Text(
                  user.isFollowedByMe ? 'Unfollow' : 'Follow',
                  style: TextStyle(
                    color: user.isFollowedByMe
                        ? Color(0xFFFFFFFF)
                        : Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
