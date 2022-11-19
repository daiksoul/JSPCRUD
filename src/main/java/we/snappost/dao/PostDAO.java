package we.snappost.dao;

import we.snappost.util.JDBCutil;
import we.snappost.vo.PostVO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {
    private static Connection conn;
    private static PreparedStatement stmt;
    private static ResultSet rs;

    private static final String INSERTq = "INSERT INTO snappost(author,email,title,content,photo,category,likes,color,public) values(?,?,?,?,?,?,?,?,?)";
    private static final String EDITq = "update snappost set author=?, email=?, title=?, content=?, photo=?, category=?, likes=?, color=?, public=? where id=?";
    private static final String DELETEq = "delete from snappost where id=?";
    private static final String GETq = "select * from snappost where id=?";
    private static final String LISTq = "select * from snappost order by regdate desc";
    private static final String PHOTOq = "select photo from snappost where id=?";

    public static boolean addPost(PostVO post){
        conn = JDBCutil.getConn();
        try {
            stmt = conn.prepareStatement(INSERTq);
            stmt.setString(1,post.getAuthor());
            stmt.setString(2,post.getEmail());
            stmt.setString(3,post.getTitle());
            stmt.setString(4,post.getContent());
            stmt.setString(5,post.getPhoto());
            stmt.setString(6,post.getCategory());
            stmt.setInt(7,post.getLikes());
            stmt.setString(8,post.getColor());
            stmt.setInt(9,post.isPubl()?1:0);
            boolean tmp = stmt.execute();
            stmt.close();
            return tmp;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean deletePost(int id){
        conn = JDBCutil.getConn();
        try{
            stmt = conn.prepareStatement(DELETEq);
            stmt.setInt(1,id);
            boolean tmp = stmt.execute();
            stmt.close();
            return tmp;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean updatePost(PostVO post){
        conn = JDBCutil.getConn();
        try{
            stmt = conn.prepareStatement(EDITq);
            stmt.setString(1,post.getAuthor());
            stmt.setString(2,post.getEmail());
            stmt.setString(3,post.getTitle());
            stmt.setString(4,post.getContent());
            stmt.setString(5,post.getPhoto());
            stmt.setString(6,post.getCategory());
            stmt.setInt(7,post.getLikes());
            stmt.setString(8,post.getColor());
            stmt.setInt(9,post.isPubl()?1:0);
            stmt.setInt(10,post.getId());
            int tmp = stmt.executeUpdate();
            stmt.close();
            return tmp>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static PostVO getPost(int id){
        conn = JDBCutil.getConn();
        try{
            stmt = conn.prepareStatement(GETq);
            stmt.setInt(1,id);
            rs = stmt.executeQuery();
            if(rs.next())
                return fromRs(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static List<PostVO> getPostList(){
        List<PostVO> toReturn = new ArrayList<>();
        conn = JDBCutil.getConn();
        try{
            stmt = conn.prepareStatement(LISTq);
            rs = stmt.executeQuery();
            while (rs.next()){
                toReturn.add(fromRs(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return toReturn;
    }

    public static String getPhotoUrlFromId(int id){
        String toReturn = null;
        conn = JDBCutil.getConn();
        try{
            stmt = conn.prepareStatement(PHOTOq);
            stmt.setInt(1,id);
            rs = stmt.executeQuery();
            while (rs.next()){
                toReturn = rs.getString("photo");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return toReturn;
    }

    private static PostVO fromRs(ResultSet rs) throws SQLException {
        return new PostVO(
                rs.getInt("id"),
                rs.getString("author"),
                rs.getString("email"),
                rs.getString("title"),
                rs.getString("content"),
                rs.getDate("regDate"),
                rs.getDate("modDate"),
                rs.getString("photo"),
                rs.getString("category"),
                rs.getInt("likes"),
                rs.getString("color"),
                rs.getInt("public") == 1
        );
    }
}
