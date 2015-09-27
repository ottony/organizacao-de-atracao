$(document).ready(function() {
  var wall = new freewall("#attractions");

  wall.reset({
    selector: '.attraction',
    animate: true,
    cellH: 'auto',
    fixSize: 0,
    onResize: function() {
      wall.refresh();
    }
  });

  wall.fitWidth();
});
