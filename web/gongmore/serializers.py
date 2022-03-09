from attr import field, fields
from rest_framework import serializers
from .models import Gongmore

class GongmoreSerializers(serializers.ModelSerializer):
    class Meta:
        model = Gongmore
        #fields = ('title', 'price', 'part', 'host', 'date', 'listdate')
        fields = ('__all__')
