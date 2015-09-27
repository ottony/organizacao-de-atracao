$(document).ready(function() {
  var wall = new freewall("#attractions");

  wall.reset({
    selector: '.attraction',
    animate: true,
    cellH: 'auto',
    cellW: 'auto',
    onResize: function() {
      wall.refresh();
    }
  });

  wall.fitWidth();
});
