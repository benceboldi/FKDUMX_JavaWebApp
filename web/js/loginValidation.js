function validateLoginForm()
{
    var usernameInput = document.getElementById("username").value;
    var passwordInput = document.getElementById("password").value;

    var minlength = 5;
    var maxlength = 13;

    if( ( usernameInput.length > minlength && usernameInput.length < maxlength)
        ||
        (passwordInput.length > minlength && passwordInput.length < maxlength)
    )
    {
        document.getElementById("loginForm").submit();
    }
    else
    {
        alert("Please Input Username or Password in valid format");
        returnToPreviousPage();
        return false;
    }
}