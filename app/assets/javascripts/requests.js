
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
    var requestBodyEditor = new JSONEditor(requestBodyContainer, requestEditorOptions);


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
            var method = $('#request_method').val()
            //var url = 'http://back.dev.shr.phoenixit.ru/api/v0';
            var url = new URL(urlString)
            console.log(url.origin)
            $.ajax({
                url: urlString,
                type: method,
                beforeSend: function(xhrObj){
                    xhrObj.setRequestHeader("Access-Control-Allow-Origin", url.origin);
                    xhrObj.setRequestHeader("Content-Type","application/json");
                    xhrObj.setRequestHeader("Accept","application/json");
                },
                success: function(result) {
                    prettyResponseEditor.set(result);
                    $('#response-raw-block').text(JSON.stringify(result));
                    $('#response-preview-block').html(JSON.stringify(result));
                }
            });
            $.get( urlString/*, {paramOne : 1, paramX : 'abc'}*/,
                function(data) {
                    
                    console.log(data);
                }
            )
        });

});


{/* <option value="GET">GET</option>
<option value="POST">POST</option>
<option value="PUT">PUT</option>
<option value="PATCH">PATCH</option>
<option value="DELETE">DELETE</option> */}