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
		<div class='modal is-active' id='ad'>
		<div class='modal-background'></div>
		<div class='modal-card'>
    <header class='modal-card-head'>
      <p class='modal-card-title'>Advertisement</p>
      <button onclick='closeAd()' class='delete' aria-label='close'></button>
    </header>
    <section class='modal-card-image'>
	<p class='image'>
	<img src='/static/images/ad.png' alt=''>
  </p>
    </section>
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