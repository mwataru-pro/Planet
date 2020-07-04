// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require popper
//= require bootstrap
//= require summernote/summernote-bs4.min
//= require summernote-init
//= require activestorage
//= require turbolinks
//= require_tree .

/* 新規投稿プレビュー表示 */

$(document).on('turbolinks:load', function() {
  $(function(){
      // inputのidから情報の取得:検証してinputのidを確認すると分かる
      $('#post_image_image').on('change', function (e) {
  // ここから既存の画像のurlの取得
      var reader = new FileReader();
      reader.onload = function (e) {
          $(".image").attr('src', e.target.result);
      }
  // ここまで
      reader.readAsDataURL(e.target.files[0]); //取得したurlにアップロード画像のurlを挿入
  });
  });
});

/* プロフィール画像プレビュー */
$(document).on('turbolinks:load', function() {
  $(function(){
    $('#user_profile_image').on('change', function (e) {
      var reader = new FileReader();
      reader.onload = function (e) {
          $(".profile_image").attr('src', e.target.result);
      }
      reader.readAsDataURL(e.target.files[0]);
  });
  });
});

/* 新規記事投稿プレビュー表示 */

$(document).on('turbolinks:load', function() {
  $(function(){
      // inputのidから情報の取得:検証してinputのidを確認すると分かる
      $('#article_article_image').on('change', function (e) {
  // ここから既存の画像のurlの取得
      var reader = new FileReader();
      reader.onload = function (e) {
          $(".article_image").attr('src', e.target.result);
      }
  // ここまで
      reader.readAsDataURL(e.target.files[0]); //取得したurlにアップロード画像のurlを挿入
  });
  });
});

$(function(){
  setTimeout("$('#notice').fadeOut('slow')", 5000);
});

$(document).on('turbolinks:load', function() {
var frames = document.getElementsByClassName('anime')[0].getElementsByTagName('img');
  viewFrame(150);

  function viewFrame(msec, frame_no = -1)
  {
    if (frames[frame_no]) {
      frames[frame_no].style.display = 'none';
    }
    frame_no++;
    if (frames[frame_no]) {
      frames[frame_no].style.display = 'block';
    } else {
      frames[0].style.display = 'block';
      frame_no = 0;
    }
    setTimeout(function(){viewFrame(msec, frame_no);}, msec);
    }
});