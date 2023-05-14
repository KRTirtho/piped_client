## Piped.dart

Simple api client for [piped.video](https://piped.video), an alternative frontend for YouTube
Supports both Dart and Flutter

## Installation

For flutter
```bash
$ flutter pub add piped_client
```

For dart only,
```bash
$ dart pub add piped_client
```

## Usage

Simply use the exported `PipedClient` to create an instance for the client


```dart
import 'package:piped_client/piped_client.dart';

void main() async {
  final client = PipedClient();

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
```

**Following endpoints currently implemented:**

- [x] /search
- [x] /streams
- [x] instance-list (parses Instance.md)

## License

[MIT](./LICENSE)
