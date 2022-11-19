<%--
  Created by IntelliJ IDEA.
  User: daiks
  Date: 2022-11-18
  Time: 오전 9:29
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="we.snappost.vo.PostVO" %>
<%@ page import="we.snappost.dao.PostDAO" %>
<%@ page import="we.snappost.util.FileUpload" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartWrapper" %>
<%@ page import="java.util.Map" %>
<%
    MultipartRequest multipartRequest = FileUpload.createMultReq(request);
    String filename = FileUpload.uploadPhoto(request,multipartRequest);
    PostVO post = new PostVO(
            Integer.parseInt(multipartRequest.getParameter("id")),
            multipartRequest.getParameter("author"),
            multipartRequest.getParameter("email"),
            multipartRequest.getParameter("title"),
            multipartRequest.getParameter("content"),
            null,
            null,
            filename,
            multipartRequest.getParameter("category"),
            Integer.parseInt(multipartRequest.getParameter("likes")),
            multipartRequest.getParameter("color"),
            multipartRequest.getParameter("public")!=null
    );
    PostDAO.updatePost(post);
    response.sendRedirect("./");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    ${pageContext.request.contextPath}/upload/<%=filename%><br>
    <img src="${pageContext.request.contextPath}/upload/<%=filename%>">
    <%=filename%>
</body>
</html>
