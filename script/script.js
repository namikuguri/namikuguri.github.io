(function() {
  'use strict';

  var $handler = $('#_draw-handler'),
      $drawer = $('#_drawer');

  $handler.on('click', function() {
    $handler.toggleClass('siteMenu__button--open');
    $drawer.toggleClass('siteMenu__list--open');
  });
})();
