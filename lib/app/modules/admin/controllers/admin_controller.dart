import 'package:get/get.dart';
import 'package:uber_pro/app/data/services/trip_service.dart';

import '../../../data/models/trip_model.dart';

class AdminController extends GetxController {
  final priceOffers = <Map<String, dynamic>>[].obs;
  final currentOrders = <Map<String, dynamic>>[].obs;
  final completedOrders = <Map<String, dynamic>>[].obs;
  final TripService _tripService = TripService();
  final trips = <TripModel>[].obs;
  final currentIndex = 0.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Simulated data
    priceOffers.addAll([
      {
        'id': '1763413',
        'listPrice': 63.97,
        'priceOffer': 290.00,
        'pickupTime': 'Fri, 10/25, 10:00 - 11:00',
        'deliveryTime': 'Fri, 10/25, 13:00 - 17:00',
        'pickupLocation': 'blg_saalanderdon au',
        'pickupAddress': 'Grenzstraße 15 93309 Saal an der Donau Germany',
        'deliveryLocation': 'Jürgen Exner TOPBRIGHT GmbH',
        'deliveryAddress': 'Auf der Schanz 43a 90453 Nürnberg Germany',
        'distance': 111,
        'vehicleType': 'Electric car',
        'client': 'finn GmbH',
      },
    ]);

    currentOrders.addAll([
      {
        'id': '1760123',
        'unitId': '8FK5H7',
        'status': 'picked up',
        'price': 130.00,
        'licencePlate': 'WI-TV 3254',
        'driver': 'Mohamad Abou Esmaeil',
        'pickupTime': 'earliest Mon, 10/21, 12:30',
        'deliveryTime': 'latest Wed, 10/23, 18:00',
        'pickupLocation': 'G386 Enterprise Bonn',
        'pickupAddress': 'Adenauerallee 4-6 53113 Bonn',
        'deliveryLocation': 'Roos Vehicle Logistics GmbH Faulbach',
        'deliveryAddress':
            'Am Kieswerk 1-Keine Nachtabgabe! Briefkasten wird nicht geleert! Faulbach Anlieferungszeit 07-21 Uhr. Bitte beachten',
        'distance': 241,
        'vehicleType': 'Car',
        'client': 'Enterprise Logistik',
      },
      {
        'id': '1760123',
        'unitId': '8FK5H7',
        'status': 'assigned',
        'price': 130.00,
        'licencePlate': 'WI-TV 3254',
        'driver': 'Mohamad Abou Esmaeil',
        'pickupTime': 'earliest Mon, 10/21, 12:30',
        'deliveryTime': 'latest Wed, 10/23, 18:00',
        'pickupLocation': 'G386 Enterprise Bonn',
        'pickupAddress': 'Adenauerallee 4-6 53113 Bonn',
        'deliveryLocation': 'Roos Vehicle Logistics GmbH Faulbach',
        'deliveryAddress':
            'Am Kieswerk 1-Keine Nachtabgabe! Briefkasten wird nicht geleert! Faulbach Anlieferungszeit 07-21 Uhr. Bitte beachten',
        'distance': 241,
        'vehicleType': 'Car',
        'client': 'Enterprise Logistik',
      },
    ]);

    completedOrders.addAll([
      {
        'id': '1755818',
        'unitId': 'e2gx5los (GD), EU-FE359E',
        'price': 311.85,
        'licencePlate': 'Licence plate unknown',
        'driver': 'Mohamad Abou Esmaeil',
        'pickupTime': 'earliest Fri, 10/18, 15:00',
        'deliveryTime': 'latest Mon, 10/21, 11:00',
        'pickupLocation': 'Georgios Ganitis',
        'pickupAddress':
            'Clara-Zetkin-Strasse 26 16562 Hohen Neuendorf Germany',
        'deliveryLocation': 'AKB Kitzingen',
        'deliveryAddress': 'Steigweg 24 97318 Kitzingen Germany',
        'distance': 509,
        'vehicleType': 'Electric car',
        'client': 'finn GmbH',
      },
    ]);

