<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header id="header">
		<div class="content-container">
			<h1 id="logo">
				<img src="../images/logo.png" />
			</h1>

			<section>
				<h1 class="hidden">헤더</h1>

				<nav id="main-menu" class="hr-menu">
					<h1>
						메인메뉴 <input type="button" value="클릭" id="btn-result">

					</h1>
					</h3>
					<ul>
						<li><a href="">학습가이드</a></li>
						<li><a href="">뉴렉과정</a></li>
						<li><a href="">강좌선택</a></li>
					</ul>
				</nav>

				<div id="lectur-serch-form">
					<h3 class="hidden">강좌검색폼</h3>
					<form>
						<fieldset>
							<legend class="hidden">검색 필드</legend>
							<label>과정검색</label> <input type="text" /> <input
								class="lecture-search-botton" type="button" value="검색" />
						</fieldset>


					</form>
				</div>

				<nav id="account-menu" class="hr-menu">
					<h1 class="hidden">
						계정메뉴
						</h3>
						<ul>
							<li class="first"><a href="../index.html">HOME</a></li>
							<li><a href="../joinus/login.html">로그인</a></li>
							<li><a href="../joinus/agree.html">회원가입</a></li>
						</ul>
				</nav>

				<nav id="member-menu" class="hr-menu">
					<h1 class="hidden">회원메뉴</h1>
					<ul>
						<li><a href="">마이페이지</a></li>
						<li><a href="">고객센터</a></li>
					</ul>

				</nav>
			</section>
		</div>
	</header>