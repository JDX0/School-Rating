<?= $this->extend("layouts/view"); ?>
<?= $this->section("title");
echo 'Upravit komentář '. $comments[0]->id . ' - Hodnocení Škol';
$this->endSection(); ?>
<?= $this->section("header"); ?>
<?= $this->endSection(); ?>
<?= $this->section("content"); ?>
<!--<img src='/static/images/backgrounds/pozadi.jpg' style="position: fixed;right: 0;bottom: 0;width: 100%;height: 100%;z-index: -100;"></img>-->
<div class="center">
	<div class="column is-half">
		<div class="grid">
			<?php
			foreach ($comments as $comment) {
				echo '
					<div class="card">
						<div class="card-content">
							<h1>Komentář č.'.$comment->id.'</h1>
							<p>Nový text:</p>
							<form action="/editComment/', $comment->id, '/submit" method="post">
								<textarea name="commentText">'.$comment->text.'</textarea>
								<input type="submit">
							</form>
						</div>
					</div>					
				';
			}
			?>
		</div>
	</div>
</div>
<?= $this->endSection(); ?>