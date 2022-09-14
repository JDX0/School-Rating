<!DOCTYPE html>
<html lang="cs">

<head>
	<meta charset="UTF-8" />
	<title><?= $this->renderSection("title"); ?></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="icon" href="/static/icons/logo.jpg" />
	<link rel="stylesheet" href="static/styles/custom.css">
</head>


<body>
	<h1><?= $this->renderSection("header"); ?></h1>

	<?= $this->renderSection("content"); ?>
	<!--HodlJava reklama-->
	<?php
	if (!isset($_COOKIE["Hodl"])) {
		echo "
	<div id='ad'>
		<button onclick='closeAd()'>
			<h1>×</h1>
		</button>
		<a href='http://durgasoft.com'>
			<img id='ai' src='/static/images/ad.png'></img>
		</a>
	</div>";
		setcookie('Hodl', True, time() + 60 * 2, '/');
	}
	?>
	<script>
		function closeAd() {
			document.getElementById("ad").remove();
		}
	</script>
</body>

<footer>
	<h2>© 2022</h2>
</footer>
</html>
