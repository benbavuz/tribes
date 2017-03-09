$(document).ready(function() {
  $(document).on("click", '.modal-skills-opener', function() {
  //$('.modal-skills-opener').on("click",  function() {
    console.log("click");
    var modal = $(this).data("modal-target");
    console.dir(modal);
    $(modal).modal("open");
  });
});
