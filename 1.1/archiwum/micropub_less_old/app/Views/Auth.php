<!DOCTYPE html>

<html>
<div style="padding: 5% 30% 5% 15%">
				<div>
				<div style="width: 72px;height: 72px;border: double">
				<img src="<?php echo $logo ?>">
				</div>

				Allow <a href="<?php echo $who ?>"><?php print $name ?></a> access to <?php print $me ?> ?

				<a href="<?php echo $redirect ?>">YES</a>
				<br />
				<a href="<?php echo $who ?>">NO</a>
				</div>

			<div style="float: right">
			#{permissions}
			</div>
			</div>
</html>