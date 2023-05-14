import 'package:test/test.dart';

import 'package:piped_client/piped_client.dart';

void main() {
  late PipedClient client;
  setUpAll(() async {
    client = PipedClient();
  });

  test(
    'GET: [instanceList] should return list of [PipedInstance]',
    () async {
      final instances = await client.instanceList();
      expect(instances, isA<List<PipedInstance>>());
    },
  );

  test(
    'GET: [streams] should return [PipedStreamsResponse]',
    () async {
      final instance = await client.streams('8j9zMok6two');
      expect(instance, isA<PipedStreamResponse>());
    },
  );

  test('GET: [search] should return [PipedSearchResult]', () async {
    final result = await client.search('The Linux Experiment');
    expect(result, isA<PipedSearchResult>());
  });
}
