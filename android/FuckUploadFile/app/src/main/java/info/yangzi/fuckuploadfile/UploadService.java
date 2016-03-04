package info.yangzi.fuckuploadfile;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.IBinder;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Handler;
import android.telephony.TelephonyManager;
import android.util.Log;

import java.io.File;

public class UploadService extends Service implements Upload {
    private final Handler handler = new Handler();
    private Runnable runnable = new Runnable() {
        @Override
        public void run() {
            System.out.println("onRunPost");
            postData();
            handler.postDelayed(this, serviceRunTime);
        }
    };

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public void onCreate() {
        super.onCreate();
        System.out.println("onCreatTempService");
        handler.postDelayed(runnable, serviceStartDelayTime);
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        System.out.println("onDestoryTempService");
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        return START_REDELIVER_INTENT;
    }

    public void postData() {
        String file = Util.getInstance().getSdCardPath() + filePath;
        if (Uri.fromFile(new File(file)) != null) {
            try {
                String postBase64 =
                        "imei=" + ((TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE)).getDeviceId()
                                + "&data=" + Util.getInstance().encodeBase64File(file);
                Log.i("发送base64：", postBase64);

                new NetworkPostUtil(postHttpPath, postBase64) {
                    @Override
                    protected void onPostExecute(String result) {
                        super.onPostExecute(result);
                        //null
                    }
                }.execute();
            } catch (Exception e) {
                System.out.println("error post");
            }
        }
    }}
