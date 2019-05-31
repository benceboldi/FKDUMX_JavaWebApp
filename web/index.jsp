<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%
  if(session.getAttribute("loggedIn") == "true")
  {
    String url = request.getRequestURL().toString();
    String baseURL = url.substring(0, url.length() - request.getRequestURI().length()) + request.getContextPath() + "/";
    String redirectURL = baseURL+"Welcome";
    response.sendRedirect(redirectURL);
  }
%>

<jsp:include page="layouts/header.jsp">
  <jsp:param name="title" value="Login Page"/>
</jsp:include>
<body>
<div class="jumbotron">
  <h1 class="text-center"><% out.print("Welcome to My Log in Page");%></h1>
</div>

.<div class="row">
  <div class="col-lg-4"></div>
  <div class="col-lg-4">

    <%
      if(session.getAttribute("errorMessage")!= null)
      {
        out.print("<h3 class='text-center text-danger'>Error: "
                +session.getAttribute("errorMessage")
                + "</h3>");
      }
    %>
    <form action="User" method="post" role="form" id="loginForm">
      <div class="form-group">
        <label>Username</label>
        <input type="text" class="form-control input-lg" name="username" id="username" placeholder="Username" required>
      </div>
      <div class="form-group">
        <label>Password</label>
        <input type="password" class="form-control input-lg" name="password" id="password" placeholder="Password" required>
      </div>
      <label id="hint">
        <p>(Az adatbázis csak admin - password párt tartalmazza)</p>
      </label>
      <button type="submit" class="btn btn-warning btn-lg pull-right" name="submit" onclick="validateLoginForm()">Submit</button>
    </form>
  </div>
  <div class="col-lg-4"></div>
</div>
<jsp:include page="layouts/footer.jsp" />
<script src="js/loginValidation.js"></script>
</body>
</html>
