package org.apache.cordova.sumup;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;

import org.apache.cordova.*;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.PluginResult;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.ionicframework.sumuptester744401.MainActivity;
import com.sumup.android.logging.Log;
import com.sumup.merchant.api.SumUpAPI;
import com.sumup.merchant.api.SumUpPayment;
import com.sumup.merchant.api.SumUpState;

import java.util.Currency;
import java.util.UUID;

public class sumup extends CordovaPlugin {
    //
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {


      this.cordova.getActivity().runOnUiThread(new Runnable() {
        public void run() {
          SumUpState.init(cordova.getActivity());
        }
      });

        //Context context=this.cordova.getActivity().getApplicationContext();
        //Intent intent=new Intent(context,suPActivity.class);
        //intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        //context.startActivity(intent);

        if (action.equals("pay")) {
            //CURRENCY CONVERSION
            SumUpPayment payment = SumUpPayment.builder()
                    // mandatory parameters
                    // Your affiliate key is bound to the applicationID entered in the SumUp dashboard at https://me.sumup.com/integration-tools
                    .affiliateKey("YOU_AFFILIATION_KEY")
                    .productAmount(Double.parseDouble(args.get(0).toString()))
                    .currency(SumUpPayment.Currency.valueOf(args.get(1).toString()))
                            // optional: add details
                            //.productTitle("Taxi Ride").receiptEmail("customer@mail.com").receiptSMS("+3531234567890")
                            // optional: Add metadata
                            //.addAdditionalInfo("AccountId", "taxi0334")
                            //.addAdditionalInfo("From", "Paris")
                            //.addAdditionalInfo("To", "Berlin")
                            // optional: foreign transaction ID, must be unique!
                            .foreignTransactionId(UUID.randomUUID().toString()) // can not exceed 128 chars
                            .build();



            //(suPActivity).se
            //((MainActivity)this.cordova.getActivity()).setCallback(callbackContext);
            SumUpAPI.openPaymentActivity(this.cordova.getActivity(), payment, 1);
            return true;
        }
        //this.echo("false",callbackContext);
        return false;
    }



    private void echo(String message, CallbackContext callbackContext) {
        if (message != null && message.length() > 0) {
            callbackContext.success(message);
        } else {
            callbackContext.error("Expected one non-empty string argument.");
        }
    }

}
