<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#responsive-menu">
                <span class="sr-only">Открыть навигацию</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" rel="home" href="/andrey-shop">
                <img style="max-width:100px; margin-top: -7px;"
                     src="../../img/logo-primary1.png">
            </a>
        </div>
        <div class="collapse navbar-collapse" id="responsive-menu">
            <ul class="nav navbar-nav">
                <li><a href="/andrey-shop">Главная</a></li>
                <c:if test="${sessionScope.userData.role eq 'admin'}">
                    <li><a href="/dashboard">Панель Управления</a></li>
                </c:if>

            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li>
                    <button type="button" class="btn btn-default navbar-btn">
                        <span class="glyphicon glyphicon-shopping-cart"></span>
                        Корзина
                    </button>
                </li>
                <c:choose>
                    <c:when test="${empty sessionScope.userData}">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Вход <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <form action="/login" style="max-width: 120px; margin-left: 20px" role="form" method="post">
                                    <input type="hidden" name="command" value="login" />
                                <li></li>
                                <li>
                                    <div class="form-group">
                                        <input type="email" name="email" class="form-control" placeholder="Email" required="" autofocus="">
                                    </div>
                                </li>

                                <li>
                                    <div class="form-group">
                                        <input type="password" name="password" class="form-control" placeholder="Пароль" required="">
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                        <button class="btn btn-lg btn-primary btn-block" type="submit">
                                            <span class="glyphicon glyphicon-user"></span>  Войти</button>
                                </li>
                                </form>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <form action="/login" method="post">
                                <input type="hidden" name="command" value="logout" />
                                <button type="submit" class="btn btn-default navbar-btn">
                                    Выход
                                </button>
                            </form>
                        </li>
                    </c:otherwise>
                </c:choose>

            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
