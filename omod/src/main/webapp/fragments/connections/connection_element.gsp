<!--
    This file defines the template, the "builder" object, and any relevant css required for a connections element
-->


<script>

/*
    jq(document).ready(function() {
        var OpenMRSInstance = window.location.href;
        jq(".connectionlink").click(
            	        function () {
                            document.location.href = OpenMRSInstance.split("/patientportaltoolkit")[0]+'/patientportaltoolkit/home.page?personId='+this.id.split("connectionlink")[1];
            	        });
    });
*/

window.view.connection = {
    promise_loaded : null,
    template_dom : null,

    build : function(options){
        var element = this.template_dom.cloneNode(true);


        return element;
    },
}

window.view.connection.promise_loaded = window.promise_loaded // define the promise_loaded property of the view
    .then(()=>{
        window.view.connection.template_dom = document.querySelector(".connection_element_template"); // define the template dom elements after the page loads and we know the elements exist
    })








</script>
