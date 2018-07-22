
$('document').ready(function() {
    var container = document.getElementById("jsoneditor");
    var options = {
        mode: 'tree',
        modes: ['code', 'form', 'text', 'tree', 'view'], // allowed modes
        onError: function (err) {
          alert(err.toString());
        },
        onModeChange: function (newMode, oldMode) {
          console.log('Mode switched from', oldMode, 'to', newMode);
        }
    };
    var editor = new JSONEditor(container, options);

    // set json
    var json = {
        "Array": [1, 2, 3],
        "Boolean": true,
        "Null": null,
        "Number": 123,
        "Object": {"a": "b", "c": "d"},
        "String": "Hello World"
    };
    editor.set(json);


        $('#send').on('click', function() {
            var urlString = $('#url')
            var method = $('#url')
            var url = new URL();
            $.get( url/*, {paramOne : 1, paramX : 'abc'}*/,
                function(data) {
                    $('#response').text(data);
                    console.log(data);
                }
            )
        });

});


