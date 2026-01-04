import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:motainai/components/restuarantmodel.dart';
import 'package:motainai/components/restuarants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchController _searchController = SearchController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  bool _matches(List item, String q) {
    if (q.isEmpty) return true;

    final query = q.toLowerCase();

    // Based on your restaurantinfo indexing:
    // [0]=restuarantname, [1]=itemname, [4]=location
    final restaurantName = (item[0] ?? '').toString().toLowerCase();
    final itemName = (item[1] ?? '').toString().toLowerCase();
    final location = (item[4] ?? '').toString().toLowerCase();

    return restaurantName.contains(query) ||
        itemName.contains(query) ||
        location.contains(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).unfocus(); // dismiss keyboard

          // also close the search overlay if open
          if (_searchController.isOpen) {
            _searchController.closeView(_searchController.text);
          }
        },
        child: SafeArea(
          child: Consumer<Restuarantmodel>(
            builder: (context, value, child) {
              final data = value.restaurantinfo;

              final results = data.where((e) => _matches(e, _query)).toList();
              final allRestaurants = value.restaurantinfo;

              final resultsforlist = _query.trim().isEmpty
                  ? allRestaurants
                  : allRestaurants.where((e) => _matches(e, _query)).toList();

              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  SearchAnchor.bar(
                    barBackgroundColor: WidgetStateProperty.all(
                      Colors.grey.shade100,
                    ),
                    searchController: _searchController,
                    viewBackgroundColor: Colors.white,
                    // Bar UI
                    barHintText: 'Search restaurants, items, location...',
                    barLeading: const Icon(Icons.search),
                    barTrailing: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _query = '');
                        },
                      ),
                    ],

                    // When user submits (presses enter)
                    onSubmitted: (text) {
                      setState(() => _query = text);
                      FocusScope.of(context).unfocus();
                    },

                    // Suggestions overlay (the dropdown)
                    suggestionsBuilder: (context, controller) {
                      final typed = controller.text;
                      final filtered = data
                          .where((e) => _matches(e, typed))
                          .toList();

                      // keep it light (overlay shouldn’t be huge)
                      final show = filtered.take(8).toList();

                      if (typed.isEmpty) {
                        // Optional: show “recent searches” or quick picks
                        return [
                          const ListTile(
                            title: Center(
                              child: Text('Try: "Joyfull", “Kimbap”, “Sushi”…'),
                            ),
                          ),
                        ];
                      }

                      if (show.isEmpty) {
                        return [
                          const ListTile(
                            title: Center(child: Text('No matches')),
                          ),
                        ];
                      }

                      return show.map((item) {
                        final name = item[0].toString();
                        final itemName = item[1].toString();
                        final location = item[4].toString();

                        return ListTile(
                          title: Text(name),
                          subtitle: Text('$itemName • $location'),
                          onTap: () {
                            controller.closeView(name);
                            setState(() => _query = name);
                          },
                        );
                      });
                    },
                  ),

                  const SizedBox(height: 16),

                  // Results section
                  if (_query.isEmpty)
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 14),
                          child: Center(
                            child: Text('Search to see restaurants'),
                          ),
                        ),
                        SizedBox(height: 20),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (_query.isEmpty)
                              const Padding(
                                padding: EdgeInsets.only(
                                  top: 20,
                                  bottom: 20,
                                  left: 20,
                                ),
                                child: Text(
                                  'All restaurants',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),

                            ListView.builder(
                              itemCount: resultsforlist.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final r = resultsforlist[index];

                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 25,
                                    left: 20,
                                    right: 10,
                                  ),
                                  child: RestuarantTile(
                                    restuarantname: r[0],
                                    itemname: r[1],
                                    itemnewprice: r[2],
                                    itemoldprice: r[3],
                                    location: r[4],
                                    timeperiod: r[5],
                                    imagepath: r[6],
                                    productimage: '',
                                    containerheight: 310,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    )
                  else if (results.isEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Center(child: Text('No results for “$_query”')),
                    )
                  else
                    ...results.map((r) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 20,
                        ),
                        child: RestuarantTile(
                          restuarantname: r[0],
                          itemname: r[1],
                          itemnewprice: r[2],
                          itemoldprice: r[3],
                          location: r[4],
                          timeperiod: r[5],
                          imagepath: r[6],
                          productimage: '',
                          containerheight: 300,
                        ),
                      );
                    }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