    // newOrders.addAll([
    //   {
    //     'id': '1763832',
    //     'price': 122.90,
    //     'pickupTime': 'Fri, 10/25, 10:00 - 13:00',
    //     'deliveryTime': 'latest Fri, 10/25, 17:30',
    //     'pickupLocation': 'Eischotter Straße 10 B',
    //     'pickupAddress': '38473 Tiddische Hoitlingen Deutschland',
    //     'deliveryLocation': 'Auto Weller GmbH & Co. KG',
    //     'deliveryAddress': 'Pagenstecherstraße 77-83 49090 Osnabrück',
    //     'distance': 237,
    //     'vehicleType': 'Car',
    //     'client': 'Auto Weller GmbH & Co. KG',
    //     'buyAvailable': true,
    //     'buyAvailableTime': 'Thu, 10/24, 09:00',
    //   },
    //   {
    //     'id': '1757349',
    //     'price': 50.00,
    //     'pickupTime': 'earliest Thu, 10/17, 00:00',
    //     'deliveryTime': 'latest Wed, 10/23, 20:00',
    //     'pickupLocation': 'Bergamo Airport',
    //     'pickupAddress': 'Orio al Serio Airport 24050 Orio al Serio Italy',
    //     'deliveryLocation': 'BERTANI Castiglione',
    //     'deliveryAddress': 'Via Cavour 46043 Castiglione delle Stiviere Italy',
    //     'distance': 82,
    //     'vehicleType': 'Car',
    //     'client': 'BERTANI Trasporti S.p.A.',
    //   },
    // ]);

    fetchNewTrips();
  }

  Future<void> fetchNewTrips() async {
    // try {
    isLoading.value = true;
    final newTrips = await _tripService.getNewTrips();
    trips.assignAll(newTrips);
    // } catch (e) {
    //   Get.snackbar('Error', e.toString());
    // } finally {
    isLoading.value = false;
    // }
  }

  void makeOffer(String tripId, double price) {
    final tripIndex = trips.indexWhere((trip) => trip.uuid == tripId);
    if (tripIndex != -1) {
      final trip = trips[tripIndex];

      // Calculate commission and insurance based on pricing model
      final commission = trip.pricingModel.appFeePercentage / 100 * price;
      final insurance = 5.67; // Fixed insurance fee
      final earnings = price - commission - insurance;

      // Create price offer
      final priceOffer = {
        'id': trip.uuid,
        'listPrice': trip.cost,
        'priceOffer': price,
        'commission': commission,
        'insurance': insurance,
        'earnings': earnings,
        'pickupTime': trip.startTime.toString(),
        'deliveryTime': trip.endTime?.toString() ?? 'Not specified',
        'pickupLocation': trip.startLocation,
        'deliveryLocation': trip.endLocation,
        'distance': trip.estimatedDistance ?? 0,
        'vehicleType': trip.car.transmission,
      };

      // Add to price offers and remove from trips
      priceOffers.add(priceOffer);
      trips.removeAt(tripIndex);

      Get.snackbar(
        'Success',
        'Price offer of €$price made for trip ${trip.uuid}',
        snackPosition: SnackPosition.BOTTOM,
      );

      // Switch to price offers tab
      currentIndex.value = 0;
    }
  }

  void buyOrder(String orderId) {
    final orderIndex =
        priceOffers.indexWhere((offer) => offer['id'] == orderId);
    if (orderIndex != -1) {
      final order = priceOffers[orderIndex];
      currentOrders.add(order);
      priceOffers.removeAt(orderIndex);

      Get.snackbar(
        'Success',
        'Order $orderId purchased successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void removeOffer(String orderId) {
    final orderIndex =
        priceOffers.indexWhere((offer) => offer['id'] == orderId);
    if (orderIndex != -1) {
      final order = priceOffers[orderIndex];
      trips.add(TripModel.fromJson(order));
      priceOffers.removeAt(orderIndex);

      Get.snackbar(
        'Success',
        'Offer for order $orderId removed',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void changePage(int index) {
    currentIndex.value = index;
  }
}
