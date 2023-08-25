

<html>
<head>
<link rel="stylesheet" href="ExternalCS4.css">
<meta charset="UTF-8">
<title>Insert title here</title>
 <script>
        function validatePassword() {
            var password = document.getElementById("password").value;
            var specialSymbols = /[!@#$%^&*]/;

            if (password.length < 8) {
                alert("Password must be at least 8 characters long.");
                return false;
            }

            if (!specialSymbols.test(password)) {
                alert("Password must contain at least one special symbol.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>

<center>
<table id="login">
<form onsubmit="return validatePassword();"  action="StudentRegistration">
<tr><th colspan=2><h2>Registration Student</h2></th></tr>
<tr>
<td><h3>Enter Name</h3></td><td><input type="text" name="name" required></td>
</tr>


<tr>
<td><h3>Enter E-mail</h3></td><td><input type="email" name="e-mail" required></td>
</tr>
<tr>
<td><h3>Enter Role</h3></td><td><input type="text" name="role" required></td>
</tr>
<tr>
<td><h3>Enter Password</h3></td><td><input type="password" name="password" required></td>
</tr>
<tr>
<td><input type="submit" id="loginbutton"></td><td><input type="submit"  id="loginbutton" value="Goto Login" onclick='window.open("Loginpage.jsp")'></td>
</tr>
</form>
</table>
</center>
</body>
</html>