$(document).ready(function() {

  $('tr.true').css({ 'color': 'red' })

  $('tr').on('click', function(event) {

    if (event.target.innerText === "Edit") {
      return
    } else {
      event.preventDefault();
    }

    var buttonText = event.target.text;
    var linkId = event.target.dataset.id;

    updateStatus(buttonText, linkId);

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

  // function updateIssueLabels() {
  //
  //   $.ajax({
  //     type: "POST",
  //
  //     url: '/update_issue_labels',
  //     data: { number: number },
  //
  //     success: function(post) {
  //       // success need to change the label name
  //     },
  //     error: function(xhr) {
  //       console.log(xhr.responseText)
  //     }
  //   })
  // }

});
