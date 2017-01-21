<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Andrey Shop</title>
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/shop-homepage.css" rel="stylesheet">
    <script src="../../js/itemList.js" async></script>
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
        <div class="list-group">
          <a id="toggler" href="#" class="list-group-item">Скрыть список товаров</a>
        </div>
      </div>


      <div class="col-md-9">
        <c:forEach var="item" items="${sessionScope.list}">
          <div style="display: block;" class="row block">
            <div class="col-md-12">
              <div class="thumbnail">
                <div class="row">
                  <div class="col-md-3">
                    <img src="${item.image}" class="img-responsive" alt="">
                  </div>
                  <div class="col-md-9">
                    <div class="caption">
                      <h4 class="pull-right">$${item.price}</h4>
                      <h4><a href="/shop-item?image=${item.image}
                      &name=${item.name}&description=${item.description}&price=${item.price}">${item.name}</a>
                      </h4>
                      <p>${item.description}</p>
                      <a class="btn btn-primary" href="/shop-item?image=${item.image}
                      &name=${item.name}&description=${item.description}&price=${item.price}">Подробнее
                        <span class="glyphicon glyphicon-chevron-right">
                      </span></a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </c:forEach>


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