import 'package:NotesApp/screens/edit_notes/Veiw/edit_notes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'item_gride_view.dart';

class DynamicGrideView extends StatefulWidget {
  final bool isNewFirst;
  final String searchQuery;

  const DynamicGrideView({
    Key? key,
    required this.isNewFirst,
    required this.searchQuery,
  }) : super(key: key);

  @override
  _DynamicGrideViewState createState() => _DynamicGrideViewState();
}

class _DynamicGrideViewState extends State<DynamicGrideView> {
  late bool _isNewFirst;
  late String _searchQuery;

  @override
  void initState() {
    super.initState();
    _isNewFirst = widget.isNewFirst;
    _searchQuery = widget.searchQuery;
  }

  @override
  void didUpdateWidget(covariant DynamicGrideView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.searchQuery != oldWidget.searchQuery) {
      setState(() {
        _searchQuery = widget.searchQuery;
      });
    }
    if (widget.isNewFirst != oldWidget.isNewFirst) {
      setState(() {
        _isNewFirst = widget.isNewFirst;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const Center(child: Text('User not logged in.'));
    }

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('notes')
          .where('userId', isEqualTo: user.uid)
          .where('title', isGreaterThanOrEqualTo: _searchQuery)
          .where('title', isLessThanOrEqualTo: '$_searchQuery\uf8ff')
          .orderBy('date', descending: _isNewFirst)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No notes available.'));
        }

        final items = snapshot.data!.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          final timestamp = data['date'] as Timestamp?;
          final date = timestamp != null
              ? DateFormat('yyyy-MM-dd').format(timestamp.toDate())
              : 'Unknown date';

          final colorValue = data['color'] as int?;
          final color = colorValue != null ? Color(colorValue) : Colors.white;

          return {
            'id': doc.id,
            'title': data['title'] ?? '',
            'description': data['content'] ?? '',
            'date': date,
            'color': color,
          };
        }).toList();

        return DynamicHeightGridView(
          shrinkWrap: true,
          itemCount: items.length,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          builder: (context, index) {
            final item = items[index];
            return ItemGridView(
              title: item['title']!,
              description: item['description']!,
              date: item['date']!,
              color: item['color']!,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditNotes(
                      noteId: item['id']!,
                      initialTitle: item['title']!,
                      initialContent: item['description']!,
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
