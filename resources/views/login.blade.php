@include('header') 

<center><h1>User Login</h1></center>
<br>
<form method="post" action="/login/try">
 @csrf
<table>
    <tr>
        <td>Email</td>
        <td><input type="text" name="email" id="email"></td>
    </tr>
    <tr>
        <td>Password</td>
        <td><input type="password" name="password" id="password"></td>
    </tr>
    <tr>
        <td colspan="2"><input type="submit" value="Log in"></td>
    </tr>
</table>
</form>

@include('footer') 
