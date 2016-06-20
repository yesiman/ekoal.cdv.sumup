package org.apache.cordova.sumup;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;
import com.sumup.merchant.api.SumUpAPI;

public class ResponseActivity extends Activity {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        String res = "";
        Bundle extra = getIntent().getExtras();
        if (extra != null) {
            res += "Result code: " + extra.getInt(SumUpAPI.Response.RESULT_CODE);

            res += "Message: " + extra.getString(SumUpAPI.Response.MESSAGE);

            String txCode = extra.getString(SumUpAPI.Response.TX_CODE);
            if (txCode != null) {
                res += "Transaction Code: " + txCode;
            }
        }
    }
}
