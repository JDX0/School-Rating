<?= $this->extend("layouts/view"); ?>
<?= $this->section("title"); echo $info[0]->nazev; $this->endSection(); ?>
<?= $this->section("header"); ?>
<?= $this->endSection(); ?>
<?= $this->section("content"); ?>
<!--<img src='/static/images/backgrounds/pozadi.jpg' style="position: fixed;right: 0;bottom: 0;width: 100%;height: 100%;z-index: -100;"></img>-->
<div class="center">
	<div class="column is-half">
		<div class="grid">
			<?php
			foreach ($info as $skola) {
				echo '
					<div class="card">
						<div class="card-content">
							<a href="school/', $skola->nazev, '">
								<img class="skola-img" src="/static/images/logos/' . $skola->fotografie . '"></img>
								<h1>', $skola->nazev, '</h1>
							</a>
							<p>', $skola->mesto_nazev, '</p>
							<a href="', $skola->link_skoly, '">web</a>
						</div>
					</div>
					
				';
			}
			?>
		</div>
	</div>
</div>
<?= $this->endSection(); ?>