<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${sessionScope.language}"/>
<fmt:setBundle basename="translations"/>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Andrey Shop</title>
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/shop-homepage.css" rel="stylesheet">
    <script src="../../js/itemList.js" async></script>
    <script src="../../js/jquery.js"></script>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<div class="row banner-wrap">
    <div class="col-md-12">

        <img class="slide-image" src="../../img/1.jpg" alt="">

    </div>
</div>


<!-- Page Content -->
<div class="container">

    <div class="row">

        <div class="col-md-3">
            <p class="lead">Andrey Shop</p>
            <form class="form-inline" method="post" action="/andrey-shop">
                <div class="form-group">
                    <input class="form-control input-sm" type="text" name="like">
                </div>
                <button type="submit" class="btn btn-default">Поиск</button>
                </form>
            <div class="list-group">
                <a id="toggler" href="#" class="list-group-item"><fmt:message key="index.itemList"/></a>
                <a  href="/andrey-shop?order=name" class="list-group-item">по имени</a>
                <a href="/andrey-shop?order=price" class="list-group-item">по цене</a>
            </div>
        </div>


        <div class="col-md-9">
            <c:forEach var="item" items="${requestScope.list}">
                <div style="display: block;" class="row block ">
                    <div class="col-md-12">
                        <div class="thumbnail">
                            <div class="row">
                                <div class="col-md-3">
                                    <img src="${item.image}" class="img-responsive" alt="">
                                </div>
                                <div class="col-md-9">
                                    <div class="caption ">
                                        <h4 class="pull-right">$${item.price}</h4>
                                        <h4><a href="/shop-item?image=${item.image}
                      &name=${item.name}&description=${item.description}&price=${item.price}">${item.name}</a>
                                        </h4>
                                        <p>${item.description}</p>
                                        <a class="btn btn-primary" href="/shop-item?image=${item.image}
                      &name=${item.name}&description=${item.description}&price=${item.price}"><fmt:message
                                                key="index.more"/>
                                            <span class="glyphicon glyphicon-chevron-right"></span></a>
                                        <c:if test="${sessionScope.userData != null}">
                                            <c:choose>
                                                <c:when test="${item.remainingAmount=='0'}">
                                                    <p class="pull-right"><span>
                                                        <fmt:message key="index.NotInStok"/>
                                                    </span></p>
                                                </c:when>
                                                <c:otherwise>
                                                    <a class="btn btn-link pull-right add_in_bag"
                                                       href="/addToBag?itemId=${item.id}"><fmt:message
                                                            key="index.addToBag"/>
                                                        <span class="glyphicon glyphicon-chevron-right"></span></a>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </c:forEach>


        </div>
        <!-- /.container -->

        <div class="container">

            <hr>

            <!-- Footer -->
            <footer>
                <div class="row">
                    <div class="col-lg-11">
                        <p>Copyright &copy; Andrey Shop 2017</p>
                    </div>
                    <div class="col-lg-1">
                        <p><a class="btn btn-lin" href="/download"><fmt:message key="footer.report"/>
                            <span class="glyphicon glyphicon-file"></span></a></p>
                    </div>

                </div>
            </footer>

        </div>
        <!-- /.container -->
    </div>
</div>
<script src="../../js/bootstrap.min.js"></script>
</body>
</html>