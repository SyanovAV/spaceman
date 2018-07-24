
$('document').ready(function() {

    var requestBodyContainer = document.getElementById("jsoneditor-request-body");
    var requestEditorOptions = {
        mode: 'code',
        modes: ['code', 'form', 'text', 'tree', 'view'], // allowed modes
        onError: function (err) {
          alert(err.toString());
        },
        onModeChange: function (newMode, oldMode) {
          console.log('Mode switched from', oldMode, 'to', newMode);
        }
    };
    // var requestBodyEditor = new JSONEditor(requestBodyContainer, requestEditorOptions);


    var prettyResponseContainer = document.getElementById("jsoneditor-pretty-response");
    var responseEditorOptions = {
        mode: 'view',
        modes: ['form', 'text', 'tree', 'view'],
        onError: function (err) {
          alert(err.toString());
        }
    };
    var prettyResponseEditor = new JSONEditor(prettyResponseContainer, responseEditorOptions);

    $('#send').on('click', function() {
        var urlString = $('#request_url').val()
        var url = new URL(urlString)
        console.log(url.origin)
        var method = $('#request_method').val()
        var body = requestBodyEditor.get();
        var settings = {
            "async": true,
            "crossDomain": true,
            "url": urlString,
            "method": method,
            "headers": {
                "Content-Type": "application/json",
                "Cache-Control": "no-cache"
            },
            "processData": false,
            "data": JSON.stringify(body)
        }
        //var url = 'http://back.dev.shr.phoenixit.ru/api/v0';
        
        $.ajax(settings).done(function (response) {
            prettyResponseEditor.set(response);
            $('#response-raw-block').text(JSON.stringify(response));
            $('#response-preview-block').html(JSON.stringify(response));
        });
    });
});


{/* <option value="GET">GET</option>
<option value="POST">POST</option>
<option value="PUT">PUT</option>
<option value="PATCH">PATCH</option>
<option value="DELETE">DELETE</option> */}