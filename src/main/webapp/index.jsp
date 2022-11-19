<%@ page import="we.snappost.vo.PostVO" %>
<%@ page import="java.util.List" %>
<%@ page import="we.snappost.dao.PostDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    List<PostVO> list = PostDAO.getPostList();
    if(request.getParameter("keyword")!=null){
        if(request.getParameter("field")!=null){
            String field = request.getParameter("field");
            String par = request.getParameter("keyword");
            switch (field){
                case "title":
                    list.removeIf((post)->!post.getTitle().contains(par));
                    break;
                case "author":
                    list.removeIf((post)->!post.getAuthor().contains(par));
                    break;
                case "content":
                    list.removeIf((post)->!post.getContent().contains(par));
                    break;
                case "titleNcontent":
                    list.removeIf((post)->!post.getTitle().contains(par)&&!post.getContent().contains(par));
                    break;
            }
        }
    }
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>포스트</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }
    </style>

    <script>
        function setDelete(ind){
            document.getElementById("deleteValue").value = ind;
        }
    </script>
</head>
<body>

<header>
    <div class="navbar navbar-dark bg-dark shadow-sm">
        <div class="container">
            <a href="#" class="navbar-brand d-flex align-items-center">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="me-2" viewBox="0 0 24 24"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
                <strong>SnapPost</strong>
            </a>
        </div>
    </div>
</header>

<main>

    <section class="py-5 text-center container">
<%--        <div class="row py-lg-5">--%>
<%--            <div class="col-lg-6 col-md-8 mx-auto">--%>
<%--                <h1 class="fw-light">Album example</h1>--%>
<%--                <p class="lead text-muted">Something short and leading about the collection below—its contents, the creator, etc. Make it short and sweet, but not too short so folks don’t simply skip over it entirely.</p>--%>
<%--                <p>--%>
<%--                    <a href="#" class="btn btn-primary my-2">Main call to action</a>--%>
<%--                    <a href="#" class="btn btn-secondary my-2">Secondary action</a>--%>
<%--                </p>--%>
<%--            </div>--%>
<%--        </div>--%>
    </section>
    <div class="container">
        <div class="row justify-content-end">
            <div class="col col-md-6">
                <form action="index.jsp" class="d-flex mb-1">
                    <select name="field" class="form-select me-3 p-2">
                        <option disabled selected style="display: none">검색 범위 선택</option>
                        <option value="title">제목</option>
                        <option value="author">작성자</option>
                        <option value="content">내용</option>
                        <option value="titleNcontent">제목 및 내용</option>
                    </select>
                    <input type="text" name="keyword" placeholder="검색어를 입력하세요" class="form-text form-control me-3">
                    <button type="submit" class="btn btn-success rounded-3 bi bi-search"></button>
                </form>
            </div>
        </div>
    </div>
    <div class="album py-5 bg-light">
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <c:forEach var="post" items="<%=list%>" begin="0" end="<%=list.size()%>">
                    <div class="col">
                        <div class="card shadow-sm border-${post.color}">
                            <img class="bd-placeholder-img card-img-top" style="object-fit: cover" width="100%" height="225" src="${pageContext.request.contextPath}/upload/${post.photo}" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/></img>
                            <c:if test="${!post.publ}">
                                <div class="card-img-overlay p-0">
                                    <div class="h-50 rounded-2 p-2" style="background-color: rgba(255,255,255,60%);">
                                        <i class="bi bi-lock-fill"></i>
                                    </div>
                                </div>
                            </c:if>
                            <div class="card-body">
                                <h4 class="card-title" style="font-weight: bold">${post.title}</h4>
                                <h6 class="card-subtitle text-muted mb-2"> ∙ ${post.author}<br>
                                    <a>${post.email}</a></h6>
                                <p class="card-text">${post.content}</p>
                            </div>
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <small class="text-muted"><i class="bi bi-hand-thumbs-up"></i> ${post.likes}</small>
                                    <small class="text-muted">${post.category}</small>
                                </div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <form action="./edit.jsp" method="post">
                                            <input type="hidden" name="id" value="${post.id}">
                                            <button type="submit" class="btn btn-sm btn-outline-secondary bi bi-pencil"></button>
                                        </form>
                                        <button type="button" class="btn btn-sm btn-outline-danger bi bi-trash3" data-bs-toggle="modal" data-bs-target="#deleteConfirm" onclick="setDelete(${post.id})"></button>
                                    </div>
                                    <small class="text-muted">${post.modDate}</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="my-5 d-flex flex-row-reverse">
            <a class="btn btn-primary bi bi-file-earmark-plus" href="./add.jsp"> 포스트 추가</a>
        </div>
    </div>

</main>

<footer class="text-muted py-5">
    <div class="container">
        <p class="float-end mb-1">
            <a class="bi bi-arrow-bar-up" href="#" style="text-decoration: none"> 맨 위로</a>
        </p>
        <p class="mb-0">
            푸터에 뭐라 써야 하는지 모르겠어서 일단 아무거나 쓰고 있습니다아
        </p>
    </div>
</footer>
<div class="modal fade" id="deleteConfirm" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalLabel">삭제 확인</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                정말로 삭제하시겠습니까?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <form method="post" action="./delete_ok.jsp">
                    <input type="hidden" name="id" id="deleteValue">
                    <button type="submit" class="btn btn-danger">확인</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>