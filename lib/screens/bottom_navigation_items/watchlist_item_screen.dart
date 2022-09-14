import 'package:flutter/material.dart';
class WatchList extends StatefulWidget {
  const WatchList({Key? key}) : super(key: key);

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Text('Upcoming Movies'),
          SizedBox(height: 10,),
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Row(
                children: [
                  Container(
                    height: 200,
                    width: 180,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Image.network('src',fit: BoxFit.cover,),
                  ),
                 Flexible(
                   child: Container(
                     margin: EdgeInsets.only(left: 10),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text('The Namee off the fucking movies',overflow: TextOverflow.ellipsis,maxLines: 3,),
                       SizedBox(height: 10,),
                       Text('Star'),
                       SizedBox(height: 10,),
                       Text('type of the movie'),
                         TextButton.icon(onPressed: (){},label: Text('Delete',style: TextStyle(color: Colors.red),),icon: Icon(Icons.delete,color: Colors.red,),)
                     ],),
                   ),
                 ),



                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
