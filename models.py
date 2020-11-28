from django.db import models

# Create your models here.
class Item(models.Model):
	itemid = models.IntegerField()
	itemname = models.CharField(max_length=50)
	ccode = models.CharField(max_length=50)
	bname = models.CharField(max_length=50)
	price= models.FloatField(max_length=20)
	des = models.CharField(max_length=50)
	qty = models.IntegerField()
	image = models.FileField(upload_to='pictures')
	class Meta:
		db_table = "item1"