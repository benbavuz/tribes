$(document).ready(function() {
  $(document).on("click", '.modal-skills-opener', function() {
    var modal_selector = $(this).data("modal-target");
    openModal(modal_selector);
  });

  $(document).on("click", '.modal-map-opener', function() {
    var trigger = $(this);

    var modalOptions = {
      ready: function(modal) {
        var handler = Gmaps.build('Google');

        handler.buildMap({ internal: { id: trigger.data("map-id") } }, function() {
          var markers = handler.addMarkers(trigger.data("map-markers"));
          handler.bounds.extendWith(markers);
          handler.fitMapToBounds();
          if (markers.length === 0) {
            handler.getMap().setZoom(2);
          } else if (markers.length === 1) {
            handler.getMap().setZoom(14);
          }
        });
      }
    };

    var modal_selector = $(this).data("modal-target");
    openModal(modal_selector, modalOptions);
  });


  var openModal = function(selector, options) {
    options = options || {};

    var modal = $(selector);
    modal.modal(options);
    modal.modal("open");
  };
});
