<%--
  Created by IntelliJ IDEA.
  User: Andrey
  Date: 20.01.2017
  Time: 1:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Andrey Shop</title>
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <title>Регистрация</title>
</head>
<body>
<div class="container">

    <div class="row">
        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
            <form action="/registration" role="form" method="post">
                <h2>Пожалуйста, зарегистрируйтесь</h2>
                <hr class="colorgraph">
                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <input type="text" name="firstName" id="firstName" class="form-control input-lg" placeholder="Имя" tabindex="1">
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <input type="text" name="lastName" id="lastName" class="form-control input-lg" placeholder="Фамилия" tabindex="2">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <input type="email" name="email" id="email" class="form-control input-lg" placeholder="Email Address" tabindex="3">
                </div>
                <div class="form-group">
                    <input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password" tabindex="4">
                </div>
                <div class="form-group">
                    <input type="phone" name="phoneNumber" id="phoneNumber" class="form-control input-lg" placeholder="Phone Number" tabindex="3">
                </div>
                <div class="form-group">
                    <input type="address" name="address" id="address" class="form-control input-lg" placeholder="Address" tabindex="3">
                </div>

                <hr class="colorgraph">
                <div class="row">
                    <div class="col-xs-12 col-md-12"><button type="submit" class="btn btn-success btn-block btn-lg">Зарегистрироваться</button></div>
                </div>
            </form>
        </div>
    </div>


</div>
</div>
</div>
</div>


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