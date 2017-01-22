<%--
  Created by IntelliJ IDEA.
  User: Andrey
  Date: 18.01.2017
  Time: 1:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${param.language}" />
<fmt:setBundle basename="translations" />
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Shop Item</title>

    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/shop-homepage.css" rel="stylesheet">
</head>
<body>

<jsp:include page="navbar.jsp"/>
<div class="container">
    <div class="row">

        <div class="col-md-8">
            <img src="${param.image}" class="img-responsive" >
        </div>

        <div class="col-md-4">
            <h3>${param.name}</h3>
            <p>${param.description}</p>
            <h3>$${param.price}</h3>
        </div>

    </div>


</div>
<!-- /.container -->

<div class="container">

    <hr>

    <!-- Footer -->
    <footer>
        <div class="row">
            <div class="col-lg-12">
                <p>Copyright &copy; Andrey Shop 2017</p>
            </div>
        </div>
    </footer>

</div>
<!-- /.container -->


<script src="../../js/jquery.js"></script>
<script src="../../js/bootstrap.min.js"></script>
</body>
</html>
