// yourfeed.js
// = yourfeed
console.log("hello");

document.addEventListener('turbo:load', function() {

  // yourfeedが押されたとき
  const yourfeed = document.getElementById('yourfeed');
  yourfeed.addEventListener('click', function(e){
    e.preventDefault();
    console.log('hello');
    // your-feedクラスのdiv要素にもう1つ別のクラスをつける
    const showyourfeed = document.querySelector('.your-feed');
    showyourfeed.classList.add('show');

    // Global Feedは見えないようにする
    const showglobalfeed = document.querySelector('.global-feed');
    showglobalfeed.classList.remove('show');

    // タブの色を変える
    yourfeed.classList.add('active');
    const globalfeed = document.getElementById('globalfeed');
    globalfeed.classList.remove('active');
  });


  // globalfeedが押されたとき
  const globalfeed = document.getElementById('globalfeed');
  globalfeed.addEventListener('click', function(e){
    e.preventDefault();
    console.log('hello');
    // your-feedは非表示にする
    const showyourfeed = document.querySelector('.your-feed');
    showyourfeed.classList.remove('show');

    // Global Feedを表示する
    const showglobalfeed = document.querySelector('.global-feed');
    showglobalfeed.classList.add('show');

    // タブの色を変える
    yourfeed.classList.remove('active');
    const globalfeed = document.getElementById('globalfeed');
    globalfeed.classList.add('active');
  });

});