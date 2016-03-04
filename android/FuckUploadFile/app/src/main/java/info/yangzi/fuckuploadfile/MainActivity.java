package info.yangzi.fuckuploadfile;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.widget.ImageView;

import java.io.File;

public class MainActivity extends AppCompatActivity implements Upload {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        initeView();
        startService();
    }

    public void initeView() {
        ImageView imageView = (ImageView) findViewById(R.id.imageView);
        if (Uri.fromFile(new File(Util.getInstance().getSdCardPath() + filePath)) != null) {
            Bitmap bitmap = BitmapFactory.decodeFile(Util.getInstance().getSdCardPath() + filePath);
            imageView.setImageBitmap(bitmap);
        }
    }

    public void startService() {
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                if (!Util.getInstance().isServiceWork(MainActivity.this, serviceName)) {
                    Intent serviceIntent = new Intent(MainActivity.this, UploadService.class);
                    startService(serviceIntent);
                }
            }
        }, checkServiceIsWorkingTime);
    }
}
