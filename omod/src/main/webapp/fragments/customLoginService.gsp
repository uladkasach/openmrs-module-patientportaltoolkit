
<div class="modal-dialog" style = 'margin:auto;  '>
    <div class="loginmodal-container" style = 'min-width:400px;'>
        <h1>Welcome</h1><br>
        <div style = 'text-align:center;'>
            To the Personal Cancer Toolkit Platform.
        </div>
    </div>
</div>

<div style = 'height:50px;'></div>

<div class="modal-dialog" style = 'margin:auto;  '>
    <div class="loginmodal-container" style = 'min-width:400px;'>
        <h1>Login</h1><br>

        <input type="text" id = 'username' name="user" placeholder="Username">
        <input type="password" id = 'password' name="pass" placeholder="Password">
        <input type="submit" name="login" class="login loginmodal-submit" value="Login" onclick = 'attempt_login()'>

        <div style = "font-size: 12px;">
        <!-- 
        <a href="#">Register</a> 
          - 
        -->
        <a href="javascript:alert('Coming Soon!');">Forgot Password</a>
        </div>
    </div>
</div>


<script>
    function attempt_login(){
        if(document.getElementById("username").value == "" || document.getElementById("password").value == ""){
            alert("Please ensure both username and password are filled out.");
            return;
        }
        jq.post("", {
            username:document.getElementById("username").value,
            password:document.getElementById("password").value
        }, function (response) {
            //console.log(response);
            location.reload();
        });
    }
</script>