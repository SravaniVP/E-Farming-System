<div class="sidenav">
	<label style="color: green">Crops to be described:</label><br>
		<?php foreach($crops as $crop): ?>			
			<a href="<?php echo base_url(); ?>a_off/process1/<?php echo $crop['id']; ?>"><p class="b"><?php echo $crop['name']; ?></p></a>
		<?php endforeach; ?>
		<label style="color: green">Crops already described:</label>
		<?php foreach($cropsInfo as $crop): ?>
		  <?php if($u_id == $crop['ao_id']): ?>				
		  <p class="b"><?php echo $crop['name']; ?></p>
		  <?php endif; ?>
		<?php endforeach; ?>
</div>

<div class="main">
  <ul class="list-group">
    <?php foreach($cropsInfo as $crop): ?>
	      <li class="list-group-item">
			      <p class="a">
			      <?php echo $crop['name']; ?><br>
			  	  </p>
			      <?php echo $crop['text']; ?><br> 
			      <small style="color: grey">
			        Described by the Agricultural Officer:<br>
			        <?php echo $crop['firstname']; ?>       
			        <?php echo $crop['lastname']; ?><br>
			        <?php echo $crop['contact']; ?><br>
			        <?php echo $crop['localAddress']; ?><br>
			        <?php echo $crop['state']; ?><br>
			        <?php echo $crop['country']; ?><br>
			      </small>
			     <?php if(($u_id == $crop['ao_id']) and ($key == $crop['crop_id'])): ?>					
				<?php echo validation_errors('<div class="error">', '</div>'); ?>
				<?php echo form_open('a_off/update'); ?>  
				<?php foreach($specificCrop as $crop): ?>
				<input type="hidden" name="crop_id" value="<?php echo $crop['crop_id']; ?>">
				<input type="hidden" name="ao_id" value="<?php echo $crop['ao_id']; ?>">
		     	<div class="form-group">
				<label>Edit Process</label>			
				<textarea name="text" id="editor" rows="5"><?php echo $crop['text']; ?></textarea>		
				</div>
		   	    <button type="submit" class="btn btn-success btn-block">Submit</button>
	    		<?php endforeach; ?>
	    		<?php echo form_close(); ?>
	    		<?php endif; ?>
	   	  </li>
     <?php endforeach; ?>
  </ul>
</div>