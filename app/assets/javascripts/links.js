$(document).ready(function() {

  $('tr.true').css({ 'color': 'red' })

  $('tr.link-row').on('click', function(event) {

    if (event.target.innerText === "Edit" || event.target.innerText === "Recommend") {
      return
    } else {

      var buttonText = event.target.text;
      var linkId = event.target.dataset.id;

      event.preventDefault();
      updateStatus(buttonText, linkId);
    }

    function updateStatus (buttonText, linkId) {

      $.ajax({
        url: '/update-status',
        type: 'post',
        data: {link: { id: linkId}},
        success: function(data) {
          var buttonText = event.target.text;

          if ( buttonText.localeCompare("Mark as Read") ) {
            event.target.text = "Mark as Read"

            var linkId = event.target.dataset.id;
            var buildId = "#link-status-" + linkId
            $(buildId).text = 'Read';

          } else {
            var linkId = event.target.dataset.id;
            var buildId = "#link-status-" + linkId
            event.target.text = "Mark as Unread"
            $(buildId).text = 'Unread';
          }

        },
        error: function(xhr) {
          console.log(xhr.responseText)
        }
      });

    }
    console.log('link clicked');
  });

  $('#links').DataTable( {
    "order": [[ 3, "desc" ]]
  } );

});




