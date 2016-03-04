package info.yangzi.fuckuploadfile;

/**
 * Created by Yang on 16/2/28.
 */
import android.app.ActivityManager;
import android.content.Context;
import android.graphics.Bitmap;
import android.os.Environment;
import android.util.Base64;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.List;

public class Util {

    private static Util util;

    /**
     * 静态实例化引导
     * @return ReadWriteUtil
     */
    public static Util getInstance() {
        if (util == null) {
            util = new Util();
        }
        return util;
    }

    /**
     * 判断服务是否正在运行,是包名+服务的类名(例如:org.infinitytron.temp.TempService)
     * @param context 界面
     * @param serviceNameString 服务进程名称
     * @return true代表正在运行，false代表服务没有正在运行
     */
    public boolean isServiceWork(Context context, String serviceNameString) {
        boolean isServiceWorkBoolean = false;
        ActivityManager activityManager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
        List<ActivityManager.RunningServiceInfo> list = activityManager.getRunningServices(40);
        if (list.size() <= 0) {
            return false;
        }
        for (int i = 0; i < list.size(); i++) {
            String isWorkingServiceNameString = list.get(i).service.getClassName();
            if (isWorkingServiceNameString.equals(serviceNameString)) {
                isServiceWorkBoolean = true;
                break;
            }
        }
        return isServiceWorkBoolean;
    }

    /**
     * 得到sdcard路径
     * @return Boolean
     */
    public String getSdCardPath() {
        String path = "";
        if (hasSDCard()) {
            path = Environment.getExternalStorageDirectory().getPath();
        }
        return path;
    }

    /**
     * 判断是否有sdcard
     * @return Boolean
     */
    public boolean hasSDCard() {
        boolean b = false;
        if (Environment.MEDIA_MOUNTED.equals(Environment.getExternalStorageState())) {
            b = true;
        }
        return b;
    }

    /**
     * 将bitmap转换成base64字符串
     * @param bitmap bitmap
     * @param bitmapQuality bitmap质量0-100
     * @return base64 字符串
     */
    public String bitmapToString(Bitmap bitmap, int bitmapQuality) {
        String string = "";
        ByteArrayOutputStream bStream = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.PNG, bitmapQuality, bStream);
        byte[] bytes = bStream.toByteArray();
        string = Base64.encodeToString(bytes, Base64.DEFAULT);
        return string;
    }

    public String encodeBase64File(String path) throws Exception {
        File file = new File(path);
        FileInputStream inputFile = new FileInputStream(file);
        byte[] buffer = new byte[(int)file.length()];
        inputFile.read(buffer);
        inputFile.close();
        return Base64.encodeToString(buffer,Base64.DEFAULT);
    }
}
