import 'package:get/get.dart';
import '../providers/api_provider.dart';
import '../models/trip_model.dart';

class TripService {
  final ApiProvider _apiProvider = Get.find<ApiProvider>();

  Future<List<TripModel>> getNewTrips() async {
    // try {
    final response =
        await _apiProvider.get('/trip/all?filters={"status":"NOT_ASSIGNED"}');

    // if (response.statusCode == 200) {
    final List<dynamic> tripsJson = response.data['data']['data'];
    return tripsJson.map((json) => TripModel.fromJson(json)).toList();
    // }
    //   throw 'Failed to fetch trips';
    // } catch (e) {
    //   throw 'Error fetching trips: $e';
    // }
  }
}
