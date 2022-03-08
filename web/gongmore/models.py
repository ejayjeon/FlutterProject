from django.db import models

# Create your models here.
class Gongmore(models.Model):
    title = models.CharField(max_length=100, primary_key=True)
    price = models.CharField(max_length=100)
    part = models.CharField(max_length=100)
    host = models.CharField(max_length=100)
    date = models.CharField(max_length=100)
    listdate = models.CharField(max_length=100)
