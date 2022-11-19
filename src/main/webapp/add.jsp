<%--
  Created by IntelliJ IDEA.
  User: daiks
  Date: 2022-11-18
  Time: 오전 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <title>게시물 추가</title>
    <style>
        textarea{
            height: 200px;
            resize: none;
        }
        label{
            margin-bottom: 5px;
        }
        form div{
            margin-bottom: 20px;
        }
        .form-invalid{
            color: #ff6666;
            margin-top: 5px ;
            font-size: x-small;
            display: none;
        }
    </style>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            let elements = document.getElementsByTagName("input");
            for (let i = 0; i < elements.length; i++) {
                elements[i].oninvalid = function (e) {
                    e.target.setCustomValidity("");
                }
            }
            document.getElementById("form-date").min = new Date().toISOString().split("T")[0];
        })
        function beforeSubmit(){
            let valid = [false, false, false, false, false, false, false]
            //console.log(document.getElementById("form-author").checkValidity())
            if(!document.getElementById("form-title").checkValidity()){
                document.getElementById("form-title-invalid").style.display = "block";
            }else{
                document.getElementById("form-title-invalid").style.display = "none";
                valid[0] = true
            }
            if(!document.getElementById("form-author").checkValidity()){
                document.getElementById("form-author-invalid").style.display = "block";
            }else{
                document.getElementById("form-author-invalid").style.display = "none";
                valid[1] = true
            }
            if(!document.getElementById("form-content").checkValidity()){
                document.getElementById("form-content-invalid").style.display = "block";
            }else{
                document.getElementById("form-content-invalid").style.display = "none";
                valid[2] = true
            }
            if(document.getElementById("form-category").value==="0"){
                document.getElementById("form-category-invalid").style.display = "block";
            }else{
                document.getElementById("form-category-invalid").style.display = "none";
                valid[3] = true
            }
            if(!document.getElementById("form-file").checkValidity()){
                document.getElementById("form-file-invalid").style.display = "block";
            }else{
                document.getElementById("form-file-invalid").style.display = "none";
                valid[4] = true
            }
            if(!document.getElementById("form-likes").checkValidity()){
                document.getElementById("form-likes-invalid").style.display = "block";
            }else{
                document.getElementById("form-likes-invalid").style.display = "none";
                valid[5] = true
            }
            if(!document.getElementById("form-email").checkValidity()){
                document.getElementById("form-email-invalid").style.display = "block";
            }else{
                document.getElementById("form-email-invalid").style.display = "none";
                valid[6] = true
            }
            if(valid[0]&&valid[1]&&valid[2]&&valid[3]&&valid[4]&&valid[5]&&valid[6]){
                console.log(valid)
                document.getElementById("form").submit();
            }
        }

        function upDate(val){
            if(val.value==""){
                val.style.borderColor = "#FF6666"
            }else{
                val.style.borderColor = "silver"
                switch (val.id){
                    case "form-title":
                        document.getElementById("form-title-invalid").style.display = "none";
                        break;
                    case "form-author":
                        document.getElementById("form-author-invalid").style.display = "none";
                        break;
                    case "form-content":
                        document.getElementById("form-content-invalid").style.display = "none";
                        break;
                    case "form-date":
                        document.getElementById("form-date-invalid").style.display = "none";
                        break;
                    case "form-file":
                        document.getElementById("form-file-invalid").style.display = "none";
                        break;
                    case "form-email":
                        document.getElementById("form-email-invalid").style.display = "none";
                        break;
                }
            }
        }

        function upDateSel(val){
            if(val.value==0){
                val.s
                tyle.borderColor = "#FF6666"
            }else{
                val.style.borderColor = "silver"
                document.getElementById("form-category-invalid").style.display = "none";
            }
        }

        function upDateNum(val){
            if(val.value<0){
                val.style.borderColor = "#FF6666"
            }else{
                val.style.borderColor = "silver"
                document.getElementById("form-likes-invalid").style.display = "none";
            }
        }
    </script>
