/**
 * Created by Maurya on 22/06/2015.
 */
jq = jQuery;
jq(document).ready(function(){
    jq(".journalComment").keydown(
        function (event) {

            if (event.which == 13) {
                var journalID=(this.id).split("commentbox")[1];
                console.log(journalID);
                jq.get("commentBox/saveComment.action", {commentContent: this.value, parentId:journalID}, function(){
                    location.reload();
                });
                return false;
            }


        });
    jq("#statusUpdaterButton").click(
        function () {
            jq.get("statusUpdater/savePost.action", {title: jq("#statusUpdaterTitle").val(), content:jq("#statusUpdaterContent").val()}, function(){
                location.reload();
            });
        });
    jq(".removeRelationCloseButton").click(
        function () {
            jq("#remove-relationId").val(this.id.split("removeRelation")[1]);
        });
    jq("#relation-delete-btn").click(
        function () {
            jq.get("removeRelationship/removeRelationship.action", {relationshipId:  jq("#remove-relationId").val()}, function(){
                location.reload();
            });
        });
});