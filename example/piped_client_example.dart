import 'package:piped_client/piped_client.dart';

void main() async {
  final client = PipedClient();

  final instances = await client.instanceList();

  for (final instance in instances) {
    print(
        'Instance: ${instance.name}${instance.locations} => ${instance.apiUrl}');
  }

  final result = await client.search('piped');

  for (final item in result.items) {
    if (item is PipedSearchItemStream) {
      print('Stream: ${item.title} => ${item.url}');
    } else if (item is PipedSearchItemChannel) {
      print('Channel: ${item.name} => ${item.url}');
    } else if (item is PipedSearchItemPlaylist) {
      print('Playlist: ${item.name} => ${item.url}');
    }
  }
}
