import 'package:dio/dio.dart';
import 'package:piped_client/src/converter.dart';
import 'package:piped_client/src/models/instance.dart';
import 'package:piped_client/src/models/search_result.dart';
import 'package:piped_client/src/models/stream_response.dart';

enum PipedFilter {
  all("all"),
  video("video"),
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

  PipedClient({
    String instance = "https://pipedapi.kavin.rocks",
  }) : client = Dio(
          BaseOptions(
            baseUrl: instance,
            responseType: ResponseType.json,
          ),
        );

  Future<PipedStreamResponse> streams(String videoId) async {
    final res = await client.get("/streams/$videoId");
    return PipedStreamResponse.fromJson(res.data);
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
    final res = await client.get(
      "https://raw.githubusercontent.com/wiki/TeamPiped/Piped-Frontend/Instances.md",
      options: Options(
        responseType: ResponseType.plain,
      ),
    );

    final lines = res.data.split("\n").skip(4);

    final List<Map<String, dynamic>> instances = [];
    for (final line in lines) {
      final split = line.split("|");
      if (split.length < 4) continue;
      instances.add({
        "name": split[0].trim(),
        "apiUrl": split[1].trim(),
        "locations":
            split[2].trim().split(",").map(emojiToCountryCode).toList(),
        "cdn": split[3].trim().toLowerCase() == "yes",
      });
    }

    return instances.map(PipedInstance.fromJson).toList();
  }
}
