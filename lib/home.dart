import 'package:books_app_zypher/pageView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DataMethods.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getData();
  }
  void getData() async {
    await fetchData();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    var _total = dataList.length;
    var listView = ListView.builder(
      itemCount: _total,
        itemBuilder: (BuildContext context,int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DataPage(data:dataList[index],ind: 0)
              )
            );
          },
          child: new DataTile(
              name: dataList[index].name,
              company: dataList[index].company
          ),
        );
        },
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text("ListExample"),
      ),
      body: listView,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PageViewScreen()
              )
          );
        },
        child: Icon(Icons.view_carousel),
      ),
    );
  }
}

class DataTile extends StatelessWidget {
  final String name,company;
  DataTile({Key? key,required this.name,required this.company}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 2,),
          Text(
              company,
            style: TextStyle(
              fontSize: 15
            ),
          ),
          Divider(thickness: 1.2,)
        ],
      ),
    );
  }
}

class DataPage extends StatelessWidget {
  DataFormat data;
  int ind;
  DataPage({Key? key,required this.data,required this.ind}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${data.name}'s Details Page"
        ),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "Id : ${data.id}",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Container(
                  child: Text(
                    "Order Id : ${data.orderId}",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
              ),
              SizedBox(height: 8,),
              Container(
                  child: Text(
                    "Name : ${data.name}",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
              ),
              SizedBox(height: 8,),
              Container(
                  child: Text(
                      "Company : ${data.company}",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
              ),
              SizedBox(height: 8,),
              Container(
                  child: Text(
                      "Invoice Pending : ${data.invoidePending}",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
              ),
              SizedBox(height: 8,),
              Container(
                  child: Text(
                    "Invoice Paid : ${data.invoicepaid}",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
              ),
              SizedBox(height: 100,),
              (ind==1)?
              Container(
                child: Text("Swipe Right/Left ",style: TextStyle(fontSize: 18),),
              ):
              Container()
            ],
          ),
        ),
      ),
    );
  }
}


