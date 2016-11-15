# cordova-plugin-sumup
Cordova plugin for native acces to the sumup paiement system

This plugin permit interconnection beetween native sumUp SDK and hybrid mobile app (cordova/phonegap).

<b>Compatibility :</b>
- IOS
- ANDROID

<b>Installation</b>

$ cordova plugin add https://github.com/yesiman/ekoal.cdv.sumup --variable SUMUP_API_KEY=YOUR_AFFILIATION_KEY

You can generate your affiliation key in your merchant account on SumUp website in the developper menu.

<b>JS CODE</b>

<pre>
  var Sumup = {
    pay: function (success, failure, amount, dev) {
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
  Sumup.pay(nativePluginResultHandler, nativePluginErrorHandler, "AMOUNT", "CURRENCY_CODE");
</pre>

<b>IOS</b>

<b>ANDROID Installation</b>

Update yout gradle Android module file 
<pre>
//Add repositorie local location
buildscript {
    repositories {
        flatDir {
            dirs 'libs'
        }
    }
}
</pre>
//Avoid duplicate jar files during compilation
<pre>
android
{
  packagingOptions {
        exclude 'META-INF/DEPENDENCIES'
        exclude 'META-INF/NOTICE'
        exclude 'META-INF/LICENSE'
        exclude 'META-INF/LICENSE.txt'
        exclude 'META-INF/NOTICE.txt'
        exclude 'META-INF/services/javax.annotation.processing.Processor'
    }
}

//Module definition
dependencies {
    compile('com.sumup:merchant-sdk:1.55.1@aar') {
        transitive = true
    }
}
</pre>
