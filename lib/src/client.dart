import 'package:dio/dio.dart';
import 'package:piped_client/src/models/search_result.dart';
import 'package:piped_client/src/models/stream_response.dart';

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
    String filter = "all",
  ]) async {
    final res = await client.get(
      "/search",
      queryParameters: {"q": query, "filter": filter},
    );
    return PipedSearchResult.fromJson(res.data);
  }
}
