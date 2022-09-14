<?= $this->extend("layouts/view"); ?>
<?= $this->section("title"); ?>Šimanovo doupě<?= $this->endSection(); ?>
<?= $this->section("header"); ?>
<?= $this->endSection(); ?>
<?php
	helper('form');
?>
<?= $this->section("content"); ?>
<img src='/static/images/backgrounds/pozadi.jpg' style="position: fixed;right: 0;bottom: 0;width: 100%;height: 100%;z-index: -100;"></img>
<div>
	<h1><?= $count ?> schools annihilated by the supreme one</h1>
	<img src='/static/images/simmy.jpg'></img>
	<?php
		echo form_open('email/send');
		echo form_input('email', 'joe@example.com', ['placeholder' => 'Email Address...'], 'email');
		foreach($nazvy as $nazev) {
			$options[$nazev->id] = $nazev->nazev;
		}
		echo form_dropdown('schools', $options, '3');
		echo form_close()
	?>
</div>
<?= $this->endSection(); ?>
