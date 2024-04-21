// Future<void> fetchData() async {
//   final String apiUrl = 'https://api.example.com/data'; // Replace this with your API endpoint

//   try {
//     final response = await http.get(Uri.parse(apiUrl));

//     if (response.statusCode == 200) {
//       // If the server returns a 200 OK response, parse the JSON
//       final jsonData = jsonDecode(response.body);
      
//       // Process the JSON data here
//       print(jsonData);
//     } else {
//       // If the server returns an error response, throw an exception
//       throw Exception('Failed to load data');
//     }
//   } catch (error) {
//     // Handle errors
//     print('Error: $error');
//   }
// }
