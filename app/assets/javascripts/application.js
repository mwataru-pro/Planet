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
//= require infinite-scroll.pkgd.min


/* 新規投稿プレビュー表示 */

$(document).on('turbolinks:load', function() {

  /* 新規投稿プレビュー表示 */
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

  /* プロフィール画像プレビュー */
  $(function(){
    $('#user_profile_image').on('change', function (e) {
      var reader = new FileReader();
      reader.onload = function (e) {
          $(".profile_image").attr('src', e.target.result);
      }
      reader.readAsDataURL(e.target.files[0]);
  });
  });

  /* 新規記事投稿プレビュー表示 */
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

  /* topアニメーション */
  $(function () {
    setTimeout(function (){
      $(".head").addClass("animate__animated animate__swing");
    },800);
  });

});


$(function(){
  setTimeout("$('#notice').fadeOut('slow')", 5000);
});

/* メインビジュアル・アニメーション */

$(document).on('turbolinks:load', function() {
/*アニメーション用imgタグを全て取得*/
var frames = document.getElementsByClassName('anime')[0].getElementsByTagName('img');
/*アニメーション表示用の関数を呼び出す(引数はスライドの切り替え時間)*/
viewFrame(150);

  function viewFrame(msec, frame_no = -1)
  {
    /*現在のimgを消す*/
    if (frames[frame_no]) {
      frames[frame_no].style.display = 'none';
    }
    /*画像番号をカウントアップ*/
    frame_no++;
    if (frames[frame_no]) {
      frames[frame_no].style.display = 'block';
    } else {
      /*次の画像がなければ最初の画像を表示*/
      frames[0].style.display = 'block';
      frame_no = 0;
    }
    setTimeout(function(){viewFrame(msec, frame_no);}, msec);
    }
});

/* 崩壊アニメーション */

// $(document).on('turbolinks:load', function() {
// $(".button").click(function () {
//   // 1つ目に追加
//   $(".collapse1").addClass("animate__animated animate__backOutUp");
//   // 2つ目に追加（1秒後）
//   setTimeout(function () {
//     $(".collapse2").addClass("animate__animated animate__hinge");
//     $(".collapse3").addClass("animate__animated animate__hinge");
//   }, 1000);
//   setTimeout(function () {
//     $(".collapse4").addClass("animate__animated animate__hinge");
//     $(".collapse5").addClass("animate__animated animate__hinge");
//   }, 1400);
// });
// });

