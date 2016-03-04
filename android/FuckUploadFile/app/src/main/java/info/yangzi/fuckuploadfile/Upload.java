package info.yangzi.fuckuploadfile;

/**
 * Created by Yang on 16/2/28.
 */
public interface Upload {
    int checkServiceIsWorkingTime = 3000; //3秒检测一次服务是否在运行
    int serviceStartDelayTime = 1000; //服务延迟1秒启动
    int serviceRunTime = 2500; //每间隔2.5秒执行服务进程中的post函数
    String serviceName = "info.yangzi.fuckuploadfile.UploadService"; //后台服务名称
    String filePath = "/vcode.png"; //要上传的图片地址
    String postHttpPath = "http://10.0.3.2:8099/api/uploadVcode"; //post地址
    // String postHttpPath = "http://baidu.com"; //post地址
}