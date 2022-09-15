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

	<!--HodlJava reklama-->
	<?php
	if (!isset($_COOKIE["Hodl"])) {
		echo "
		<div class='modal' id='ad'>
			<div class='modal-box'>
				<div class='modal-content border-thin-b'>
					<header class='modal-header'>
						<button class='round' onclick='closeAd()'>X</button>
					</header>
				</div>
				<div class='modal-content'>
					<a href='http://durgasoft.com'>
						<img class='modal-image' src='/static/images/ad.png' alt=''>
					</a>
				</div>
			</div>
	  	</div>";
		setcookie('Hodl', True, time() + 60 * 2, '/');
	}
	?>
	<script>
		function closeAd() {
			document.getElementById("ad").remove();
		}
	</script>
	<h1><?= $this->renderSection("header"); ?></h1>

	<?= $this->renderSection("content"); ?>
</body>

<footer>
	<h2>© 2022</h2>
</footer>

</html>