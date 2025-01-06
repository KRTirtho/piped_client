import 'package:dio/dio.dart';
import 'package:piped_client/src/converter.dart';
import 'package:piped_client/src/models/instance.dart';
import 'package:piped_client/src/models/search_result.dart';
import 'package:piped_client/src/models/stream_response.dart';

enum PipedFilter {
  all("all"),
  videos("videos"),
  playlists("playlists"),
  musicSongs("music_songs"),
  musicVideos("music_videos"),
  musicAlbums("music_albums"),
  musicPlaylist("music_playlist");

  final String value;
  const PipedFilter(this.value);
}

class PipedClient {
  final Dio client;
  final bool debug;
  String? _customInstanceListUrl; // Used to store the user-defined Instance list URL
  String _instance;             // Used to store the user-defined Piped instance URL

  /// Default Instance list URL
  static const String defaultInstanceListUrl =
      "https://raw.githubusercontent.com/wiki/TeamPiped/Piped-Frontend/Instances.md";

  /// Default Piped instance URL
  static const String defaultInstance = "https://pipedapi.kavin.rocks";

  PipedClient({
    String? instance,  // Optional: User-defined Piped instance URL
    this.debug = false,
    String? customInstanceListUrl, // Optional: User-defined Instance list URL
  }) : _instance = instance ?? defaultInstance,
       _customInstanceListUrl = customInstanceListUrl,
       client = Dio(
          BaseOptions(
            baseUrl: instance ?? defaultInstance, // Use custom instance or default instance
            responseType: ResponseType.json,
          ),
        );

  Future<PipedStreamResponse> streams(String videoId) async {
    final res = await client.get("/streams/$videoId");
    return PipedStreamResponse.fromJson(<String, dynamic>{
      ...res.data,
      "id": videoId,
    });
  }

  Future<PipedSearchResult> search(
    String query, [
    PipedFilter filter = PipedFilter.all,
  ]) async {
    final res = await client.get(
      "/search",
      queryParameters: {"q": query, "filter": filter.value},
    );
    return PipedSearchResult.fromJson(res.data);
  }

  Future<List<PipedInstance>> instanceList() async {
    // Use user-defined link, if not then use the default link
    final String url = _customInstanceListUrl ?? defaultInstanceListUrl;

    final res = await client.get(
      url,
      options: Options(
        responseType: ResponseType.plain,
      ),
    );

    final lines = res.data.split("\n").skip(4);

    final List<Map<String, dynamic>> instances = [];
    for (final line in lines) {
      final split = (line as String).split("|");
      if (split.length < 4) continue;
      instances.add({
        "name": split[0].trim(),
        "apiUrl": split[1].trim(),
        "locations": split[2].trim().split(",").map((cc) {
          try {
            return emojiToCountryCode(cc.trim());
          } catch (e) {
            if (debug) {
              print("Error parsing country code: $cc");
            }
            return cc.trim();
          }
        }).toList(),
        "cdn": split[3].trim().toLowerCase() == "yes",
      });
    }

    return instances
        .map(PipedInstance.fromJson)
        .where((instance) => instance.apiUrl.startsWith("http"))
        .toList();
  }

  /// Set a custom Instance list URL
  void setCustomInstanceListUrl(String url) {
    _customInstanceListUrl = url;
  }

  /// Set a custom Piped instance URL
  void setInstanceUrl(String url) {
    _instance = url;
    client.options.baseUrl = url;
  }
  
  /// Get the current Piped instance URL
  String getInstanceUrl() {
      return _instance;
  }

  /// Get the current Instance list URL
  String getInstanceListUrl() {
      return _customInstanceListUrl ?? defaultInstanceListUrl;
  }
}