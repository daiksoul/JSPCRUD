package we.snappost.util;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import we.snappost.dao.PostDAO;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUpload {
    public static MultipartRequest createMultReq(HttpServletRequest request){
        int sizeLimit = 15 * 1024 * 1024;

        String realPath = request.getServletContext().getRealPath("upload");

        File dir = new File(realPath);
        if (!dir.exists()) dir.mkdirs();

        MultipartRequest multpartRequest = null;
        try {
            multpartRequest = new MultipartRequest(request, realPath,  sizeLimit, "utf-8",new DefaultFileRenamePolicy());
        } catch (IOException e) {
            return null;
        }

        return multpartRequest;
    }

    public static String uploadPhoto(HttpServletRequest request, MultipartRequest multipartRequest) {
        String filename;

        filename = multipartRequest.getFilesystemName("photo");

        String id = multipartRequest.getParameter("id");
        if(id!=null&&!id.equals("")){
            String oldF = PostDAO.getPhotoUrlFromId(Integer.parseInt(id));
            if(filename!=null && oldF!=null)
                FileUpload.deleteFile(request,oldF);
            else if(filename==null && oldF!=null)
                filename = oldF;
        }

        return filename;
    }

    public static boolean deleteFile(HttpServletRequest request, String filename){
        String filepath = request.getServletContext().getRealPath("upload");
        File f = new File(filepath+"/"+filename);
        if(f.exists()){
            f.delete();
            return true;
        }else
            return false;
    }
}
