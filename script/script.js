(function() {
  'use strict';

  var $handler = $('#_draw-handler'),
      $drawer = $('#_drawer');

  $handler.on('click', function() {
    $handler.toggleClass('toggleMenu__button--open');
    $drawer.toggleClass('toggleMenu__list--open');
  });
})();
