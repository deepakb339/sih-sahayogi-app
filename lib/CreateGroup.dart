import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:date_format/date_format.dart';

class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class Date {
  int id;
  String name;

  Date(this.id, this.name);

  static List<Date> getDates() {
    return <Date>[
      Date(0, 'Select Date:'),
      Date(1, '1'),
      Date(2, '2'),
      Date(3, '3'),
      Date(4, '4'),
      Date(5, '5'),
      Date(6, '6'),
      Date(7, '7'),
      Date(8, '8'),
      Date(9, '9'),
      Date(10, '10'),
      Date(11, '11'),
      Date(12, '12'),
      Date(13, '13'),
      Date(14, '14'),
      Date(15, '15'),
      Date(16, '16'),
      Date(17, '17'),
      Date(18, '18'),
      Date(19, '19'),
      Date(20, '20'),
      Date(21, '21'),
      Date(22, '22'),
      Date(23, '23'),
      Date(24, '24'),
      Date(25, '25'),
      Date(26, '26'),
      Date(27, '27'),
      Date(28, '28'),
    ];
  }
}

class _CreateGroupState extends State<CreateGroup> {
  String gname, contributionAmt, interest, contPenalty, loanPenalty;
  String contributionDate, sDate;
  //var format = DateFormat.yMd();
  var finaldate = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);

  void callDatePicker() async {
    var order = await getDate();
    setState(() {
      finaldate = formatDate(order, [yyyy, '-', mm, '-', dd]);
      sDate = finaldate.toString();
    });
  }

  Future<DateTime> getDate() {
    // Imagine that this function is
    // more complex and slow.
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
  }

  List<Date> _dates = Date.getDates();
  List<DropdownMenuItem<Date>> _dropdownMenuItems;
  Date _selectedDate;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_dates);
    _selectedDate = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Date>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Date>> items = List();
    for (Date date in companies) {
      items.add(
        DropdownMenuItem(
          value: date,
          child: Text(date.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Date selectedDate) {
    setState(() {
      _selectedDate = selectedDate;
      contributionDate = selectedDate.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('SHG'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/logo.png"),
                    width: 100.0,
                    height: 100.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    onChanged: (text) {
                      gname = text;
                    },
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: 'Enter Group Name',
                        prefixIcon: Icon(Icons.group),
                        labelText: 'Group Name:',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                      child: Row(children: <Widget>[
                    Text('Group Start Date:'),
                    SizedBox(width: 90.0),
                    MaterialButton(
                      onPressed: callDatePicker,
                      color: Colors.white,
                      child: new Text(finaldate,
                          style: TextStyle(color: Colors.black)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(
                            color: Colors.grey,
                            width: 1,
                            style: BorderStyle.solid),
                      ),
                    ),
                  ])),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    onChanged: (text) {
                      contributionAmt = text;
                    },
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: 'Monthly Per Member Contribution Amount',
                        prefixIcon: Icon(Icons.monetization_on),
                        labelText: 'Contribution Amount:',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Monthly Contribution Date:',
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 300.0,
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton(
                          value: _selectedDate,
                          items: _dropdownMenuItems,
                          onChanged: onChangeDropdownItem,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    onChanged: (text) {
                      interest = text;
                    },
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: 'Monthly Loan Interest Rate In %',
                        prefixIcon: Icon(Icons.attach_money),
                        labelText: 'Interest Rate:',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    onChanged: (text) {
                      contPenalty = text;
                    },
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: 'Contribution Delay Penalty Amount',
                        prefixIcon: Icon(Icons.money_off),
                        labelText: 'Contribution Delay Penalty Amount:',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    onChanged: (text) {
                      loanPenalty = text;
                    },
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: 'Loan Installment Delay Penalty Amount',
                        prefixIcon: Icon(Icons.money_off),
                        labelText: 'Loan Installment Delay Penalty Amount:',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ButtonTheme(
                    height: 40.0,
                    minWidth: 200.0,
                    child: RaisedButton(
                      onPressed: _sendToNextScreen,
                      color: Colors.green,
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _sendToNextScreen() {
    // if (_key.currentState.validate()) {
    //   //saves to global key
    //   _key.currentState.save();
    //send to next screen
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                gname: gname,
                sDate: sDate,
                contributionAmt: contributionAmt,
                contributionDate: contributionDate,
                interest: interest,
                contPenalty: contPenalty,
                loanPenalty: loanPenalty)));
    //   } else {
    //     setState(() {
    //       _autovalidate = true;
    //     });
    //   }
  }
}
