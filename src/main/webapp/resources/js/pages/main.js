function sendReport() {
    var authorName = $("#authorName").val();
    var title = $("#title").val();
    var text = $("#text").val();
    var email = $("#email").val();
    var facultyId = $("#facultyId").val();

    $.ajax({
        type: "POST",
        url: domainURL + "sendAppApp",
        dataType: "text",
        async: false,
        data: { authorName: authorName, title: title, text: text , email: email, facultyId: facultyId},
        timeout: 30000
    }).done(function (data) {
        document.getElementById("infoSuccess").style.display = "";
        setTimeout(redirect, 1000);
        function redirect() { document.location.href = domainURL; }
    }).fail(function (error) {
        alert("Connection error or such entity already exists.");
        setTimeout(redirect, 500);
        function redirect() { document.location.href = domainURL; }
    });
}

function reportBug() {
    var problem = $("#problem").val();
    var authorName = $("#yourName").val();
    var email = $("#yourEmail").val();

    $.ajax({
        type: "POST",
        url: domainURL + "reportBug",
        dataType: "text",
        async: false,
        data: { problem: problem , authorName: authorName, email: email},
        timeout: 30000
    }).done(function (data) {
        document.getElementById("bugSendSuccess").style.display = "";
        setTimeout(redirect, 1500);
        function redirect() { document.location.href = domainURL; }
    }).fail(function (error) {
        alert("Network connection error...");
        setTimeout(redirect, 500);
        function redirect() { document.location.href = domainURL; }
    });
}

function addSkill() {
    var skillName = $("#skillName").val();
    var skillDesc = $("#skillDesc").val();

    $.ajax({
        type: "POST",
        url: domainURL + "addSkill",
        dataType: "text",
        async: false,
        data: { skillName: skillName , skillDesc: skillDesc},
        timeout: 30000
    }).done(function (data) {
        location.reload();
    }).fail(function (error) {
        alert("Network connection error...");
        setTimeout(redirect, 500);
        function redirect() { document.location.href = domainURL; }
    });
}

