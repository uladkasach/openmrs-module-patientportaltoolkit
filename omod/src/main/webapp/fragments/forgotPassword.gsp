<div id="forgotPasswordSnippet" method="post" class="modal-dialog form-group" style = 'margin:auto;  ' hidden>
    <div class="loginmodal-container" style = 'min-width:400px;'>
        <h1>Forgot Password</h1><br>

        <div id="forgotPasswordEmailError" class="alert alert-danger" role="alert" style="display: none">
           <span class="fa fa-exclamation-circle fa-lg"></span>
            Error: Enter a valid email address
        </div>

        <div id="emailIdgroup" class="form-group">
            <label class="control-label" for="forgotPasswordEmail">Email ID</label>
                <input id = 'forgotPasswordEmail' type="email" class="form-control"/>
        </div>
        <input type="submit" name="sendEmail" class="login loginmodal-submit" value="Send Email" onclick = 'sendFogotPasswordEmail()'>

        <p align="left"><a href="javascript:loginForgotSwitch();" style="color: blue">Go Back</a></p>
        <div style = "font-size: 12px;">

        </div>
    </div>
</div>

<script>

    var OpenMRSInstance=window.location.href;
    function sendFogotPasswordEmail(){
        if(document.getElementById("forgotPasswordEmail").value == ""){
            jq("#forgotPasswordEmailError").show();
            jq("#emailIdgroup").addClass("has-error");
            return;
        }
        //alert(document.getElementById("forgotPasswordEmail").value);
        jq.get(OpenMRSInstance.split("/openmrs")[0]+"/openmrs/ws/patientportaltoolkit/sendForgotPasswordEmail/"+document.getElementById("forgotPasswordEmail").value, function(){
            //alert(document.getElementById("forgotPasswordEmail").value);
        });
    }
</script>