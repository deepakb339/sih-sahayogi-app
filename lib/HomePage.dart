import 'package:flutter/material.dart';
import 'package:shg/CreateGroup.dart';
import 'package:shg/GroupPage.dart';
import 'package:shg/models/message_model.dart';

class HomePage extends StatefulWidget {
  String gname = 'd',
      sDate = 'd',
      contributionAmt = 'd',
      contributionDate = 'd',
      interest = 'd',
      contPenalty = 'd',
      loanPenalty = 'd';
  HomePage(
      {Key key,
      this.gname,
      this.sDate,
      this.contributionAmt,
      this.contributionDate,
      this.interest,
      this.contPenalty,
      this.loanPenalty})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(gname, sDate, contributionAmt,
      contributionDate, interest, contPenalty, loanPenalty);
}

class _HomePageState extends State<HomePage> {
  String gname = 'd',
      sDate = 'd',
      contributionAmt = 'd',
      contributionDate = 'd',
      interest = 'd',
      contPenalty = 'd',
      loanPenalty = 'd';
  _HomePageState(this.gname, this.sDate, this.contributionAmt,
      this.contributionDate, this.interest, this.contPenalty, this.loanPenalty);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SHG'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
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
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
          final Message chat = chats[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => GroupPage(
                  user: chat.sender,
                ),
              ),
            ),
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
                            borderRadius: BorderRadius.all(Radius.circular(40)),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                chat.sender.isOnline
                                    ? Container(
                                        margin: const EdgeInsets.only(left: 5),
                                        width: 7,
                                        height: 7,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      )
                                    : Container(
                                        child: null,
                                      ),
                              ],
                            ),
                            Text(
                              chat.time,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w300,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            chat.text,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
}
