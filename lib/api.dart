import 'package:graphql/client.dart';

const baseURL = "https://graphql-github-test.herokuapp.com/graphql/";
//const baseURL = "https://api.mocki.io/v2/c4d7a195/graphql/";

final _httpLink = HttpLink(
  baseURL
);


final GraphQLClient client = GraphQLClient(
  link: _httpLink,
  cache: GraphQLCache(),
);

const _getMessages = r'''
query {
  messages{
    user
    content
    }
  }
''';

Future<dynamic> getMessages() async {
  var result = await client.query(
    QueryOptions(
      document: gql(_getMessages),
    ),
  );
  
  if (result.exception != null) {
          print('//// EXCEPTION: ${result.exception?.toString()}');
          print('//// EXCEPTION: ${result.exception?.graphqlErrors}');

        //throw AppException(message: (result.exception !=null)?result.exception.toString():"Error");
      }
  var json = result.data!["messages"];
  print(result);
  return result.data!["messages"];
}