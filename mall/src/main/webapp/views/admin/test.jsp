<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
      margin: 0;
      height:5000px;
      font-family: Arial, sans-serif;
    }

    .navbar {
      background-color: #333;
      padding: 10px;
      color: #fff;
      text-align: center;
      position: fixed;
      top: -50px; /* 초기에는 상단 바 감춤 */
      width: 100%;
      transition: top 0.3s, height 0.3s; /* 부드러운 변화를 위한 트랜지션 설정 */
    }

    .content {
      padding: 20px;
      margin-top: 50px; /* 상단 바가 나타날 때 내용이 가려지지 않도록 여백 설정 */
    }

    .button-container {
      text-align: center;
      margin: 20px;
    }

    .changeTopButton, .changeSizeButton {
      padding: 10px;
      cursor: pointer;
    }
  </style>
</head>
<body>

<div class="navbar" id="navbar">
  <p>고정 상단바</p>
</div>

<div class="content">
  <p>내용이 여기에 들어갑니다. 반복되는 내용으로 채워졌습니다.</p>
</div>

<div class="button-container">
  <button class="changeTopButton" onclick="changeTopValue()">상단바 top 값 변경</button>
  <button class="changeSizeButton" onclick="changeNavbarSize()">상단바 크기 변경</button>
</div>

<script>
  // 초기 top 값
  var initialTop = -50;

  window.onscroll = function() {
    // 상단바 요소를 가져옵니다.
    var navbar = document.getElementById("navbar");

    // 현재 스크롤 위치를 가져옵니다.
    var scrollPosition = window.scrollY || document.documentElement.scrollTop;

    // 스크롤 위치가 1000 이상이면 상단바를 나타나게 하고, 그렇지 않으면 감춥니다.
    if (scrollPosition > 1000) {
      navbar.style.top = "0";
    } else {
      navbar.style.top = initialTop + "px";
    }
  };

  function changeTopValue() {
    // 상단바 요소를 가져옵니다.
    var navbar = document.getElementById("navbar");

    // 현재 top 값을 확인하고 변경합니다.
    var currentTop = parseInt(navbar.style.top) || initialTop;
    var newTop = (currentTop === 0) ? initialTop + "px" : "0";

    // top 값을 변경하고 애니메이션을 부드럽게 적용합니다.
    navbar.style.top = newTop;
  }

  function changeNavbarSize() {
    // 상단바 요소를 가져옵니다.
    var navbar = document.getElementById("navbar");

    // 현재 높이를 확인하고 변경합니다.
    var currentHeight = parseInt(navbar.style.height) || 50;
    var newHeight = (currentHeight === 50) ? "100px" : "50px";

    // 높이를 변경하고 애니메이션을 부드럽게 적용합니다.
    navbar.style.height = newHeight;
  }
</script>

</body>
</html>