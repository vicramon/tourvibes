$(function() {
  $('.start').click( function() {
    $('.upload_status').show();
    $('.refresh_button').show();
  });

  $(function () {
    'use strict';

    $('#fileupload').fileupload({
      // Uncomment the following to send cross-domain cookies:
      //xhrFields: {withCredentials: true},
      url: '/uploads'
    });

    // // Enable iframe cross-domain access via redirect option:
    // $('#fileupload').fileupload(
    //   'option',
    //   'redirect',
    //   window.location.href.replace(
    //     /\/[^\/]*$/,
    //     '/cors/result.html?%s'
    //   )
    // );

    $('#fileupload').fileupload('option', {
      url: '/uploads',
      maxFileSize: 5000000,
      acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
      process: [
        {
          action: 'load',
          fileTypes: /^image\/(gif|jpeg|png)$/,
          maxFileSize: 20000000 // 20MB
      },
      {
        action: 'resize',
        maxWidth: 1440,
        maxHeight: 900
      },
      {
        action: 'save'
      }
      ]
    });

  });
});
