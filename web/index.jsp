<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Andrey Shop</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/shop-homepage.css" rel="stylesheet">

    <script type="text/javascript">
      window.onload= function() {
        document.getElementById('toggler').onclick = function() {
          openbox('block', this);
          return false;
        };
      };
      function openbox(classname, toggler) {
        Array.from(document.getElementsByClassName(classname)).forEach(div=>{
          if(div.style.display == 'block') {
          div.style.display = 'none';
          toggler.innerHTML = 'Список товаров';
        }
      else {
          div.style.display = 'block';
          toggler.innerHTML = 'Скрыть список товаров';
        }
      });

      }
    </script>
  </head>
  <body>
  <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#responsive-menu">
          <span class="sr-only">Открыть навигацию</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" rel="home" href="http://localhost:8080/test">
          <img style="max-width:100px; margin-top: -7px;"
               src="img/logo-primary1.png">
        </a>
      </div>
      <div class="collapse navbar-collapse" id="responsive-menu">
        <ul class="nav navbar-nav">
          <li><a href="#">Главная</a></li>
          <li><a href="#">Пункт 2</a> </li>
          <li><a href="#">Пункт 3</a></li>
        </ul>

        <ul class="nav navbar-nav navbar-right">
          <li>
            <button type="button" class="btn btn-default navbar-btn">
              <span class="glyphicon glyphicon-shopping-cart"></span>
              Корзина
            </button>
          </li>

          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Вход <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="#">Вход</a></li>

              <li>
                <a href="#">
                  <input type="email" class="form-control" placeholder="Email address" required="" autofocus="">
                </a>
              </li>

              <li>
                <a href="#">
                  <input type="password" class="form-control" placeholder="Password" required="">
                </a>
              </li>

              <li class="divider"></li>
              <li>
                <a href="#">
                  <button class="btn btn-lg btn-primary btn-block" type="submit">
                    <span class="glyphicon glyphicon-user"></span>  Войти</button>
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </div>
      <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
  </nav>


  <div class="row banner-wrap">
    <div class="col-md-12">

      <img class="slide-image" src="img/1.jpg" alt="">

    </div>
  </div>


  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-md-3">
        <p class="lead">Andrey Shop</p>
        <div class="list-group">
          <a id="toggler" href="#" class="list-group-item">Список товаров</a>
        </div>
      </div>


      <div class="col-md-9">
        <c:forEach var="item" items="${list}">
          <div style="display: none;" class="row block">
            <div class="col-md-12">
              <div class="thumbnail">
                <div class="row">
                  <div class="col-md-3">
                    <img src="${item.image}" class="img-responsive" alt="">
                  </div>
                  <div class="col-md-9">
                    <div class="caption">
                      <h4 class="pull-right">$${item.price}</h4>
                      <h4><a href="#">${item.name}</a>
                      </h4>
                      <p>${item.description}</p>
                      <a class="btn btn-primary" href="#">View  <span class="glyphicon glyphicon-chevron-right">
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

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>