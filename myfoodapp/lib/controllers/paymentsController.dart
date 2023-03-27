import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:get/get.dart';
import 'package:myfoodapp/cons/app_constants.dart';
import 'package:myfoodapp/cons/firebase.dart';
import 'package:myfoodapp/cons/controllers.dart';
import 'package:uuid/uuid.dart';
import 'package:myfoodapp/models/payments.dart';
import 'package:myfoodapp/widgets/custom_text.dart';
import 'package:dio/dio.dart';

//This class contains methods for creating a Stripe payment method,
//processing payments, displaying alerts when payment fails,
//and adding payment info to a Firebase database.
class PaymentsController extends GetxController {
  //create an instance of payments controller
  static PaymentsController instance = Get.find();
  //firebase collection
  String collection = "payments";
  //string to cloud function
  String url =
      "https://us-central1-foodapp-3861e.cloudfunctions.net/createPaymentIntent";

  //list of payment models
  List<PaymentsModel> payments = [];

  //call as soon as payements controller is called
  //set up publishable key
  @override
  void onReady() {
    super.onReady();
    StripePayment.setOptions(StripeOptions(
        publishableKey:
            "pk_test_51MoqBBJKxMCFfYVAAfX7Y9lxnyQVP5B3K177zc41JeNKF0BtDIpacsIs8NctE7FptoB0XATODYkpLZb6A1PtFuJJ00Rnwa2VUF",
        androidPayMode: 'test'));
  }

  //create payment
  Future<void> createThePayment() async {
    // StripePayment.setStripeAccount('');
    //add card to payment method
    PaymentMethod paymentMethod = PaymentMethod();
    //get the payment method object by opening the card form dialog
    paymentMethod = await StripePayment.paymentRequestWithCardForm(
      CardFormPaymentRequest(),
    ).then((PaymentMethod paymentMethod) {
      return paymentMethod;
    }).catchError((e) {
      print('Error In Card: ${e.toString()}');
    });

    paymentMethod != null ? processPayment(paymentMethod) : paymentFailed();
  }

  // This method processes the payment. It calls the firebase function to send
  // a payment intent to Stripe, and processes the result of the payment intention.
  Future<void> processPayment(PaymentMethod paymentMethod) async {
    int amount =
        (double.parse(cartController.cartTotalPrice.value.toStringAsFixed(2)) *
                100)
            .toInt();
    //send post request to firebase function
    final response = await Dio()
        .post('$url?amount=$amount&currency=EUR&pm_id=${paymentMethod.id}');
    //process the response of the firbase function
    if (response.data != null && response.data != 'error') {
      final paymentIntentX = response.data;
      final status = paymentIntentX['paymentIntent']['status'];
      //check if the card was checked sucessfully
      if (status == 'succeeded') {
        StripePayment.completeNativePayRequest();
        _addToPayCollection(paymentStatus: status, paymentId: paymentMethod.id);
        //clear the user cart if payment successful
        authController.updateUserData({"cart": []});
        Get.snackbar("Success", "Payment was successful");
      } else {
        _addToPayCollection(paymentStatus: status, paymentId: paymentMethod.id);
      }
    } else {
      StripePayment.cancelNativePayRequest();
      paymentFailed();
    }
  }

  //payment failed
  void paymentFailed() {
    Get.defaultDialog(
        content: Text(
          "Payment failed, invlaid card",
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Okay",
                ),
              ))
        ]);
  }

  //add payment to firebase collection
  _addToPayCollection({String? paymentStatus, String? paymentId}) {
    //generate a new Id for document
    String id = Uuid().v1();
    //add to firebase document
    firebaseFirestore.collection(collection).doc(id).set({
      "id": id,
      "clientId": authController.userModel.value.id,
      "status": paymentStatus,
      "paymentId": paymentId,
      "cart": authController.userModel.value.cartItemsToJson(),
      "amount": cartController.cartTotalPrice.value.toStringAsFixed(2),
      "dateCreated": DateTime.now().microsecondsSinceEpoch,
    });
  }
}