</head>
<body>
<div class="header">
    <div class="row justify-content-center">
        <h5 class="col col-6" style="font-size: xx-large; font-weight: bolder; text-align: center">게시물 추가</h5>
    </div>
</div>
<div class="row justify-content-center p-3">
    <div class="col col-12 col-md-3">

    </div>
    <div class="col col-12 col-md-6">
        <form method="post" id="form" action="add_ok.jsp" enctype="multipart/form-data">
            <div>
                <input id="form-title" type="text" class="form-text form-control" placeholder="제목" name="title" required onfocusout="upDate(this)"></input>
                <p id="form-title-invalid" class="form-invalid">제목을 작성해야 합니다</p>
            </div>
            <div class="d-block">
                <input id="form-author" type="text" class="form-control form-text" placeholder="작성자" name="author" required onfocusout="upDate(this)">
                <p id="form-author-invalid" class="form-invalid">작성자를 작성해야 합니다</p>
            </div>
            <div class="d-block">
                <input id="form-email" type="text" class="form-control form-text" placeholder="email@example.com" name="email" required onfocusout="upDate(this)">
                <p id="form-email-invalid" class="form-invalid">이메일을 작성해야 합니다</p>
            </div>
            <div>
                <textarea id="form-content" class="form-text form-control" placeholder="내용" name="content" required onfocusout="upDate(this)"></textarea>
                <p id="form-content-invalid" class="form-invalid">내용을 작성해야 합니다</p>
            </div>
            <div class="d-block">
                <input id="form-file" type="file" class="form-control form-text" placeholder="파일 선택" name="photo" required onfocusout="upDate(this)">
                <p id="form-file-invalid" class="form-invalid">이미지를 업로드 해야 합니다</p>
            </div>
            <div class="col col-12 col-md-4">
                <select id="form-category" class="form-select" name="category" required onfocusout="upDateSel(this)">
                    <option value="0" selected disabled style="display: none" class="form-control">카테고리</option>
                    <option value="잡답">잡답</option>
                    <option value="과제">과제</option>
                    <option value="질문">질문</option>
                    <option value="거래">거래</option>
                </select>
                <p id="form-category-invalid" class="form-invalid">카테고리를 선택해야 합니다</p>
            </div>
            <div class="col col-12 col-md-4">
                <input id="form-likes" type="number" name="likes" class="form-control col col-12 col-md-3" placeholder="추천수" min="0" required onfocusout="upDateNum(this)">
                <p id="form-likes-invalid" class="form-invalid">추천수를 입력해야 합니다</p>
            </div>
            <div class="col col-12 col-md-12">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" value="default" name="color" id="form-color1" checked>
                    <label class="form-check-label card" for="form-color1">
                        Default Card
                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" value="primary" name="color" id="form-color2">
                    <label class="form-check-label border-primary card" for="form-color2">
                        Blue Card
                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" value="secondary" name="color" id="form-color3">
                    <label class="form-check-label border-secondary card" for="form-color3">
                        Grey Card
                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" value="success" name="color" id="form-color4">
                    <label class="form-check-label border-success card" for="form-color4">
                        Green Card
                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" value="danger" name="color" id="form-color5">
                    <label class="form-check-label card border-danger" for="form-color5">
                        Red Card
                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" value="warning" name="color" id="form-color6">
                    <label class="form-check-label card border-warning" for="form-color6">
                        Yellow Card
                    </label>
                </div>
            </div>
            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" role="switch" name="public" id="form-public" checked>
                <label class="form-check-label" for="form-public">공개설정</label>
            </div>
            <div class="justify-content-end d-flex">
                <button type="reset" class="btn btn-secondary ms-2">취소</button>
                <button class="btn btn-primary ms-2" onclick="beforeSubmit()">저장</button>
            </div>
        </form>
    </div>
    <div class="col col-12 col-md-3">
    </div>
</div>
</body>
</html>