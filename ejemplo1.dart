// main.dart
void main() {
  // an ordinary URL
  const urlOne = 'https://www.kindacode.com/some-category/some-path/';

  final uriOne = Uri.parse(urlOne);
  print(uriOne.origin); // https://www.kindacode.com
  print(uriOne.host); // www.kindacode.com
  print(uriOne.scheme); // https
  print(uriOne.port); // 443
  print(uriOne.path); // /some-category/some-path/
  print(uriOne.pathSegments); // [some-category, some-path]
  print(uriOne.query); // null
  print(uriOne.queryParameters); // {}

  // a URL with query paramters
  const urlTwo =
      'https://test.kindacode.com/one-two-three?search=flutter&sort=asc';
  final uriTwo = Uri.parse(urlTwo);
  print(uriTwo.origin); // https://test.kindacode.com
  print(uriTwo.host); // test.kindacode.com
  print(uriTwo.scheme);
  print(uriTwo.port); // 443
  print(uriTwo.path); // /one-two-three
  print(uriTwo.pathSegments); // [one-two-three]
  print(uriTwo.query); // search=flutter&sort=asc
  print(uriTwo.queryParameters); // {search: flutter, sort: asc}
}
