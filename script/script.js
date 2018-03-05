(function() {
  'use strict';

  var $handler = $('#_draw-handler'),
      $drawer = $('#_drawer');

  $handler.on('click', function() {
    $handler.toggleClass('globalMenu__button--open');
    $drawer.toggleClass('globalMenu__list--open');
  });
})();
