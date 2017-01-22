<%--
  Created by IntelliJ IDEA.
  User: Andrey
  Date: 19.01.2017
  Time: 2:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${param.language}" />
<fmt:setBundle basename="translations" />
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Andrey Shop</title>
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dashboard.css" rel="stylesheet">
    <title>Dashboard</title>
    <script src="../../js/dashboard.js" async></script>
</head>

<body>

<jsp:include page="navbar.jsp"/>

<div class="col-sm-3 col-md-2 sidebar">
    <ul class="nav nav-sidebar ">
        <li><a id="customers" href="#customersBlock" class="tt open"><span
                class="glyphicon glyphicon glyphicon-user"></span>
            Пользователи</a></li>
        <li><a id="orders" href="#ordersBlock" class="tt open"><span
                class="glyphicon glyphicon glyphicon-list-alt"></span> Заказы</a></li>
        <li><a id="items" href="#itemsBlock" class="tt open"><span
                class="glyphicon glyphicon glyphicon-upload"></span> Товары</a></li>
    </ul>
</div>

<div id="customersBlock" style="display: block" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h1 class="page-header">Список Пользователей</h1>

    <div class="table-responsive zzz">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>ID</th>
                <th>Имя</th>
                <th>Фамилия</th>
                <th>Email</th>
                <th>Пароль</th>
                <th>Телефон</th>
                <th>Адресс</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="customer" items="${requestScope.customerList}">
                <tr>
                    <td>${customer.id}</td>
                    <td>${customer.firstName}</td>
                    <td>${customer.lastName}</td>
                    <td>${customer.email}</td>
                    <td>${customer.password}</td>
                    <td>${customer.phoneNumber}</td>
                    <td>${customer.addres}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div id="ordersBlock" style="display: none" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h1 class="page-header">Список Заказов</h1>
    <div class="table-responsive zzz">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>ID</th>
                <th>ID Пользователя</th>
                <th>Дата принятия заказа</th>
                <th>Дата закрытия заказа</th>
                <th>Статус</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="order" items="${requestScope.orderList}">
                <tr>
                    <td>${order.orderNumber}</td>
                    <td>${order.customerID}</td>
                    <td>${order.checkoutDate}</td>
                    <td>${order.closedDate}</td>
                    <td>${order.orderStatus}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<div id="itemsBlock" style="display: none" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h1 class="page-header">Добавить товар</h1>
    <form action="/dashboard" role="form" method="post">
        <div class="form-group">
            <label>Название товара</label>
            <input type="text" name="itemName" class="form-control" size="">
        </div>

        <div class="form-group">
            <label>Описание товара</label>
            <textarea type="text" name="itemDescription" class="form-control" rows="3"></textarea>
        </div>

        <div class="form-group">
            <label>Цена</label>
            <input type="number" name="itemPrice" class="form-control">
        </div>

        <div class="form-group">
            <label>Количество</label>
            <input type="number" name="itemAmount" class="form-control">
        </div>

        <div class="form-group">
            <label>Вставить картинку</label>
            <input name="itemImage" type="file" accept="image/*">
        </div>

        <button type="submit" class="btn btn-default">Подтвердить</button>
    </form>

    <h1 class="page-header">Список Товаров</h1>
    <div class="table-responsive zzz">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>ID</th>
                <th>Название</th>
                <th>Описание</th>
                <th>Цена</th>
                <th>Остаток на скалде</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${requestScope.itemList}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.name}</td>
                    <td>${item.description}</td>
                    <td>${item.price}</td>
                    <td>${item.remainingAmount}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="container">


    <script src="../../js/jquery.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
</body>
</html>
