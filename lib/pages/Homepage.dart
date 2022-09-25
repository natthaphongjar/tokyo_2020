import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var r = 0;
  var rwin = false;
  var bwin = false;
  var redtotal = 0;
  var bluetotal = 0;
  var redround =[0,0,0,0,0];
  var blueround = [0,0,0,0,0];

  void click(int num) {
    setState(() {
      if (num == 1) {
        redround[r]= 10;
        blueround[r] = 9;
      } else if (num == 2) {
        redround[r]= 9;
        blueround[r] = 10;
      } else {
        r = 0;
        rwin = false;
        bwin = false;
        redtotal = 0;
        bluetotal = 0;
        redround = [0,0,0,0,0];
        blueround = [0,0,0,0,0];
        return;
      }

      redtotal += redround[r];
      bluetotal += blueround[r];
      r++;
      if (r >= 3) {
        check();
      }
    });
  }

  void check() {
    setState(() {
      redtotal > bluetotal ? rwin = true : bwin = true;
    });
  }

  Widget round(var round,int index) {
    return round == "TOTAL"
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  Center(
                    child: Text('$round'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '$redtotal',
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        '$bluetotal',
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  ),
                  line()
                ],
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  Center(
                    child: Text('$round'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${redround[index]}',
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        '${blueround[index]}',
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  ),
                  line()
                ],
              ),
            ),
          );
  }

  Widget Button(bool t) {
    Widget a;
    t
        ? a = Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                    height: 32,
                    child: ElevatedButton(
                        onPressed: () => click(3),
                        style: ElevatedButton.styleFrom(primary: Colors.black),
                        child: Icon(Icons.clear))),
              )),
            ],
          )
        : a = Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                      height: 32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0)),
                      child: ElevatedButton(
                        onPressed: () => click(1),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFFA00000)),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                    height: 32,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4.0)),
                    child: ElevatedButton(
                        onPressed: () => click(2),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF0000A0),
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ))),
              ))
            ],
          );
    return a;
  }

  Widget proflie(int num) {
    Widget logo;
    Widget text1;
    Widget text2;
    if (num == 1) {
      logo = Image.asset(
        'assets/flag_ireland.png',
        height: 48,
        width: 48,
      );
      text1 = Text('IRELAND');
      text2 = Text('HARRINGTON Kellie Anne');
    } else {
      logo = Image.asset(
        'assets/flag_thailand.png',
        height: 48,
        width: 48,
      );
      text1 = Text('THAILAND');
      text2 = Text('SEESONDEE Sudaporn');
    }
    return Column(
      children: [

        Row(children: [
          logo,
          SizedBox(
            width: 8,
          ),
          text1
        ]),
        text2,
      ],

    );
  }

  Widget line() {
    return Row(
      children: [
        Expanded(
            child: Container(
          color: Colors.grey,
          height: 2,
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "OLYMPIC BOXING SCORING",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Color(0xFFA00000),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/logo.png',
                    height: 80,
                  ),
                ),
                Container(
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Women's Light(57-60kg) Semi-final",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Color(0xFFA00000),
                          size: 100,
                        ),
                        proflie(1),
                      ],
                    ),
                    rwin ? Icon(Icons.check,size: 40,color: Colors.green,) : Container()
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Color(0xFF0000A0),
                          size: 100,
                        ),
                        proflie(2),
                      ],
                    ),
                    bwin ? Icon(Icons.check,size: 40,color: Colors.green,) : Container()
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      color: Color(0xFFA00000),
                      height: 10,
                    )),
                    Expanded(
                        child: Container(color: Color(0xFF0000A0), height: 10))
                  ],
                ),
                r >= 1
                    ? round(
                        "Round 1",0
                      )
                    : SizedBox(
                        height: 72,
                      ),
                r >= 2
                    ? round(
                        "Round 2",1
                      )
                    : SizedBox(
                        height: 72,
                      ),
                r >= 3
                    ? round(
                        "Round 3",2
                      )
                    : SizedBox(
                        height: 72,
                      ),
                r >= 3
                    ? round(
                        "TOTAL",3
                      )
                    : SizedBox(
                        height: 72,
                      ),
              ],
            ),
          ),
          r >= 3 ? Button(true) : Button(false),
        ],
      ),
    );
  }
}
