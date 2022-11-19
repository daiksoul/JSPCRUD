<%@ page import="we.snappost.dao.PostDAO" %>
<%@ page import="we.snappost.util.FileUpload" %><%--
  Created by IntelliJ IDEA.
  User: daiks
  Date: 2022-11-19
  Time: 오후 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    System.out.println(request.getParameter("id"));
    int id = Integer.parseInt(request.getParameter("id"));
    FileUpload.deleteFile(request,PostDAO.getPhotoUrlFromId(id));
    PostDAO.deletePost(id);

    response.sendRedirect("./");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
