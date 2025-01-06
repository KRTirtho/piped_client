import 'package:piped_client/piped_client.dart';

import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // 使用 PipedClient 的默认构造函数，初始时使用默认值
  final _pipedClient = PipedClient();
  final _instanceUrlController = TextEditingController();
  final _instanceListUrlController = TextEditingController();
  List<PipedInstance> _instances = [];
  String _searchQuery = "";
  List<dynamic> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _fetchInstances(); // 初始获取实例列表
  }

  Future<void> _fetchInstances() async {
    try {
      final instances = await _pipedClient.instanceList();
      setState(() {
        _instances = instances;
      });
      _printInstances();
    } catch (e) {
      print("Error fetching instances: $e");
      _showError("Failed to fetch instances: $e");
    }
  }

  Future<void> _search() async {
    if (_searchQuery.isEmpty) return;
    try {
      final result = await _pipedClient.search(_searchQuery);
      setState(() {
        _searchResults = result.items;
      });
      _printSearchResults();
    } catch (e) {
      print("Error searching: $e");
      _showError("Failed to search: $e");
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _printInstances() {
    print("Available Instances:");
    for (final instance in _instances) {
      print('Instance: ${instance.name} ${instance.locations.join(", ")} => ${instance.apiUrl}');
    }
  }

  void _printSearchResults() {
    print("\nSearch results for '$_searchQuery':");
    for (final item in _searchResults) {
      if (item is PipedSearchItemStream) {
        print('Stream: ${item.title} (${item.uploaderName}) - ${item.url}');
        _fetchStreamDetails(item.url);
      } else if (item is PipedSearchItemChannel) {
        print('Channel: ${item.name} - ${item.url}');
      } else if (item is PipedSearchItemPlaylist) {
        print('Playlist: ${item.name} - ${item.url}');
      }
    }
  }

  Future<void> _fetchStreamDetails(String url) async {
    try {
      final videoId = Uri.parse(url).pathSegments.last;
      final streamResponse = await _pipedClient.streams(videoId);
      print('  └─ Audio Streams: ${streamResponse.audioStreams.length}');
      print('  └─ Video Streams: ${streamResponse.videoStreams.length}');
    } catch (e) {
      print('  └─ Error fetching stream details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Piped Client UI Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _instanceUrlController,
                decoration: const InputDecoration(
                  labelText: 'Instance URL',
                  hintText: 'Enter custom instance URL (optional)',
                ),
              ),
              TextField(
                controller: _instanceListUrlController,
                decoration: const InputDecoration(
                  labelText: 'Instance List URL',
                  hintText: 'Enter custom instance list URL (optional)',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // 更新 PipedClient 的设置
                  _pipedClient.setInstanceUrl(_instanceUrlController.text);
                  _pipedClient.setCustomInstanceListUrl(_instanceListUrlController.text);
                  _fetchInstances(); // 重新获取 Instance 列表
                },
                child: const Text('Update Settings and Fetch Instances'),
              ),
              const SizedBox(height: 20),
              const Text("Available Instances:", style: TextStyle(fontWeight: FontWeight.bold)),
              Expanded(
                child: ListView.builder(
                  itemCount: _instances.length,
                  itemBuilder: (context, index) {
                    final instance = _instances[index];
                    return ListTile(
                      title: Text(instance.name),
                      subtitle: Text("${instance.apiUrl} - ${instance.locations.join(', ')}"),
                    );
                  },
                ),
              ),
              TextField(
                onChanged: (value) {
                  _searchQuery = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Search',
                  hintText: 'Enter search query',
                ),
              ),
              ElevatedButton(
                onPressed: _search,
                child: const Text('Search'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    final item = _searchResults[index];
                    if (item is PipedSearchItemStream) {
                      return ListTile(
                        title: Text(item.title),
                        subtitle: Text('Stream - ${item.uploaderName}'),
                      );
                    } else if (item is PipedSearchItemChannel) {
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text('Channel'),
                      );
                    } else if (item is PipedSearchItemPlaylist) {
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text('Playlist'),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _instanceUrlController.dispose();
    _instanceListUrlController.dispose();
    super.dispose();
  }
}