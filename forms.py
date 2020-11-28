from django import forms
from django.forms import CharField

from dynamic.models import Item


class ItemForm(forms.Form):
	itemname = forms.CharField(max_length=50)
	ccode = forms.CharField(max_length=50)
	bname= forms.CharField(max_length=50)
	price = forms.FloatField()
	des = forms.CharField(max_length=50)
	qty = forms.IntegerField()
	image = forms.FileField()
