import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/FileTracking/Create_file/create_file.dart';
import 'package:fusion/screens/FileTracking/View_drafts/view_drafts.dart';
import 'package:fusion/screens/FileTracking/View_inbox/view_inbox.dart';
import 'package:fusion/screens/FileTracking/View_outbox/view_outbox.dart';
import 'package:fusion/screens/FileTracking/Track_file/track_file.dart';

class RoundedListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Column(
        children: [
          // User profile view with enlarged photo and name/ID below
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Enlarged photo with rounded corners
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0), // Adjust corner radius as desired
                  child: FadeInImage(
                    placeholder: AssetImage('assets/placeholder.png'), // Placeholder image
                    image: NetworkImage("https://picsum.photos/id/237/200/300"), // Actual image
                    fit: BoxFit.cover,
                    width: 100.0, // Set width
                    height: 120.0, // Set height
                  ),
                ),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rohit Sharma",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      "21BCS329",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Divider
          Divider(thickness: 1.0, color: Colors.grey[300]),

          // Rounded list view
          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              final items = ['Create File', 'Drafts', 'Track File', 'Outbox', 'Inbox'];
              final paths = [
                '/create_file',
                '/view_drafts',
                '/track_file',
                '/view_outbox',
                '/view_inbox',
              ];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffCC7231),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          items[index],
                        ),
                        IconButton(
                          icon: Icon(Icons.chevron_right),
                          onPressed: () {
                            switch (paths[index]) {
                              case '/create_file':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => CreateFilePage()),
                                );
                                break;
                              case '/view_drafts':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DraftsPage()),
                                );
                                break;
                              case '/view_inbox':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => InboxPage()),
                                );
                                break;
                              case '/track_file':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => FileTrackingPage()),
                                );
                                break;
                              case '/view_outbox':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => OutboxPage()),
                                );
                                break;
                            }
                          },
                        ), // Icon color white
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
