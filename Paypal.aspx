﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Paypal.aspx.cs" Inherits="Paypal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div class="container text-center mt-5 py-5">
        <div id="paypal-button-container"></div>
            <script src="https://www.paypalobjects.com/api/checkout.js"> </script>
            <script>
        // Render the PayPal button
                paypal.Button.render({
        // Set your environment
                env: 'sandbox', // sandbox | production

        // Specify the style of the button
            style: {
                      layout: 'vertical',  // horizontal | vertical
                      size:   'medium',    // medium | large | responsive
                      shape:  'rect',      // pill | rect
                      color:  'gold'       // gold | blue | silver | white | black
                    },

// Specify allowed and disallowed funding sources
//
// Options:
// - paypal.FUNDING.CARD
// - paypal.FUNDING.CREDIT
// - paypal.FUNDING.ELV
funding: {
  allowed: [
    paypal.FUNDING.CARD,
    paypal.FUNDING.CREDIT
  ],
  disallowed: []
},

// Enable Pay Now checkout flow (optional)
commit: true,

// PayPal Client IDs - replace with your own
// Create a PayPal app: https://developer.paypal.com/developer/applications/create
client: {
  sandbox: 'AZDxjDScFpQtjWTOUtWKbyN_bDt4OgqaF4eYXlewfBP4-8aqX3PiV8e1GWU6liB2CUXlkA59kJXE7M6R',
  production: '<insert production client id>'
},

payment: function (data, actions) {
  return actions.payment.create({
    payment: {
      transactions: [
        {
          amount: {
            total: '0.01',
            currency: 'USD'
          }
        }
      ]
    }
  });
},

onAuthorize: function (data, actions) {
  return actions.payment.execute()
    .then(function () {
      window.alert('Payment Complete!');
    });
}
}, '#paypal-button-container');
</script>
</div>
</body>
</html>
