<?= $this->extend("layouts/view"); ?>
<?= $this->section("title");
echo $info[0]->nazev . ' - Hodnocení Škol';
$this->endSection(); ?>
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
					<!-- Info -->
					<div class="card">
						<div class="card-content">
							<a href="school/', $skola->nazev, '">
								<img class="skola-img" src="/static/images/logos/' . $skola->fotografie . '"></img>
								<h1>', $skola->nazev, '</h1>
							</a>
							<p>', $skola->mesto_nazev, '</p>
							
							<a href="', $skola->link_skoly, '" >
								<div class="bright-button">
									<p >web</p>
								</div>
							</a>
							
							
						</div>
					</div>
					<!-- Comments -->
					<div class="card">
						<div class="card-content">
							<h1>Přidat hodnocení</h1>
							<p>Co si myslíte o této škole vy?</p>
							<form action="/school/', $skola->id, '/submit" method="post">
								<textarea name="commentText"></textarea>
								<input type="submit">
							</form>
						</div>
					</div>
					
				';
			}
			foreach ($comments as $comment) {
				echo '
					<div class="card">
						<div class="card-content">
							<h1>',$comment->text,'</h1>
							<p>cid=',$comment->id,'</p>
							<a href="/editComment/', $comment->id, '" >
								<div class="bright-button">
									<p>upravit</p>
								</div>
							</a>
						</div>
					</div>
					
				';
			}
			?>
		</div>
	</div>
</div>
<?= $this->endSection(); ?>