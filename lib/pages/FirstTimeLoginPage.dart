import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shg/CreateGroup.dart';
import 'package:shg/GroupPage.dart';
import 'package:shg/HomePage.dart';
import 'package:shg/models/message_model.dart';

class FisrtTimeLoginPage extends StatefulWidget {
  final String name;
  FisrtTimeLoginPage(this.name);
  @override
  _FisrtTimeLoginPageState createState() => _FisrtTimeLoginPageState();
}

class _FisrtTimeLoginPageState extends State<FisrtTimeLoginPage> {
  String gname = 'd',
      sDate = 'd',
      contributionAmt = 'd',
      contributionDate = 'd',
      interest = 'd',
      contPenalty = 'd',
      loanPenalty = 'd';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SHG'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Deepak'),
              accountEmail: Text('deepak@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('DB'),
              ),
            ),
            ListTile(
              title: Text('Call Us'),
              leading: Icon(Icons.call),
            ),
            ListTile(
                title: Text('Share'),
                leading: Icon(Icons.book),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GroupPage()),
                    )),
            ListTile(
              title: Text('Contact'),
              leading: Icon(Icons.contacts),
            ),
            Divider(),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
            ),
            ListTile(
              title: Text('Sign Out'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                // Navigator.of(context).pushReplacementNamed('signin');
              },
            ),
            ListTile(
              title: Text('Close'),
              leading: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Welcome ' +
                                widget.name +
                                ', we see this is the first time you have logged in!',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(text: '\n\n'),
                        TextSpan(
                            text: 'Here is a list of all SHGs near you!',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            )),
                        TextSpan(text: '\n'),
                        TextSpan(
                            text:
                                'You can send request join by tapping any of the group below',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ))
                      ])),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: chats.length,
              itemBuilder: (BuildContext context, int index) {
                final Message chat = chats[index];
                String name = chat.sender.name;
                return GestureDetector(
                  onTap: () => _showMyDialog(name),
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => GroupPage(
                  //       user: chat.sender,
                  //     ),
                  //   ),
                  // ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: chat.unread
                              ? BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  border: Border.all(
                                    width: 2,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  // shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                    ),
                                  ],
                                )
                              : BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(chat.sender.imageUrl),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          padding: EdgeInsets.only(
                            left: 20,
                          ),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        chat.sender.name,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // chat.sender.isOnline
                                      //     ? Container(
                                      //         margin: const EdgeInsets.only(
                                      //             left: 5),
                                      //         width: 7,
                                      //         height: 7,
                                      //         decoration: BoxDecoration(
                                      //           shape: BoxShape.circle,
                                      //           color: Theme.of(context)
                                      //               .primaryColor,
                                      //         ),
                                      //       )
                                      //     : Container(
                                      //         child: null,
                                      //       ),
                                    ],
                                  ),
                                  // Text(
                                  //   chat.time,
                                  //   style: TextStyle(
                                  //     fontSize: 11,
                                  //     fontWeight: FontWeight.w300,
                                  //     color: Colors.black54,
                                  //   ),
                                  // ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              // Container(
                              //   alignment: Alignment.topLeft,
                              //   child: Text(
                              //     chat.text,
                              //     style: TextStyle(
                              //       fontSize: 13,
                              //       color: Colors.black54,
                              //     ),
                              //     overflow: TextOverflow.ellipsis,
                              //     maxLines: 2,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('CREATE GROUP'),
        icon: Icon(Icons.add),
        onPressed: _sendToCreateGroup,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _sendToCreateGroup() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateGroup()),
    );
  }

  Future<void> _showMyDialog(String name) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(name),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a SHG Group nearby you.'),
                Text(
                    'Would you like to send join request to the group leader of this group?'),
              ],
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Join'),
              onPressed: () async {
                _showToast();
                await new Future.delayed(const Duration(seconds: 2));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _showToast() {
    Fluttertoast.showToast(
        msg: "Join Request Sent Successfuly",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
