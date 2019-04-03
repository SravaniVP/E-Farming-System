
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
  <?php echo validation_errors('<div class="error">', '</div>'); ?>
 <?php echo form_open('a_off/process1/'.$key); ?>
 <div class="well">  
     <h2 class="text-center" style="text-transform: capitalize;font-variant: small-caps;"><b><?= $cropname?> Description</b></h2>     
     	<div class="form-group">			
			<textarea name="text" id="editor" rows="5"></textarea>				
		</div>
    <button type="submit" class="btn btn-success btn-block">Submit</button>   
 </div>    
<?php echo form_close(); ?>

</div>


 



