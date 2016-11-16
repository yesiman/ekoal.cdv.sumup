# cordova-plugin-sumup
Cordova plugin for native acces to the sumup paiement system

This plugin permit interconnection beetween native sumUp SDK and hybrid mobile app (cordova/phonegap).

<b>Compatibility :</b>
- IOS
- ANDROID

<b>Installation</b>

<pre>
$ cordova plugin add https://github.com/yesiman/ekoal.cdv.sumup --variable SUMUP_API_KEY=YOUR_AFFILIATION_KEY
</pre>

You can generate your affiliation key in your merchant account on SumUp website in the developper menu.

<b>JS CODE</b>

<pre>
  var Sumup = {
    pay: function (success, failure, amount, currencycode) {
        cordova.exec(success, failure, "Sumup", "pay", [amount, currencycode]);
    },
    log: function (success, failure) {
        cordova.exec(success, failure, "Sumup", "log", []);
    }
    //LOG function missing (wait a little)
  };
  function nativePluginResultHandler(result) {
      if (result === 1);
      {
          //PAYMENT OK
      }
  }
  function nativePluginErrorHandler(error) {
      alert("ERROR: \r\n" + error);
  }
  
  //METHODS
  Sumup.log(nativePluginResultHandler, nativePluginErrorHandler);
  //OR
  Sumup.pay(nativePluginResultHandler, nativePluginErrorHandler, 10.00, "EUR");
</pre>
