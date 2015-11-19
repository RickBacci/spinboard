$(document).ready(function() {


  $("#searchInput").keyup(function () {

    var data = this.value.toUpperCase().split(" ");

    var rows = $("#links-table").find("tr");

    if (this.value == "") {
      rows.show();
      return;
    }
    rows.hide();

    rows.filter(function (i, v) {
      var $t = $(this);

      for (var d = 0; d < data.length; ++d) {
        if ($t.text().toUpperCase().indexOf(data[d]) > -1) {
          return true;
        }
      }
      return false;
    }) .show();

  }).focus(function () {
    this.value = "";
    $(this).css({
      "color": "black"
    });

    $(this).unbind('focus');

  }).css({
    "color": "#C0C0C0"
  });

});
