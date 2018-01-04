<script>


    function load_preventive_data() {
        //console.log(jq("#personUuid").val());
        var OpenMRSInstance=window.location.href;

        // jq("#personUuid").val()
        var promise_to_load_relationships = new Promise((resolve, reject)=>{ // load relationships for user
                jq.get(OpenMRSInstance.split("/patientportaltoolkit")[0]+'/ws/patientportaltoolkit/getownrelationships/', function (data) {
                    resolve(data);
                });
            })
            .then((data)=>{
                console.log(data);
            })
    }


</script>




${ ui.includeFragment("patientportaltoolkit", "connections/removeRelationship") }
${ ui.includeFragment("patientportaltoolkit", "connections/addRelationship") }
${ ui.includeFragment("patientportaltoolkit", "connections/editRelationshipModal") }


<% if (user.getPerson().isPatient()){ %>
    <div class="clearfix">
        <div class="button-div pull-right">
            <button type="button" class="btn btn-default pad-left" data-toggle="modal" data-target="#add-relationship-modal">Add Connections</button>
        </div>
    </div>
<% } %>
<div class="clearfix" id="friends-list">


    <% if (relationships) { %>
    <div>
    <% relationships.each { relationship -> %>
    <ul class="media-list">
        <% if (user.getPerson().isPatient() && relationship.getRelatedPerson()==user.getPerson() && relationship.getPerson().isPatient() && relationship.getShareStatus()==0){%>
        ${ ui.includeFragment("patientportaltoolkit", "connectionsTwoDirection", [twoDirectionFragmentPerson: relationship.getPerson(), twoDirectionFragmentRelation: relationship, twoDirectionFragmentSide:"bIsToA",twoDirectionFragmentAccepted:false]) }
        <% } %>
        <% if (!user.getPerson().isPatient() && relationship.getShareStatus()==0){%>
        ${ ui.includeFragment("patientportaltoolkit", "connectionsOneDirection", [oneDirectionFragmentPerson: relationship.getPerson(), oneDirectionFragmentRelation: relationship, oneDirectionFragmentSide:"other",oneDirectionFragmentAccepted:false]) }
        <% } %>
    </ul>
    <% } %>

    <% relationships.each { relationship -> %>
    <ul class="media-list">
    <% if (user.getPerson().isPatient() && relationship.getRelatedPerson()==user.getPerson() && relationship.getPerson().isPatient() && relationship.getShareStatus()==1){%>
    ${ ui.includeFragment("patientportaltoolkit", "connectionsTwoDirection", [twoDirectionFragmentPerson: relationship.getPerson(), twoDirectionFragmentRelation: relationship, twoDirectionFragmentSide:"bIsToA",twoDirectionFragmentAccepted:true]) }
    <% } %>
    <% if (user.getPerson().isPatient() && relationship.getPerson()==user.getPerson() && relationship.getRelatedPerson().isPatient() && relationship.getShareStatus()==1){%>
    ${ ui.includeFragment("patientportaltoolkit", "connectionsTwoDirection", [twoDirectionFragmentPerson: relationship.getRelatedPerson(), twoDirectionFragmentRelation: relationship, twoDirectionFragmentSide:"aIsToB",twoDirectionFragmentAccepted:true]) }
    <% } %>
    <% if (user.getPerson().isPatient() && relationship.getPerson()==user.getPerson() && !relationship.getRelatedPerson().isPatient() && relationship.getShareStatus()==1){%>
    ${ ui.includeFragment("patientportaltoolkit", "connectionsOneDirection", [oneDirectionFragmentPerson: relationship.getRelatedPerson(), oneDirectionFragmentRelation: relationship, oneDirectionFragmentSide:"patient",oneDirectionFragmentAccepted:true]) }
    <% } %>
    <% if (!user.getPerson().isPatient() && relationship.getShareStatus()==1){%>
    ${ ui.includeFragment("patientportaltoolkit", "connectionsOneDirection", [oneDirectionFragmentPerson: relationship.getPerson(), oneDirectionFragmentRelation: relationship, oneDirectionFragmentSide:"other",oneDirectionFragmentAccepted:true]) }
    <% } %>
</ul>
    <% } %>

    </div>
    <% } else { %>
    There are no connections for you yet!
    <% } %>
</div>

<script>

//------------- Edit Relation Button JS ---------
    jq('.editRelationButton').click( function () {
            var relationshipID=this.id.split('relationedit')[1];
            jq("#editRelationshipIdHolder").val(relationshipID);

            jq("#editPersonName").text(jq('#'+relationshipID+'relationPerson').text());
            jq("#editRelationProfileBadge").text(jq('#'+relationshipID+'relationPerson').text().match(/\b(\w)/g).join(''));
            jq("#editRelationshipSelect").val(jq('#'+relationshipID+'relationType').text());
            jq("#editRelationSecurityLevels").val(jq('#'+relationshipID+'relationShareID').val());
            if(jq('#checkPersonInRelation'+relationshipID).val()== "0"){
                jq("#editRelationshipSelect").attr('disabled',true);
            }

            jq.ajax({
                type : "POST",
                url : OpenMRSInstance.split("/patientportaltoolkit")[0]+"/ws/patientportaltoolkit/hasaccess",
                data : {
                    relationshipId: relationshipID,
                    shareType: "6776d050-e2fe-47cc-8af4-de3fdeb1b76d"
        },
                success : function setChecked(response) {
                    if (response) {
                        jq("#editShareType" + "6776d050-e2fe-47cc-8af4-de3fdeb1b76d").prop('checked', true);
                    }
                    else {
                        jq("#editShareType" + "6776d050-e2fe-47cc-8af4-de3fdeb1b76d").prop('checked', false);
                    }
                },
                error : function(e) {
                    alert('Error: ' + e);
                },
            });
            jq.ajax({
                type : "POST",
                url : OpenMRSInstance.split("/patientportaltoolkit")[0]+"/ws/patientportaltoolkit/hasaccess",
                data : {
                    relationshipId: relationshipID,
                    shareType: "18e440a6-518b-4dbd-8057-dd0f88ee6d15"
                },
                success : function setChecked(response) {
                    if (response) {
                        jq("#editShareType" + "18e440a6-518b-4dbd-8057-dd0f88ee6d15").prop('checked', true);
                    }
                    else {
                        jq("#editShareType" + "18e440a6-518b-4dbd-8057-dd0f88ee6d15").prop('checked', false);
                    }
                },
                error : function(e) {
                    alert('Error: ' + e);
                },
            });
            jq.ajax({
                type : "POST",
                url : OpenMRSInstance.split("/patientportaltoolkit")[0]+"/ws/patientportaltoolkit/hasaccess",
                data : {
                    relationshipId: relationshipID,
                    shareType: "c21b5749-5972-425b-a8dc-15dc8f899a96"
                },
                success : function setChecked(response) {
                    if (response) {
                        jq("#editShareType" + "c21b5749-5972-425b-a8dc-15dc8f899a96").prop('checked', true);
                    }
                    else {
                        jq("#editShareType" + "c21b5749-5972-425b-a8dc-15dc8f899a96").prop('checked', false);
                    }
                },
                error : function(e) {
                    alert('Error: ' + e);
                },
            });
        });

</script>
