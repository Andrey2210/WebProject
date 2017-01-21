<%--
  Created by IntelliJ IDEA.
  User: Andrey
  Date: 21.01.2017
  Time: 3:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/login.css" rel="stylesheet">
    <title>Login</title>
</head>
<body>
<div class="container">
    <form action="/login" class="form-signin" role="form" method="post">
        <input type="hidden" name="command" value="login" />
        <h2 class="form-signin-heading">Вход</h2>
        <div class="form-group">
            <input type="email" name="email" class="form-control" placeholder="Email" required="" autofocus="">
        </div>
        <div class="form-group">
            <input type="password" name="password" class="form-control" placeholder="Пароль" required="">
        </div>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Войти</button>
    </form>

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
