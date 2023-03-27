/* eslint-disable */
// // Create and deploy your first functions
// // https://firebase.google.com/docs/functions/get-started
//
//exports.helloWorldJS = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello JavaScript logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
// This function defines a cloud function that creates a payment intent using Stripe API.
// The function receives parameters (amount, currency, payment method ID,
// and description) through an HTTP request and uses them
// to create a payment intent.
// If the payment intent creation is successful, the function responds
// with the created payment intent in JSON format,
// otherwise, it responds with an error message.
// Replace secret key with secret key from stripe
//    Execute the line below in the firebase cli
//    firebase functions:config:set stripe.testkey="replace this with secret key from stripe API"

const functions = require("firebase-functions");
const stripe = require("stripe")(functions.config().stripe.testkey);

exports.createPaymentIntent = functions.https.onRequest(async (req, res) => {
  console.log("****JS-Request received for creating payment intent");
  console.log("****JS-Amount: ", req.query.amount);
  console.log("****JS-Currency: ", req.query.currency);
  console.log("****JS-Payment method ID: ", req.query.pm_id);

  try {
    const paymentIntent = await stripe.paymentIntents.create({
      amount: req.query.amount,
      currency: req.query.currency,
      payment_method: req.query.pm_id,
      confirmation_method: "automatic",
      confirm: true,
      description: req.query.description,
    });
    console.log("****JS-Payment intent created successfully: ", paymentIntent);
    res.json({ paymentIntent });
  } catch (err) {
    console.log("****JS-Error creating payment intent: ", err);
    res.send("error");
  }
});
